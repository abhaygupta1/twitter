//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (id)tweetId {
    return [self.data valueOrNilForKeyPath:@"id"];
}


- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)name {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}

- (NSString *)image {
    return [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
