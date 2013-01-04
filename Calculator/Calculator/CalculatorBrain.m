//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Seth Vernon on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;


@end


@implementation CalculatorBrain

@synthesize programStack =_programStack;


- (NSMutableArray *)programStack
{
    if (_programStack == nil)_programStack = [[NSMutableArray alloc] init]; 
    return _programStack;
}

- (NSDictionary *)programVariableValues;
{
    // Find the variables in the current program in the brain as an array
    NSArray *variableArray = [[CalculatorBrain variablesUsedInProgram:self.program] allObjects];
    
    // Return a description of a dictionary which contains keys and values for the keys
    // that are in the variable array
    return [self dictionaryWithValuesForKeys:variableArray];
}

-(void)removeLastItem
{
    [self.programStack removeLastObject];
}

- (void)clear;
{
    [self.programStack removeAllObjects];
}

- (void)pushOperand:(double)operand;
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

-(void)pushVariable:(NSString *)variable
{
    [self.programStack addObject:variable];  
}

- (double)performOperation:(NSString *)operation;
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
} 

-(void)pushOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
}
- (id)program
{
    return [self.programStack copy];
}

+ (BOOL)isValidProgram:(id)program
{
    // it's valid if it's an NSArray
    return [program isKindOfClass:[NSArray class]];
}
+ (NSString *)deBracket:(NSString *)expression;
{
    NSString *description = expression;
    
    // Check to see if the there is a bracket at the start and end of the expression
    // if so, then strip the description of these brackets and return.
    if ([expression hasPrefix:@"("] && [expression hasSuffix:@")"]) {
        description = [description substringFromIndex:1];
        description = [description substringToIndex:[description length] -1];
    }
    
    // Also need to do final check, to cover the case where removing the brackets 
    // results in a + b) * (c + d. Have a look at the position of the brackets and
    // if there is a ) before a (, then we need to revert back expression
    NSRange openBracket = [description rangeOfString:@"("];
    NSRange closeBracket = [description rangeOfString:@")"];
    
    if (openBracket.location <= closeBracket.location) return description;
    else return expression;
    
    {
        
    }
    
    
}

+ (BOOL)isNoOperandOperation:(NSString *)operation {
     // The set of operations requiring no operands
     NSSet * operationSet = [NSSet setWithObjects:@"?",nil];
     return [operationSet containsObject:operation];
}

+ (BOOL)isOneOperandOperation:(NSString *)operation {
     // The set of operations requiring one operands
     NSSet * operationSet = [NSSet setWithObjects:@"sin",@"cos",@"sqrt",@"±",nil];
     return [operationSet containsObject:operation];
}

+ (BOOL)isTwoOperandOperation:(NSString *)operation {
     // The set of operations requiring two operands
     NSSet * operationSet = [NSSet setWithObjects:@"+",@"-",@"*",@"/",nil];
     return [operationSet containsObject:operation];
}

+ (BOOL)isOperation:(NSString *)operation { 
     
     // Check to see if it's in any of our operation sets
     return 
     [self isNoOperandOperation:operation] ||
     [self isOneOperandOperation:operation]||
    [self isTwoOperandOperation:operation];
}

+ (NSString *)descriptionOffTopOfStack:(NSMutableArray *)stack {
     
     NSString *description;
    
     // Retrieve and remove the object at the top of the stack 
     id topOfStack = [stack lastObject];
     if (topOfStack) [stack removeLastObject]; else return @"";
     
     // If the top of stack is an NSNumber then just return it as a NSString
     if ([topOfStack isKindOfClass:[NSNumber class]]) {
        return [topOfStack description];
         }  
     // but if it's an NSString we need to do some formatting
     else if ([topOfStack isKindOfClass:[NSString class]]) { 
         // If top of stack is a no operand operation, or it's a variable then we
         // want to return description in the form "x"
         if (![self isOperation:topOfStack] ||
                    [self isNoOperandOperation:topOfStack]) { 
             description = topOfStack;
            } 
        // If the top of stack is one operand operation, then we want to return an
        // expression in the form "f(x)"
        else if ([self isOneOperandOperation:topOfStack]) {
             // We need to remove any outside brackets on the recursive description
             // because we are going to put some new brackets on.
             NSString *x = [self deBracket:[self descriptionOffTopOfStack:stack]];
             description = [NSString stringWithFormat:@"%@(%@)", topOfStack, x]; 
             }
         // If the top of stack is a two operand operation then we want to return
         // an expression in the form "x op. y".
        else if ([self isTwoOperandOperation:topOfStack]) {
             NSString *y = [self descriptionOffTopOfStack:stack];
             NSString *x = [self descriptionOffTopOfStack:stack];
             
             // If the top of stack is For + and - we need to add brackets so that
             // we support precedence rules.  
             if ([topOfStack isEqualToString:@"+"] || 
                            [topOfStack isEqualToString:@"-"]) {  
                 // String any existing brackets, before re-adding
                 description = [NSString stringWithFormat:@"(%@ %@ %@)",
                                               [self deBracket:x], topOfStack, [self deBracket:y]];
                 } 
            // Otherwise, we are dealing with * or / so no need for brackets
             else {
                 description = [NSString stringWithFormat:@"%@ %@ %@",
                                                x, topOfStack ,y];
                 }
             }  
        }
     return description ;
}


