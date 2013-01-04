//
//  GraphViewController.m
//  Calculator
//
//  Created by Seth Vernon on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphViewController.h"
#import "GraphView.h"




@interface GraphViewController ()

@property (nonatomic, weak)IBOutlet GraphView *graphView;

@end

@implementation GraphViewController

@synthesize graphView = _graphView;
@synthesize dataSource = _dataSource;

-(void)setDataSource:(id<GraphViewDataSource>)dataSource:(GraphView *)graphView;
{
    _dataSource = dataSource;
    [self.graphView setNeedsDisplay];
    
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showGraph"]) {
        UIViewController *newController = segue.destinationViewController;
    }
}*/

@end
