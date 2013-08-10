//
//  PickerViewController.m
//  Picker
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _countryNames = @[@"Australia (AUD)", @"China (CNY)",
              @"France (EUR)", @"Great Britain (GBP)", @"Japan (JPY)"];

    _exchangeRates = @[ @0.9922f, @6.5938f, @0.7270f, 
              @0.6206f, @81.57f];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
        return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
      numberOfRowsInComponent:(NSInteger)component
{
        return _countryNames.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
titleForRow:(NSInteger)row
forComponent:(NSInteger)component
{
    return _countryNames[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
inComponent:(NSInteger)component
{
        float rate = [_exchangeRates[row] floatValue];
        float dollars = [_dollarText.text floatValue];
        float result = dollars * rate;

        NSString *resultString = [[NSString alloc] initWithFormat:
                @"%.2f USD = %.2f %@", dollars, result,
               _countryNames[row]];
        _resultLabel.text = resultString;
}

@end
