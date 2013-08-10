//
//  iCloudKeysViewController.h
//  iCloudKeys
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iCloudKeysViewController : UIViewController
@property (strong, nonatomic) NSUbiquitousKeyValueStore *keyStore;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)saveKey:(id)sender;

@end
