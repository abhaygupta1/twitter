//
//  RetweetButtonCell.m
//  twitter
//
//  Created by  on 8/14/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "RetweetButtonCell.h"
#import "ComposeTweetViewController.h"

@implementation RetweetButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)operationPressed:(UIButton *)sender {
    NSLog(@"xxxButton Pressed %@ ***", sender.titleLabel.text);
   if ([sender.titleLabel.text isEqualToString:@"Reply"]) {
       [self.viewController onReplyButton];
    }
   else if ([sender.titleLabel.text isEqualToString:@"Favorite"]) {
       [self.viewController onFavoriteButton];
   }
}




@end
