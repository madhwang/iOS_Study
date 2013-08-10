//
//  ReminderAppFirstViewController.m
//  ReminderApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "ReminderAppFirstViewController.h"

@interface ReminderAppFirstViewController ()

@end

@implementation ReminderAppFirstViewController

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

- (IBAction)setReminder:(id)sender {
    if (_eventStore == nil)
    {
        _eventStore = [[EKEventStore alloc]init];

        [_eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {

            if (!granted)
                NSLog(@"Access to store not granted");
        }];
    }

    if (_eventStore != nil)
        [self createReminder];

}

- (IBAction)hideKeyboard:(id)sender {
    [_reminderText resignFirstResponder];
}

-(void)createReminder
{
    EKReminder *reminder = [EKReminder 
          reminderWithEventStore:self.eventStore];

    reminder.title = _reminderText.text;

    reminder.calendar = [_eventStore defaultCalendarForNewReminders];

    NSDate *date = [_myDatePicker date];

    EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date];

    [reminder addAlarm:alarm];

    NSError *error = nil;

    [_eventStore saveReminder:reminder commit:YES error:&error];

    if (error)
        NSLog(@"error = %@", error);

}

@end
