//
//  TimeCardViewController.h
//  Timecard
//
//  Created by madhwang on 2014. 5. 18..
//  Copyright (c) 2014년 madhwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *memberNo;

@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction) textFieldReturn:(id)sender;

- (IBAction) backgroundTouched:(id)sender;

@end
