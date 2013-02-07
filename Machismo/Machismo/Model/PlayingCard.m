//
//  PlayingCard.m
//  Machismo
//
//  Created by Katie on 2/5/13.
//  Copyright (c) 2013 AC. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize  suit = _suit; //because we provide setter and getter

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    //HW1 is making more cards to match.
    //we can make trail of card to be match either by suit or rank
    // use stack to store card and as long as they are matching.
    // 
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }else if (otherCard.rank == self.rank){
            score = 4;
        }
    }
    
    
    return score; //if none of above true it returns Zero
}

- (NSString *)contents
{
    
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}


- (void)setSuit:(NSString *)suit //Setter for suit
{
    if([@[@"♥",@"♦",@"♠",@"♣"] containsObject:suit]){
        _suit = suit ;
    }
}


- (NSString *) suit //Getter for suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",];
}

+ (NSUInteger)maxRank { return [self rankStrings].count -1 ;}

- (void)setRank:(NSUInteger)rank
{
    if( rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
        
}
@end
