//
//  AnimateViewController.m
//  Animate
//
//  Created by Seth  on 9/11/12.
//  Copyright (c) 2012 Seth . All rights reserved.
//

#import "AnimateViewController.h"

@interface AnimateViewController ()

@end

@implementation AnimateViewController

@synthesize boxView = _boxView;

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGAffineTransform scaleTrans =
      CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    CGAffineTransform rotateTrans =
      CGAffineTransformMakeRotation(angle * M_PI / 180);
    boxView.transform = CGAffineTransformConcat(scaleTrans, rotateTrans);
    angle = (angle == 180 ? 360 : 180);
    scaleFactor = (scaleFactor == 2 ? 1 : 2);
    boxView.center = location;
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scaleFactor = 2;
    angle = 180;
    CGRect frameRect = CGRectMake(10, 10, 100, 100);
    boxView = [[UIView alloc] initWithFrame:frameRect];
    boxView.backgroundColor = [UIColor redColor];
    [self.view addSubview:boxView];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
