//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by Neil Smyth on 9/24/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface HelloWorldAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HelloWorldViewController *viewController;

@end
