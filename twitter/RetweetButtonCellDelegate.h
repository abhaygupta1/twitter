//
//  RetweetButtonCellDelegate.h
//  twitter
//
//  Created by  on 8/17/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RetweetButtonCellDelegate <NSObject>

- (void)onReplyButton;
- (void)onFavoriteButton;
- (void)onRetweetButton;

@end
