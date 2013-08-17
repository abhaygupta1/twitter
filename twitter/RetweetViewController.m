//
//  RetweetViewController.m
//  twitter
//
//  Created by  on 8/14/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "RetweetViewController.h"
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
    customNib = [UINib nibWithNibName:@"ReplyCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"ReplyCell"];

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
            retweetButtonCell.viewController = self;
            cell = retweetButtonCell;
            break;
        }
        case 2:{
            static NSString *CellIdentifier = @"ReplyCell";
            ReplyCell *replyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (replyCell == nil) {
                replyCell = [[ReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            [[replyCell.reply layer] setBorderColor:[[UIColor grayColor] CGColor]];
            [[replyCell.reply layer] setBorderWidth:1.3];
            
            cell = replyCell;
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
            CGSize size = [tweet.text sizeWithFont:[UIFont fontWithName:@"Helvetica" size:10] constrainedToSize:CGSizeMake(280, 999) lineBreakMode:NSLineBreakByWordWrapping];
            height = MAX(size.height + 10 + 10, 50);
            break;
        }
        case 1: {
            height = 30;
            break;
        }
        case 2: {
            height = 160;
            break;
        }
        default: height = 0;
    }
    NSLog(@"%f", height);

    return height;
}

- (IBAction)operationPressed:(UIButton *)sender {
    NSLog(@"Button Pressed ");
}

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

     

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
