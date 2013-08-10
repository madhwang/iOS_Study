//
//  AssistantViewController.m
//  Assistant
//
//  Created by Neil Smyth on 9/24/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "AssistantViewController.h"

@interface AssistantViewController ()

@end

@implementation AssistantViewController

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

- (IBAction)buttonTouched {
    _statusLabel.text = @"Hello";
}
@end
