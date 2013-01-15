//
//  SailBoatView.m
//  Ch17.3
//
//  Created by Seth Vernon on 12/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SailBoatView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SailBoatView

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
/*+ (Class) layerClass
{
	return [sailboatLayer class];
}
*/
	
	// create the ocean view and corresponding layer.
	UIView *oceanView = self.window.rootViewController.view;
    CALayer *oceanLayer = [[CALayer alloc]init];
	oceanLayer.frame = CGRectMake(0, 0, 320, 460);
	oceanLayer.backgroundColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:1] CGColor];
	[oceanView.layer addSublayer:oceanLayer];
	

    // create the sailboat view and corresponding layer.
	CALayer *sailboatLayer = [[CALayer alloc]init];
	sailboatLayer.frame = CGRectMake(200, 20, 100, 100);
	sailboatLayer.backgroundColor = [[UIColor colorWithRed:0 green:.4 blue:.8 alpha:1] CGColor];
	[oceanView.layer addSublayer:sailboatLayer];
	UIImage *boat = [UIImage imageNamed:@"gg5002370.jpg"];	
	sailboatLayer.contents = (id)[boat CGImage];
	
	
	// First Animation of Group Animation.
	// run the animation that makes the boat move top to bottom of screen.
	CGFloat h = 200;
	CGFloat v = 75;
	CGMutablePathRef path = CGPathCreateMutable();
	int leftright = 1;
	CGPoint next = sailboatLayer.position;
	CGPoint pos;
	CGPathMoveToPoint(path, NULL, next.x, next.y);
	for (int i = 0; i < 4; i++) {
		pos = next;
		leftright *= -1;
			next = CGPointMake(pos.x+h*leftright, pos.y+v);
			CGPathAddCurveToPoint(path, NULL, pos.x, pos.y+30, next.x, next.y-30, next.x, next.y);
}


	CAKeyframeAnimation *bezierAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	bezierAnimation.path = path;
	bezierAnimation.calculationMode = kCAAnimationPaced;
	
	
	// Second Animation of Group Animation
	NSArray *reversals = [NSArray arrayWithObjects:
							[NSNumber numberWithFloat:0],
							[NSNumber numberWithFloat:M_PI],
							[NSNumber numberWithFloat:0],
							[NSNumber numberWithFloat:M_PI],
							nil];
	CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	rotateAnimation.values = reversals;
	rotateAnimation.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateY];
	rotateAnimation.calculationMode = kCAAnimationDiscrete;
	
	// Third Animation of Group Animation
	NSArray *boatpitches = [NSArray arrayWithObjects: 
									[NSNumber numberWithFloat:0],
									[NSNumber numberWithFloat:M_PI/60.0],
									[NSNumber numberWithFloat:0],
									[NSNumber numberWithFloat:M_PI/60.0],
									[NSNumber numberWithFloat:0],
									nil];
									
	CAKeyframeAnimation * boatpitchesAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	boatpitchesAnimation.values = boatpitches;
	boatpitchesAnimation.repeatCount = HUGE_VALF;
	boatpitchesAnimation.duration = 0.5;
	boatpitchesAnimation.additive = YES;
	boatpitchesAnimation.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
	
		
	// Group the Animation
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithObjects:bezierAnimation, rotateAnimation,
						boatpitchesAnimation, nil];
	group.duration = 8;
	[sailboatLayer addAnimation:group forKey:nil];
	[CATransaction setDisableActions:YES];
	sailboatLayer.position = next;
	
	
}


@end
