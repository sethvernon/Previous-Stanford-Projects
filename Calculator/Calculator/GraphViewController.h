//
//  GraphViewController.h
//  Calculator
//
//  Created by Seth Vernon on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorViewController.h"

@class GraphViewController;
@protocol GraphViewDataSource
- (float)ProgramForGraphView:(GraphViewController *)sender;

@end

@interface GraphViewController : UIViewController

@property (nonatomic, weak) IBOutlet id <GraphViewDataSource> dataSource;


@end
