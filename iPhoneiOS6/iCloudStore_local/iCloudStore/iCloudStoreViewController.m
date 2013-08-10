//
//  iCloudStoreViewController.m
//  iCloudStore
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "iCloudStoreViewController.h"

@interface iCloudStoreViewController ()

@end

@implementation iCloudStoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
     NSArray *dirPaths =
     NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
       NSUserDomainMask, YES);

    NSString *docsDir = dirPaths[0];
    NSString *dataFile =
      [docsDir stringByAppendingPathComponent:
        @"document.doc"];

    _documentURL = [NSURL fileURLWithPath:dataFile];
    _document = [[MyDocument alloc] initWithFileURL:_documentURL];
    _document.userText = @"";
    NSFileManager *filemgr = [NSFileManager defaultManager];

    if ([filemgr fileExistsAtPath: dataFile])
    {
        [_document openWithCompletionHandler:
         ^(BOOL success) {
             if (success){
                 NSLog(@"Opened");
                 _textView.text = _document.userText;
             } else {
                 NSLog(@"Not opened");
             }
         }];

    } else {
        [_document saveToURL:_documentURL
           forSaveOperation: UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success){
                  NSLog(@"Created");
              } else {
                  NSLog(@"Not created");
              }
          }];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveDocument:(id)sender {
    _document.userText = _textView.text;

    [_document saveToURL:_documentURL
       forSaveOperation:UIDocumentSaveForOverwriting
       completionHandler:^(BOOL success) {
            if (success){
                NSLog(@"Saved for overwriting");
            } else {
                NSLog(@"Not saved for overwriting");
            }
    }];

}
@end
