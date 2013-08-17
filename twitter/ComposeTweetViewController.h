//
//  ComposeTweetViewController.h
//  twitter
//
//  Created by  on 8/12/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeTweetViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextView *tweet;
@property (nonatomic, weak) id tweetId;

@end
