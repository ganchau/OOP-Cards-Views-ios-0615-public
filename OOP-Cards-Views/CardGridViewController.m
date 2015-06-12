//
//  CardGridViewController.m
//  OOP-Cards-Views
//
//  Created by Al Tyus on 2/18/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "CardGridViewController.h"

@interface CardGridViewController ()
@property (weak, nonatomic) IBOutlet UISlider *sliderButton;
@property (nonatomic) CGFloat padding;
@end

@implementation CardGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.padding = 20;
    self.sliderButton.minimumValue = 20;
    self.sliderButton.maximumValue = 30;
    self.sliderButton.value = self.padding;
    [self updateUI];
}

- (void)updateUI
{
    CGFloat cardAspectRatio = 0.75;  // 60:80 ratio
    //CGFloat rows = 4;
    CGFloat columns = 3;
    //CGFloat rowPads = rows + 1;
    CGFloat columnPads = columns + 1;
    
    //CGFloat deviceHeight = self.view.frame.size.height;
    CGFloat deviceWidth = self.view.frame.size.width;
    
    CGFloat cardWidth = (deviceWidth - (self.padding * columnPads)) / columns;
    CGFloat cardHeight = cardWidth / cardAspectRatio;
    //(deviceHeight - (self.padding * rowPads)) / rows; // use if card aspect ratio is not used
    
    CGFloat cardX = self.padding;
    CGFloat cardY = self.padding;
    
    NSUInteger cardCount = 0;
    
    for (UIView *cardView in self.cardsCollection)
    {
        if ([cardView isKindOfClass:[UIImageView class]])
        {
            NSLog(@"%fpts x %fpts", cardView.frame.size.width, cardView.frame.size.height);
            NSLog(@"x = %f x y = %f", cardView.frame.origin.x, cardView.frame.origin.y);
            
            CGRect cardRect = CGRectMake(cardX, cardY, cardWidth, cardHeight);
            cardView.frame = cardRect;
            cardX = cardX + cardWidth + self.padding;
            cardCount++;
            
            if (cardCount % 3 == 0) {
                cardX = self.padding;
                cardY = cardY + cardHeight + self.padding;
            }
        }
    }
    
    //UIImageView *card1 = self.cardsCollection[0];
    //UIImageView *card2 = self.cardsCollection[1];

}

- (IBAction)toggleButtonPressed:(id)sender
{
    self.padding = (self.padding == 20) ? 30 :20;
    self.sliderButton.value = self.padding;
    [self updateUI];
}

- (IBAction)sliderMoved:(id)sender
{
    self.padding = self.sliderButton.value;
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
