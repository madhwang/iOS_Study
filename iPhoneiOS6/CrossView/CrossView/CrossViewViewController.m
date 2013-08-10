//
//  CrossViewViewController.m
//  CrossView
//
//  Created by Neil Smyth on 9/24/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "CrossViewViewController.h"

@interface CrossViewViewController ()

@end

@implementation CrossViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_viewB removeConstraint:_centerConstraint];

    NSLayoutConstraint *constraint = [NSLayoutConstraint 
                         constraintWithItem:_myTextView
                         attribute: NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:_myButton
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0];
    [self.view addConstraint:constraint];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
