//
//  GraphView.h
//  Calculator
//
//  Created by Seth Vernon on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView

+ (void)drawAxesInRect:(CGRect)bounds
         originAtPoint:(CGPoint)axisOrigin
                 scale:(CGFloat)pointsPerUnit;

@end
