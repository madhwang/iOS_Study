//
//  iAdAppViewController.m
//  iAdApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "iAdAppViewController.h"

@interface iAdAppViewController ()

@end

@implementation iAdAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bannerView = [[ADBannerView alloc]
          initWithFrame:CGRectZero];

    _bannerView.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
   _tableView.tableHeaderView = _bannerView;
}


@end
