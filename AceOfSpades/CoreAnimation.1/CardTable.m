//
//  CardTable.m
//  CoreAnimation.1
//
//  Created by Seth Vernon on 12/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CardTable.h"
#import <QuartzCore/QuartzCore.h>

@implementation CardTable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	
	// the card table 
	UIView *cardTable = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
		cardTable.backgroundColor = [UIColor colorWithRed:0 green:0.6 blue:0.2 alpha:1];
		[self.window.rootViewController.view addSubview:cardTable];
	
	
	// the card
	CALayer *spadeAce = [[CALayer alloc] init];
		spadeAce.frame = CGRectMake(0, 0, 200, 275);
		spadeAce.cornerRadius = 7;
		spadeAce.position = cardTable.center;
		spadeAce.contentsGravity = kCAGravityCenter;
		spadeAce.anchorPoint = CGPointMake(0.5, 0.5);
		spadeAce.backgroundColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:1] CGColor];
		
		// implicit animation
	//	[CATransaction setAnimationDuration:1];
	//	spadeAce.transform = CATransform3DRotate(spadeAce.transform, M_PI/4.0, 0, 0, 1);
	
	// CABasicAnimation
	//CardLayer *cardLayer = (cardLayer *)self.spadeAce.layer;
	
	
		// capture start and end values
		CATransform3D startValue = spadeAce.transform;
		CATransform3D endValue = CATransform3DRotate(startValue, M_PI, 0, 1	, 0);
		
		// change the layer, without implicit animation
		[CATransaction setDisableActions:YES];
		spadeAce.transform = endValue;
		
		// construct the explicit animation
		CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
		animation.duration = 10;
		animation.repeatCount = 50;
		CAMediaTimingFunction *clunk = [CAMediaTimingFunction functionWithControlPoints:.9 :.1 :.7 :.9];
		animation.timingFunction = clunk;
		animation.fromValue = [NSValue valueWithCATransform3D:startValue];
		animation.toValue = [NSValue valueWithCATransform3D:endValue];
		
		//ask for the explicit animation
		[spadeAce addAnimation:animation forKey:nil];
			
	
	// the spade
	UIImage *spade = [UIImage imageNamed:@"Spade.png"];
		CGSize size = [spade size];
		UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width/3.5, size.height/3.5), NO, 0);
		[spade drawInRect:CGRectMake(0,0, size.width/3.5, size.height/3.5)];
		UIImage *smallSpade = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		spadeAce.contents = (id)[smallSpade CGImage];
		[cardTable.layer addSublayer:spadeAce];
			
	// the ace
    CATextLayer *ace = [[CATextLayer alloc] init];
	ace.string = @"A";
	ace.font = [UIColor blackColor];
    ace.fontSize = 0;
	ace.bounds = CGRectMake(0, 0, 30, 30);
	ace.position = CGPointMake(20, 20);
	[spadeAce addSublayer:ace];
    
    CATextLayer *aceUpsideDown = [[CATextLayer alloc] init];
    aceUpsideDown.string = @"A";
    aceUpsideDown.bounds = CGRectMake(0, 0, 40, 30);
	aceUpsideDown.position = CGPointMake(175, 255);
	aceUpsideDown.font = [UIFont fontWithName:@"Ariel" size:50];
	[aceUpsideDown setAffineTransform:CGAffineTransformMakeRotation(M_PI)];
//	aceUpsideDown.font = [UIColor blackColor];
//	transform = CATransform3DRotate(transform, M_PI, 0, 0, 1);
	[spadeAce addSublayer:aceUpsideDown];
	
	
	
	
	                                                                                    	
	 



		
	
	
	

}


@end
