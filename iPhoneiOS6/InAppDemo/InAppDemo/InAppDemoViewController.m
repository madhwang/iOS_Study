//
//  InAppDemoViewController.m
//  InAppDemo
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "InAppDemoViewController.h"

@interface InAppDemoViewController ()

@end

@implementation InAppDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _purchaseController = [[PurchaseViewController alloc]init];

    [[SKPaymentQueue defaultQueue] 
         addTransactionObserver:_purchaseController];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)purchaseItem:(id)sender {
    _purchaseController.productID = 
           @"com.ebookfrenzy.nonconsumable1";

    [self.navigationController 
          pushViewController:_purchaseController animated:YES];

    [_purchaseController getProductInfo: self];

}

-(void)enableLevel2
{
    _level2Button.enabled = YES;
}

@end
