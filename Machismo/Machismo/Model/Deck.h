//
//  Deck.h
//  Machismo
//
//  Created by Katie on 2/5/13.
//  Copyright (c) 2013 AC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
