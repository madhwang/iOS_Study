//
//  StorekitDemoViewController.h
//  StoreKitDemo
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface StorekitDemoViewController : UIViewController
<SKStoreProductViewControllerDelegate>

- (IBAction)showStoreView:(id)sender;


@end
