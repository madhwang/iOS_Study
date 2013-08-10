//
//  RecognizerViewController.m
//  Recognizer
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "RecognizerViewController.h"

@interface RecognizerViewController ()

@end

@implementation RecognizerViewController

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

- (IBAction)tapDetected:(UITapGestureRecognizer *)sender {
    _statusLabel.text = @"Double Tap";
}

- (IBAction)swipeDetected:(UISwipeGestureRecognizer *)sender {
    _statusLabel.text = @"Right Swipe";
}

- (IBAction)rotationDetected:(UIRotationGestureRecognizer *)sender {
    CGFloat radians =
          [(UIRotationGestureRecognizer *)sender rotation];
    CGFloat velocity =
          [(UIRotationGestureRecognizer *)sender velocity];

    NSString *resultString = [[NSString alloc] initWithFormat:
              @"Rotation - Radians = %f, velocity = %f",
              radians, velocity];
    _statusLabel.text = resultString;

}

- (IBAction)pinchDetected:(UIPinchGestureRecognizer *)sender {
    CGFloat scale =
       [(UIPinchGestureRecognizer *)sender scale];
    CGFloat velocity =
       [(UIPinchGestureRecognizer *)sender velocity];

    NSString *resultString = [[NSString alloc] initWithFormat:
         @"Pinch - scale = %f, velocity = %f",
         scale, velocity];
    _statusLabel.text = resultString;

}

- (IBAction)longPressDetected:(UILongPressGestureRecognizer *)sender {
    _statusLabel.text = @"Long Press";
}
@end
