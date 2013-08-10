//
//  AutoLayoutCodeViewController.m
//  AutoLayoutCode
//
//  Created by Neil Smyth on 9/24/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "AutoLayoutCodeViewController.h"

@interface AutoLayoutCodeViewController ()

@end

@implementation AutoLayoutCodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
UIView *superview = self.view;

    UILabel *mylabel = [[UILabel alloc]init];
    [mylabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    mylabel.text = @"hello";

    UIButton *mybutton = [UIButton 
         buttonWithType:UIButtonTypeRoundedRect];
    [mybutton setTitle:@"My Button" 
         forState:UIControlStateNormal];
    [mybutton setTranslatesAutoresizingMaskIntoConstraints:NO];

    [superview addSubview:mylabel];
    [superview addSubview:mybutton];
    
    NSLayoutConstraint *myConstraint =[NSLayoutConstraint
                        constraintWithItem:mylabel
                        attribute:NSLayoutAttributeCenterY
                        relatedBy:NSLayoutRelationEqual
                        toItem:superview
                        attribute:NSLayoutAttributeCenterY
                        multiplier:1.0
                        constant:0];

    [superview addConstraint:myConstraint];

    myConstraint =[NSLayoutConstraint 
                        constraintWithItem:mylabel
                        attribute:NSLayoutAttributeCenterX
                        relatedBy:NSLayoutRelationEqual
                        toItem:superview
                        attribute:NSLayoutAttributeCenterX
                        multiplier:1.0
                        constant:0];

    [superview addConstraint:myConstraint];


    myConstraint =[NSLayoutConstraint constraintWithItem:mybutton
                        attribute:NSLayoutAttributeTrailing
                        relatedBy:NSLayoutRelationEqual
                        toItem:mylabel
                        attribute:NSLayoutAttributeLeading
                        multiplier:1
                        constant:-10];

    [superview addConstraint:myConstraint];

    myConstraint =[NSLayoutConstraint constraintWithItem:mybutton
                        attribute:NSLayoutAttributeBaseline
                        relatedBy:NSLayoutRelationEqual
                        toItem:mylabel
                        attribute:NSLayoutAttributeBaseline
                        multiplier:1
                        constant:0];

    [superview addConstraint:myConstraint];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
