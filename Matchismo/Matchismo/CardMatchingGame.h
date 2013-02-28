//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by seth on 2/11/13.
//  Copyright (c) 2013 CS193P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//////// ***Desiganted Initializer*** //////////
- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck; 

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@property (nonatomic) NSString *matchResults;


@end


