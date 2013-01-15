//
//  AnimateViewController.h
//  Animate
//
//  Created by Seth  on 9/11/12.
//  Copyright (c) 2012 Seth . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimateViewController : UIViewController

{
    UIView *boxView;
    float scaleFactor;
    float angle;
}

@property (nonatomic, retain)UIView *boxView;

@end
