//
//  RotatableViewController.m
//  Psychologist
//
//  Created by Cara Ellis on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RotatableViewController.h"
#import "SplitViewBarButtonItemPresenter.h"

@implementation RotatableViewController

- (void)awakeFromNib 
{
    [super awakeFromNib];
    self.splitViewController.delegate = self;
}

- (id <SplitViewBarButtonItemPresenter>)splitViewBarButtonItemPresenter
{
    id detailVC = [self.splitViewController.viewControllers lastObject];
    if (![detailVC conformsToProtocol:@protocol(SplitViewBarButtonItemPresenter)]) {
        detailVC = nil;
    }
    return detailVC;
}

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return [self splitViewBarButtonItemPresenter] ? UIInterfaceOrientationIsPortrait(orientation) : NO;
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = self.title;
    [self splitViewBarButtonItemPresenter].splitViewBarButtonItem = barButtonItem;
    // Tell the detail view to put the button up 
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self splitViewBarButtonItemPresenter].splitViewBarButtonItem = nil; 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
