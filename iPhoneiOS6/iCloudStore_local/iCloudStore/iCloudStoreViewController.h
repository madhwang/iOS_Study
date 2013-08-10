//
//  iCloudStoreViewController.h
//  iCloudStore
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDocument.h"

@interface iCloudStoreViewController : UIViewController
@property (strong, nonatomic) NSURL *documentURL;
@property (strong, nonatomic) MyDocument *document;
@property (strong, nonatomic) IBOutlet UITextView *textView;
- (IBAction)saveDocument:(id)sender;

@end
