//
//  CardGameViewController.m
//  Machismo
//
//  Created by Katie on 2/5/13.
//  Copyright (c) 2013 AC. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
//#import <AudioToolbox/AudioToolbox.h> import audio framwork

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeButton;
@property (strong,nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation CardGameViewController


- (CardMatchingGame *)game
{
   if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                         usingDeck:[[PlayingCardDeck alloc]init]];
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)updateUI
{
    for(UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0 ; //changing alpha to 30% if
                                                          //card become unplayable
        //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        //TODO : place holder for single vibration
    }
    self.statusLabel.text = @"status is updated";
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
   // UIButton *cardButton;
   // Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
   // if (!card.isFaceUp) {
        self.flipCount++; //TODO: flip count should not increase when facing card down
   // }
    
    [self updateUI];
    
}


- (IBAction)redeal:(UIButton *)sender

{
    UIAlertView *redealAlert = [[UIAlertView alloc] initWithTitle:@"Confirmation !"
                                                          message:@"Do you want to reset game?"
                                                         delegate:self
                                                cancelButtonTitle:@"No"
                                                otherButtonTitles:@"Yes", nil];
    [redealAlert show];
    
}

-(void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)
    {
        self.game = nil;
        self.flipCount = 0;
        [self updateUI];
    }
}


@end
