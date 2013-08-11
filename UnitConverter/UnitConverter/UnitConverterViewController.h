//
//  UnitConverterViewController.h
//  UnitConverter
//
//  Created by madhwang on 13. 8. 10..
//  Copyright (c) 2013년 madhwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnitConverterViewController : UIViewController
@property (strong,nonatomic) IBOutlet UILabel *resultLabel;
@property (strong,nonatomic) IBOutlet UITextField *tempText;
-(IBAction)convertTemp:(id)sender;
@end
