//
//  ReminderAppFirstViewController.h
//  ReminderApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@interface ReminderAppFirstViewController : UIViewController

@property (strong, nonatomic) EKEventStore *eventStore;
@property (strong, nonatomic) IBOutlet UITextField *reminderText;
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
- (IBAction)setReminder:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end
