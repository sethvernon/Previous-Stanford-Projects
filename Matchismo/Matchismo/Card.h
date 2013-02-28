//
//  Card.h
//  HouseOfCards
//
//  Created by seth on 2/1/13.
//  Copyright (c) 2013 Seth A. Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUP;
@property (nonatomic, getter = isUnPlayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;
@end
