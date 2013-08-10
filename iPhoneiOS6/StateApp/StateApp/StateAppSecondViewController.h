//
//  StateAppSecondViewController.h
//  StateApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StateAppThirdViewController.h"

@interface StateAppSecondViewController : UIViewController
@property (strong, nonatomic) UIViewController *thirdViewController;
@property (strong, nonatomic) IBOutlet UITextView *myTextView;
- (IBAction)displayVC3:(id)sender;


@end
