//
//  Card.h
//  Machismo
//
//  Created by Katie on 2/5/13.
//  Copyright (c) 2013 AC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString * contents;
@property(nonatomic, getter=isFaceUp) BOOL faceup;
@property(nonatomic, getter=isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
