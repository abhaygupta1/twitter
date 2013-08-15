//
//  ComposeTweetViewController.m
//  twitter
//
//  Created by  on 8/12/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeTweetViewController.h"

@interface ComposeTweetViewController ()

@end

@implementation ComposeTweetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            self.title = @"Compose";
    }
        return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tweet.layer.borderWidth = 1.0f;
    self.tweet.layer.borderColor = [[UIColor grayColor] CGColor];
    self.tweet.text = @"";
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]
                       initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
                       action:@selector(onCancelButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self
                                              action:@selector(onActionButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
- (void)onCancelButton {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)onActionButton {
}


@end
