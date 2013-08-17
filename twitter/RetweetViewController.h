//
//  RetweetViewController.h
//  twitter
//
//  Created by  on 8/14/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "RetweetButtonCellDelegate.h"


@interface RetweetViewController : UITableViewController <RetweetButtonCellDelegate>

@property (nonatomic, weak) Tweet *tweet;

@end
