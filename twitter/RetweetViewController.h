//
//  RetweetViewController.h
//  twitter
//
//  Created by  on 8/14/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface RetweetViewController : UITableViewController

@property (nonatomic, weak) Tweet *tweet;

- (void)onReplyButton;
- (void)onFavoriteButton;


- (IBAction)operationPressed:(UIButton *)sender;

@end
