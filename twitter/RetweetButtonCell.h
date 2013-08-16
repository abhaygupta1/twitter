//
//  RetweetButtonCell.h
//  twitter
//
//  Created by  on 8/14/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RetweetViewController.h"

@interface RetweetButtonCell : UITableViewCell
- (IBAction)operationPressed:(UIButton *)sender;

@property (nonatomic, weak) RetweetViewController *viewController;

@end
