//
//  DatePickerViewController.m
//  DatePicker
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

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

- (IBAction)getSelection:(id)sender {
   NSLocale *usLocale = [[NSLocale alloc]
       initWithLocaleIdentifier:@"en_US"];

   NSDate *pickerDate = [_datePicker date];
   NSString *selectionString = [[NSString alloc] 
       initWithFormat:@"%@",
       [pickerDate descriptionWithLocale:usLocale]];
   _dateLabel.text = selectionString;

}
@end
