//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Seth Vernon on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;
-(void)clear;
-(void)pushVariable:(NSString *)variable;
-(void)pushOperation:(NSString *)operation;
// -(void)synchronizeView;
-(NSDictionary *)programVariableValues;
-(void)removeLastItem;

@property (readonly) id program;


+ (double)runProgram:(id)program;
+ (double)runProgram:(id)program
 usingVariableValues:(NSDictionary *)variableValues;

+ (NSString *)descriptionOfProgram:(id)program;
+ (BOOL)isOperation:(NSString *)operation;
+ (NSSet *)variablesUsedInProgram:(id)program;
+ (BOOL)isValidProgram:(id)program;
+ (NSString *)descriptionOffTopOfStack:(NSMutableArray *)stack;
+ (NSString *)deBracket:(NSString *)expression;
// + (NSDictionary *)testVariableValues;

@end
