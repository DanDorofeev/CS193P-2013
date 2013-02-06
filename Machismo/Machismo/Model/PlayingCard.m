//
//  PlayingCard.m
//  Machismo
//
//  Created by Katie on 2/5/13.
//  Copyright (c) 2013 AC. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


- (void)setSuit:(NSString *)suit
{
    if([@[@"♥",@"♦",@"♠",@"♣"] containsObject:suit]){
        suit = suit ;
    }
}


- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

@end
