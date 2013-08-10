//
//  StateAppThirdViewController.m
//  StateApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "StateAppThirdViewController.h"

@interface StateAppThirdViewController ()

@end

@implementation StateAppThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.restorationIdentifier = @"thirdViewController";
    self.restorationClass = [self class];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    UIViewController * myViewController = 
            [[StateAppThirdViewController alloc]       
             initWithNibName:@"StateAppThirdViewController" 
             bundle:nil];

    return myViewController;
}

@end
