//
//  ReminderAppSecondViewController.h
//  ReminderApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ReminderAppSecondViewController : UIViewController
<CLLocationManagerDelegate>

@property (strong, nonatomic) EKEventStore *eventStore;
@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic) IBOutlet UITextField *locationText;
- (IBAction)setLocationReminder:(id)sender;

@end
