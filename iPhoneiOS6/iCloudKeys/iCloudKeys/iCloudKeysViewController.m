//
//  iCloudKeysViewController.m
//  iCloudKeys
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "iCloudKeysViewController.h"

@interface iCloudKeysViewController ()

@end

@implementation iCloudKeysViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     _keyStore = [[NSUbiquitousKeyValueStore alloc] init];

    NSString *storedString = [_keyStore stringForKey:@"MyString"];

    if (storedString != nil){
        _textField.text = storedString;
    }

    [[NSNotificationCenter defaultCenter] addObserver:self
          selector: @selector(ubiquitousKeyValueStoreDidChange:)
          name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification
          object:_keyStore];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveKey:(id)sender {
    [_keyStore setString:_textField.text forKey:@"MyString"];
    [_keyStore synchronize];
}

-(void) ubiquitousKeyValueStoreDidChange: (NSNotification *)notification
{
    UIAlertView *alert = [[UIAlertView alloc]
                  initWithTitle:@"Change detected"
                  message:@"iCloud key-value store change detected"
                  delegate:nil
                  cancelButtonTitle:@"Ok"
                  otherButtonTitles:nil, nil];
    [alert show];
    _textField.text = [_keyStore stringForKey:@"MyString"];
}
@end
