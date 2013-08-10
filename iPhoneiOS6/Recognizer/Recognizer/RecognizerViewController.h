//
//  RecognizerViewController.h
//  Recognizer
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecognizerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)tapDetected:(UITapGestureRecognizer *)sender;
- (IBAction)swipeDetected:(UISwipeGestureRecognizer *)sender;
- (IBAction)rotationDetected:(UIRotationGestureRecognizer *)sender;
- (IBAction)pinchDetected:(UIPinchGestureRecognizer *)sender;
- (IBAction)longPressDetected:(UILongPressGestureRecognizer *)sender;

@end
