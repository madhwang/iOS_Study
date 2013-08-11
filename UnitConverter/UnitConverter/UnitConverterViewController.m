//
//  UnitConverterViewController.m
//  UnitConverter
//
//  Created by madhwang on 13. 8. 10..
//  Copyright (c) 2013년 madhwang. All rights reserved.
//

#import "UnitConverterViewController.h"
/*
@interface UnitConverterViewController ()


@end
*/
@implementation UnitConverterViewController

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

- (void)convertTemp:(id)sender
{
    double farenheit = [_tempText.text doubleValue];
    double celsius = (farenheit - 32) / 1.8;
    
    NSString *resultString = [[NSString alloc]initWithFormat:@"Celsius %f",celsius];
    _resultLabel.text = resultString;
}
@end
