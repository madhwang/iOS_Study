//
//  FileExampleViewController.h
//  FileExample
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileExampleViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textBox;
- (IBAction)saveText:(id)sender;

@end
