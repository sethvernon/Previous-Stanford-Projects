//
//  Deck.h
//  HouseOfCards
//
//  Created by seth on 2/1/13.
//  Copyright (c) 2013 Seth A. Vernon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
