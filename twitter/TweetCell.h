//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *name;

@property (nonatomic, weak) IBOutlet UILabel *tweet;
@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;

@end
