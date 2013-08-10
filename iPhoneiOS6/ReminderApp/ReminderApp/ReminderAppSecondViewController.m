//
//  ReminderAppSecondViewController.m
//  ReminderApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "ReminderAppSecondViewController.h"

@interface ReminderAppSecondViewController ()

@end

@implementation ReminderAppSecondViewController

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

- (IBAction)setLocationReminder:(id)sender {
    if (_eventStore == nil)
    {
        _eventStore = [[EKEventStore alloc]init];

        [_eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {

            if (!granted)
                NSLog(@"Access to store not granted");
        }];
    }

    if (_eventStore)
    {
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        _manager.distanceFilter = kCLDistanceFilterNone;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;

        [_manager startUpdatingLocation];
    }
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager 
        didUpdateLocations:(NSArray *)locations
{
    [_manager stopUpdatingLocation];

    EKReminder *reminder = [EKReminder 
            reminderWithEventStore:_eventStore];

    reminder.title = _locationText.text;

    reminder.calendar = [_eventStore defaultCalendarForNewReminders];

    EKStructuredLocation *location = [EKStructuredLocation 
           locationWithTitle:@"Current Location"];

    location.geoLocation = [locations lastObject];

    EKAlarm *alarm = [[EKAlarm alloc]init];

    alarm.structuredLocation = location;

    alarm.proximity = EKAlarmProximityLeave;

    [reminder addAlarm:alarm];

    NSError *error = nil;

    [_eventStore saveReminder:reminder commit:YES error:&error];

    if (error)
        NSLog(@"Failed to set reminder: %@", error);
}

@end
