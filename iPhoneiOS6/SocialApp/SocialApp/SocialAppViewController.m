//
//  SocialAppViewController.m
//  SocialApp
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "SocialAppViewController.h"

@interface SocialAppViewController ()

@end

@implementation SocialAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectImage:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker 
             animated:YES completion:nil];
    }

}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = 
              info[UIImagePickerControllerOriginalImage];

        _postImage.image = image;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)postMessage:(id)sender {
   NSArray *activityItems;

    if (_postImage.image != nil) {
        activityItems = @[_postText.text, _postImage.image];
    } else {
        activityItems = @[_postText.text];
    }

    UIActivityViewController *activityController =
                    [[UIActivityViewController alloc]
                    initWithActivityItems:activityItems
                    applicationActivities:nil];

    [self presentViewController:activityController
                   animated:YES completion:nil];

}


- (IBAction)hideKeyboard:(id)sender {
    [_postText resignFirstResponder];
}
@end
