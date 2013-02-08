//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Katie on 2/6/13.
//  Copyright (c) 2013 AC. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@end


@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            }else {
                self.cards[i] = card;
            }
        }
        
    }
    return self;
}

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2


- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil ;
}

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable){
        if (!card.isFaceUp){
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) { //making both card unplayable
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        otherCard.faceup = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.score++; // to compensate the flipCost as player just got panelty
                    }
                    break;
                }
            }
            if(!card.isFaceUp){
              self.score -= FLIP_COST;  
            }
            
        }
        card.faceup = !card.isFaceUp;
    }
    
}

@end
