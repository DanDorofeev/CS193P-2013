//
//  CardGameViewController.m
//  Machismo
//
//  Created by Katie on 2/5/13.
//  Copyright (c) 2013 AC. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController

- (IBAction)flipCard:(UIButton *)sender
{
    sender.Selected = !sender.isSelected;
}

@end
