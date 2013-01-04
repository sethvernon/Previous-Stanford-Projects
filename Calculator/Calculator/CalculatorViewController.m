//
//  CalculatorViewController.m
//  Calculator
//
//  Created by seth n cara on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
#import "AxesDrawer.h"
#import "GraphViewController.h"


@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL userIsTypingFloaingPointNumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@property (nonatomic, strong) id testVariableValues;

//@property (nonatomic, weak) IBOutlet GraphView *GraphView;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize calculation = _calculation;
@synthesize variables = _variables;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize userIsTypingFloaingPointNumber = _userIsTypingFloaingPointNumber;
@synthesize brain = _brain;
@synthesize testVariableValues = _testVariableValues;

//@synthesize GraphView = _GraphView;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue 
{
    if ([segue.identifier isEqualToString:@"showGraph"]) {
        UIViewController *GraphViewController = segue.destinationViewController; 
    }
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
                                                 
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text
                             stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

/* -(void)synchronizeView 
{
    // Find the result by running the program passing in the test variable values
    id result = [CalculatorBrain runProgram:self.brain.program
                        usingVariableValues:self.testVariableValues];
    
    // If the result is a string, then display it, otherwise get the Number's description
    if ([result isKindOfClass:[NSString class]]) self.display.text = result;
    else self.display.text = [NSString stringWithFormat:@"%g", [result doubleValue]];
    
    // Now the calculatio label, from the latest description of program
    self.calculation.text [CalculatorBrain descriptionOfProgram:self.brain program]; 
    
    self.variables.text = [[[[[[self programVariableValues] description]
                               stringByReplacingOccurrencesOfString:@"{" with String:@""]
                              stringByReplacingOccurrencesOfString:@"}" with String:@""]
                             stringByReplacingOccurrencesOfString:@";" with Stri:ng:@""]
                         //     stringByReplacingOccurrencesOfString:@"\"" with String:@""]
                            stringByReplacingOccurrencesOfString:@"<null>" with String:@"0"];

    // and the user isn't in the middle of entering a number
    self.userIsInTheMiddleOfEnteringANumber = NO; 
} */

- (void)appendToCalculation:(NSString *)text 
{
 //   self.calculation.text = [self.calculation.text stringByReplacingOccurrencesOfString:@"= "
    self.calculation.text = [self.calculation.text stringByAppendingString:
    [NSString stringWithFormat:@"%@ ", text]];
}

- (IBAction)enterPressed 
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    [self appendToCalculation:self.display.text];
    self.userIsInTheMiddleOfEnteringANumber = NO;    
}

- (IBAction)operationPressed:(id)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    [self appendToCalculation:[operation stringByAppendingString:@" ="]];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)dotPressed 
{
    if (_userIsTypingFloaingPointNumber)
        return;
    self.userIsInTheMiddleOfEnteringANumber = YES;
    self.userIsTypingFloaingPointNumber = YES;
    self.display.text =  [self.display.text stringByAppendingString:@"."];
}

- (IBAction)clearPressed 
{
    [self.brain clear]; 
    self.display.text = @"0";
    self.calculation.text = @"";
    self.userIsInTheMiddleOfEnteringANumber = NO;
}
- (IBAction)backspacePressed 
{
    self.display.text = [self.display.text substringToIndex:[self.display.text length] - 1];
    if ([self.display.text isEqualToString:@""] || [self.display.text isEqualToString:@"-"]) {
        self.display.text = @"0";
        self.userIsInTheMiddleOfEnteringANumber = NO;
    }
}

- (IBAction)variablePressed:(UIButton *)sender 
{
    [self.brain pushVariable:sender.currentTitle];
  //  [self synchronizeView];
}


- (IBAction)testPressed 
{
    CalculatorBrain *testBrain = [self brain];
    
    // Setup the brain
    [testBrain pushVariable:@"a"];
    [testBrain pushVariable:@"a"];
    [testBrain pushVariable:@"*"];
    [testBrain pushVariable:@"b"];
    [testBrain pushVariable:@"b"];
    [testBrain pushVariable:@"*"];
    [testBrain pushVariable:@"+"];
    [testBrain pushVariable:@"sqrt"];
    
    // Test a
    // [testBrain empty];
    [testBrain pushOperand:3];
    [testBrain pushOperand:5];
    [testBrain pushOperand:6];
    [testBrain pushOperand:7];
    [testBrain pushOperation:@"+"];
    [testBrain pushOperation:@"*"];
    [testBrain pushOperation:@"-"];
    
    // Test b
    [testBrain pushOperand:3];
    [testBrain pushOperand:5];
    [testBrain pushOperation:@"+"];
    [testBrain pushOperation:@"sqrt"];
    
    // Test c
    [testBrain pushOperand:3];
    [testBrain pushOperation:@"sqrt"];
    [testBrain pushOperation:@"sqrt"];
    
    // Test d
    [testBrain pushOperand:3];
    [testBrain pushOperand:5];
    [testBrain pushOperation:@"sqrt"];
    [testBrain pushOperation:@"+"];
    
    // Test e
    [testBrain pushOperation:@"?"];
    [testBrain pushVariable:@"r"];
    [testBrain pushVariable:@"r"];
    [testBrain pushOperation:@"*"];
    [testBrain pushOperation:@"*"];
    
    // Test f
    [testBrain pushVariable:@"a"];
    
    
     
      
    
    // Retrieve the program
    NSArray *program = testBrain.program;
    
    // Setup the ditionary
    NSDictionary *dictionary =
    [NSDictionary dictionaryWithObjectsAndKeys:
    [NSNumber numberWithDouble:3], @"a",
    [NSNumber numberWithDouble:4], @"b", nil];
    
    // Run the program with the variables
    NSLog(@"Running the pogram with variables returns the value %g",
          [CalculatorBrain runProgram:program usingVariableValues:dictionary]);
    
    // List the variables in program
    NSLog(@"Variables in program are %@",
          [[CalculatorBrain variablesUsedInProgram:program] description]);

}

- (IBAction)test1Pressed 
{
  /*  self.testVariablesValues = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithDouble:-4], @"x",
                                [NSNumber numberWithDouble:3], @"a",
                                [NSNumber numberWithDouble:4], @"b", nil];
    [self synchronizeView]; */
}

- (IBAction)test2Pressed 
{
    self.testVariableValues = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithDouble:-5], @"x", nil];
}

- (IBAction)test3Pressed 
{
    self.testVariableValues = nil;
  //  [self synchronizeView];
}

- (void)viewDidUnload {
    [self setCalculation:nil];
    [self setVariables:nil];
    [super viewDidUnload];
}
@end