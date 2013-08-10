//
//  StateAppSecondViewController.m
//  StateApp
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "StateAppSecondViewController.h"

@interface StateAppSecondViewController ()

@end

@implementation StateAppSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _thirdViewController = [[StateAppThirdViewController alloc] 
           initWithNibName:@"StateAppThirdViewController" bundle:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_myTextView.text forKey:@"UnsavedText"];
    [super encodeRestorableStateWithCoder:coder];
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    _myTextView.text = [coder decodeObjectForKey:@"UnsavedText"];
    [super decodeRestorableStateWithCoder:coder];

}

- (IBAction)displayVC3:(id)sender {
    [self.navigationController 
          pushViewController:_thirdViewController animated:YES];

}
@end
