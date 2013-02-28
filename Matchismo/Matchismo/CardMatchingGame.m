//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by seth on 2/11/13.
//  Copyright (c) 2013 CS193P. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards; //// Of Class Card
@property (nonatomic, readwrite) int score;


@end

@implementation CardMatchingGame

- (NSString *) matchResults
{
    if (!_matchResults) _matchResults = [[NSString alloc] init];
    return _matchResults;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isUnPlayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnPlayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        self.matchResults = [NSString stringWithFormat:@"Matched %@ and %@ For %d Points!", card.contents, otherCard.contents, matchScore];
                        
                    } else {
                        otherCard.faceUP = NO;
                        self.score -= MISMATCH_PENALTY;
                        
                        
                        self.matchResults = [NSString stringWithFormat:@"%@ and %@ Don't Match! %d Pount Penalty", card.contents, otherCard.contents, MISMATCH_PENALTY];
                        
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUP = !card.isFaceUp;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


///// *** Designated Initializer *** ///////
- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck 
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
        
    }
    
    return self;
        
}

























@end
