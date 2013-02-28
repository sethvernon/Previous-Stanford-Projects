//
//  PlayingCard.h
//  HouseOfCards
//
//  Created by seth on 2/1/13.
//  Copyright (c) 2013 Seth A. Vernon. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;


+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
