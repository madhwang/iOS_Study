//
//  InAppDemoViewController.h
//  InAppDemo
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "PurchaseViewController.h"

@interface InAppDemoViewController : UIViewController

- (IBAction)purchaseItem:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *level2Button;
@property (strong, nonatomic) PurchaseViewController *purchaseController;
-(void)enableLevel2;

@end
