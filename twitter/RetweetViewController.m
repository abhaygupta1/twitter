//
//  RetweetViewController.m
//  twitter
//
//  Created by  on 8/14/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "RetweetViewController.h"
#import "RetweetButtonCellDelegate.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "RetweetButtonCell.h"
#import "ComposeTweetViewController.h"
#import "ReplyCell.h"
#import "AFNetworking.h"


@interface RetweetViewController ()



@end

@implementation RetweetViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    UINib *customNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"TweetCell"];
    customNib = [UINib nibWithNibName:@"RetweetButtonCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"RetweetButtonCell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:{
            static NSString *CellIdentifier = @"TweetCell";
            TweetCell *tweetCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (tweetCell == nil) {
                tweetCell = [[TweetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            tweetCell.name.text = self.tweet.name;
            tweetCell.tweet.text = self.tweet.text;
            [tweetCell.profileImageView setImageWithURL:[NSURL URLWithString:self.tweet.image]];
            NSLog(@"The tweet id is %@", self.tweet.tweetId);
            cell = tweetCell;
            break;
        }
        case 1:{
            static NSString *CellIdentifier = @"RetweetButtonCell";
            RetweetButtonCell *retweetButtonCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (retweetButtonCell == nil) {
                retweetButtonCell = [[RetweetButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            retweetButtonCell.delegate = self;
            cell = retweetButtonCell;
            break;
        }

    }
    
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    switch (indexPath.row) {
        case 0: {
            Tweet *tweet = self.tweet;
            CGSize size = [tweet.text sizeWithFont:[UIFont fontWithName:@"Helvetica" size:10] constrainedToSize:CGSizeMake(240, 999) lineBreakMode:NSLineBreakByWordWrapping];
            height = MAX(size.height + 10 + 10, 50);
            break;
        }
        case 1: {
            height = 30;
            break;
        }

        default: height = 0;
    }
    NSLog(@"%f", height);

    return height;
}

#pragma mark - Retweet Button Cell Delegate Methods

- (void)onRetweetButton {
    NSLog(@"Retweet Button Pressed with Id %@", self.tweet.tweetId);
    [[TwitterClient instance] retweetWithId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error is %@", error);
    }];
}

- (void)onReplyButton {
    ComposeTweetViewController *composeTweetVC = [[ComposeTweetViewController alloc] init];
    composeTweetVC.title = @"Reply";
    UINavigationController *composeTweetNVC = [[UINavigationController alloc] initWithRootViewController:composeTweetVC];
    composeTweetVC.tweetId = self.tweet.tweetId;
    [self.navigationController presentViewController:composeTweetNVC animated:YES completion:nil];
}

- (void)onFavoriteButton {
    NSLog(@"Favorite Button Pressed");
    [[TwitterClient instance] favoriteWithId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error is %@", error);
    }];
}


@end
