//
//  StorekitDemoViewController.m
//  StoreKitDemo
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "StorekitDemoViewController.h"

@interface StorekitDemoViewController ()

@end

@implementation StorekitDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showStoreView:(id)sender {
        SKStoreProductViewController *storeViewController = 
              [[SKStoreProductViewController alloc] init];

        storeViewController.delegate = self;

        NSDictionary *parameters =
             @{SKStoreProductParameterITunesItemIdentifier: 
                  [NSNumber numberWithInteger:435744790]};

        [storeViewController loadProductWithParameters:parameters 
             completionBlock:^(BOOL result, NSError *error) {
            if (result)
                [self presentViewController:storeViewController
                                   animated:YES
                                 completion:nil];
        }];

}

#pragma mark -
#pragma mark SKStoreProductViewControllerDelegate

-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
