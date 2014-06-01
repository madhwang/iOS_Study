//
//  TimeCardViewController.m
//  Timecard
//
//  Created by madhwang on 2014. 5. 18..
//  Copyright (c) 2014년 madhwang. All rights reserved.
//

#import "TimeCardViewController.h"

@interface TimeCardViewController ()

@end

@implementation TimeCardViewController

/* 엔터키 클릭시 키보드 숨김 */
-(IBAction) textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

/* 백그라운드 클릭시 키보드 숨김 */
- (IBAction) backgroundTouched:(id)sender
{
    [_memberNo resignFirstResponder];
    [_password resignFirstResponder];
}
@end