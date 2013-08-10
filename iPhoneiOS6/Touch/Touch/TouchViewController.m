//
//  TouchViewController.m
//  Touch
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "TouchViewController.h"

@interface TouchViewController ()

@end

@implementation TouchViewController

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

- (void) touchesBegan:(NSSet *)touches
withEvent:(UIEvent *)event {
   NSUInteger touchCount = [touches count];
   NSUInteger tapCount = [[touches anyObject] tapCount];
   _methodStatus.text = @"touchesBegan";
   _touchStatus.text = [NSString stringWithFormat:
     @"%d touches", touchCount];
   _tapStatus.text = [NSString stringWithFormat:
     @"%d taps", tapCount];
} 

- (void) touchesMoved:(NSSet *)touches
withEvent:(UIEvent *)event {
    NSUInteger touchCount = [touches count];
    NSUInteger tapCount = [[touches anyObject] tapCount];
    _methodStatus.text = @"touchesMoved";
    _touchStatus.text = [NSString stringWithFormat:
      @"%d touches", touchCount];
    _tapStatus.text = [NSString stringWithFormat:
      @"%d taps", tapCount];
}

- (void) touchesEnded:(NSSet *)touches
withEvent:(UIEvent *)event {
    NSUInteger touchCount = [touches count];
    NSUInteger tapCount = [[touches anyObject] tapCount];
    _methodStatus.text = @"touchesEnded";
    _touchStatus.text = [NSString stringWithFormat:
      @"%d touches", touchCount];
    _tapStatus.text = [NSString stringWithFormat:
       @"%d taps", tapCount];
}

@end
