//
//  HideKeyboardViewController.h
//  HideKeyboard
//
//  Created by madhwang on 13. 8. 11..
//  Copyright (c) 2013년 madhwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HideKeyboardViewController : UIViewController


@property (strong,nonatomic) IBOutlet UITextField *textField;

-(IBAction)textFieldReturn:(id)sender;

-(IBAction)backgroundTouched:(id)sender;
@end
