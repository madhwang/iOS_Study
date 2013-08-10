//
//  TouchMotionViewController.m
//  TouchMotion
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "TouchMotionViewController.h"

@interface TouchMotionViewController ()

@end

@implementation TouchMotionViewController

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
     UITouch *theTouch = [touches anyObject];
     _startPoint = [theTouch locationInView:self.view];
     CGFloat x = _startPoint.x;
     CGFloat y = _startPoint.y;
     _xCoord.text = [NSString stringWithFormat:@"x = %f", x];
     _yCoord.text = [NSString stringWithFormat:@"y = %f", y];
}

- (void) touchesMoved:(NSSet *)touches
withEvent:(UIEvent *)event {
   UITouch *theTouch = [touches anyObject];
   CGPoint touchLocation =
     [theTouch locationInView:self.view];
   CGFloat x = touchLocation.x;
   CGFloat y = touchLocation.y;
   _xCoord.text = [NSString stringWithFormat:@"x = %f", x];
   _yCoord.text = [NSString stringWithFormat:@"y = %f", y];
}

- (void) touchesEnded:(NSSet *)touches
withEvent:(UIEvent *)event {
    UITouch *theTouch = [touches anyObject];
    CGPoint endPoint = [theTouch locationInView:self.view];
    _xCoord.text = [NSString stringWithFormat:
      @"start = %f, %f", _startPoint.x, _startPoint.y];
    _yCoord.text = [NSString stringWithFormat:
      @"end = %f, %f", endPoint.x, endPoint.y];
}

@end
