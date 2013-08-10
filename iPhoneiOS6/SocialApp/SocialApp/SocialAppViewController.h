//
//  SocialAppViewController.h
//  SocialApp
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface SocialAppViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextView *postText;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
- (IBAction)selectImage:(id)sender;
- (IBAction)postMessage:(id)sender;
- (IBAction)hideKeyboard:(id)sender;



@end
