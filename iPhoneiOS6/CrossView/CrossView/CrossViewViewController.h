//
//  CrossViewViewController.h
//  CrossView
//
//  Created by Neil Smyth on 9/24/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrossViewViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *myTextView;
@property (strong, nonatomic) IBOutlet UIButton *myButton;
@property (strong, nonatomic) IBOutlet UIView *viewB;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *centerConstraint;

@end
