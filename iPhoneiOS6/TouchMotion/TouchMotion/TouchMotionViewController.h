//
//  TouchMotionViewController.h
//  TouchMotion
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchMotionViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *xCoord;
@property (strong, nonatomic) IBOutlet UILabel *yCoord;
@property CGPoint startPoint;
@end