+ (NSString *)descriptionOfProgram:(id)program {
    
    // Check program is valid and if not return message
     if (![self isValidProgram:program]) return @"Invalid program!";
     
     NSMutableArray *stack= [program mutableCopy];
     NSMutableArray *expressionArray = [NSMutableArray array];
     
     // Call recursive method to describe the stack, removing superfluous brackets at the
     // start and end of the resulting expression. Add the result into an expression array
     // and continue if there are still more items in the stack. 
     // our description Array, and if the 
     while (stack.count > 0) {
         [expressionArray addObject:[self deBracket:[self descriptionOffTopOfStack:stack]]];
         }
     
     // Return a list of comma seperated programs
     return [expressionArray componentsJoinedByString:@","];
}

+ (double)popOperandOffStack:(NSMutableArray *)stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]]) {
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStack;
        if ([operation isEqualToString:@"+"]) {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } else if ([@"*" isEqualToString:operation]) {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        } else if ([operation isEqualToString:@"-"]) {
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
        } else if ([operation isEqualToString:@"/"]) {
            double (divisor) = [self popOperandOffStack:stack];
            if (divisor) result = [self popOperandOffStack:stack] / divisor;
        } else if ([@"sin" isEqualToString:operation]) {
            result = sin([self popOperandOffStack:stack]);
        } else if ([@"cos" isEqualToString:operation]) {
            result = cos([self popOperandOffStack:stack]);
        } else if ([@"sqrt" isEqualToString:operation]) {
            result = sqrt([self popOperandOffStack:stack]);
        } else if ([@"π" isEqualToString:operation]) {
            result = M_PI;
        }

    }
    
    return result;
}

+ (double)runProgram:(id)program
{
    /*NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
     */
    
    // Call the new runProgram method with a nil dictionary
    return [self runProgram:program usingVariableValues:nil];
    
}


+ (double)runProgram:(id)program
 usingVariableValues:(NSDictionary *)variableValues 
{
    // Ensure program is an NSArray
    if (![program isKindOfClass:[NSArray class]]) return 0;
    
    
    NSMutableArray *stack = [program mutableCopy]; 
    
    // For each item in the program
    for (int i=0; i < [stack count]; i++) {
        id obj = [stack objectAtIndex:i];
        
        // See whether we think the item is a variable
        
        if ([obj isKindOfClass:[NSString class]] && ![self isOperation:obj]) {
            id value = [variableValues objectForKey:obj];
            
            // If value is not an instance of NSNumber, set it to zero    
            if (![value isKindOfClass:[NSNumber class]]) {
                value = [NSNumber numberWithInt:0];
            }
            // Replace program variable with value
            [stack replaceObjectAtIndex:i withObject:value];
        }
    }
    // Starting popping off the stack
    return [self popOperandOffStack:stack];
}

+ (NSSet *)variablesUsedInProgram:(id)program 
{
        // Ensure program is an array
    if(![program isKindOfClass:[NSArray class]]) return nil;
    NSMutableSet *variables = [NSMutableSet set];
        // For each item in the program
    for (id obj in program) {
        // if we think it's a variable add it to the variables set
        if ([obj isKindOfClass:[NSString class]] && ![self isOperation:obj]){
            [variables addObject:obj];
        }
    }
    // Return nil if we don't have any variables
    if ([variables count] ==0)return nil; else return [variables copy];
}
    
@end
