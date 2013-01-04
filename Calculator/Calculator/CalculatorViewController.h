//
//  CalculatorViewController.h
//  Calculator
//
//  Created by seth n cara on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

- (void)appendToCalculation:(NSString *)text;

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *calculation;
@property (weak, nonatomic) IBOutlet UILabel *variables;


@end
