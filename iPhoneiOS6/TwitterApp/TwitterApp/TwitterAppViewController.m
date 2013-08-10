//
//  TwitterAppViewController.m
//  TwitterApp
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "TwitterAppViewController.h"

@interface TwitterAppViewController ()

@end

@implementation TwitterAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getTimeLine];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getTimeLine {
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account   
    accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];

    [account requestAccessToAccountsWithType:accountType 
      options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted == YES)
         {
             NSArray *arrayOfAccounts = [account 
                      accountsWithAccountType:accountType];

             if ([arrayOfAccounts count] > 0)
             {
                 ACAccount *twitterAccount = 
                    [arrayOfAccounts lastObject];

                 NSURL *requestURL = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/home_timeline.json"];

                 NSMutableDictionary *parameters = 
                      [[NSMutableDictionary alloc] init];
                 [parameters setObject:@"20" forKey:@"count"];
                 [parameters setObject:@"1" forKey:@"include_entities"];

                 SLRequest *postRequest = [SLRequest 
                      requestForServiceType:SLServiceTypeTwitter
                      requestMethod:SLRequestMethodGET
                      URL:requestURL parameters:parameters];

                 postRequest.account = twitterAccount;

                 [postRequest performRequestWithHandler:
                     ^(NSData *responseData, NSHTTPURLResponse 
                     *urlResponse, NSError *error)
                  {
                      self.dataSource = [NSJSONSerialization 
                          JSONObjectWithData:responseData 
                          options:NSJSONReadingMutableLeaves 
                          error:&error];

                      if (self.dataSource.count != 0) {
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [self.tweetTableView reloadData];
                          });
                      }
                  }];
             }
         } else {
             // Handle failure to get account access
         }
     }];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [self.tweetTableView
             dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:CellIdentifier];
    }

    NSDictionary *tweet = _dataSource[[indexPath row]];

    cell.textLabel.text = tweet[@"text"];
    return cell;
}

@end
