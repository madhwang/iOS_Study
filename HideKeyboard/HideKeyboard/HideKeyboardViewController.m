//
//  HideKeyboardViewController.m
//  HideKeyboard
//
//  Created by madhwang on 13. 8. 11..
//  Copyright (c) 2013년 madhwang. All rights reserved.
//

#import "HideKeyboardViewController.h"


@implementation HideKeyboardViewController

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


-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTouched:(id)sender
{
    [_textField resignFirstResponder];
}
@end
