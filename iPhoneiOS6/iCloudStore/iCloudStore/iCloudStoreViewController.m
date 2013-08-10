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
      [docsDir stringByAppendingPathComponent: @"document2.doc"];

    _documentURL = [NSURL fileURLWithPath:dataFile];

    NSFileManager *filemgr = [NSFileManager defaultManager];

    [filemgr removeItemAtURL:_documentURL error:nil];

    _ubiquityURL = [[filemgr
       URLForUbiquityContainerIdentifier:nil]
       URLByAppendingPathComponent:@"Documents"];
    

    if ([filemgr fileExistsAtPath:[_ubiquityURL path]] == NO)
       [filemgr createDirectoryAtURL:_ubiquityURL
         withIntermediateDirectories:YES
         attributes:nil
         error:nil];

    _ubiquityURL =
      [_ubiquityURL URLByAppendingPathComponent:@"document2.doc"];

    // Search for document in iCloud storage
    _metadataQuery = [[NSMetadataQuery alloc] init];
    [_metadataQuery setPredicate:[NSPredicate
    predicateWithFormat:@"%K like 'document2.doc'",
      NSMetadataItemFSNameKey]];
    [_metadataQuery setSearchScopes:[NSArray
      arrayWithObjects:NSMetadataQueryUbiquitousDocumentsScope,nil]];

    [[NSNotificationCenter defaultCenter]
      addObserver:self
      selector:@selector(metadataQueryDidFinishGathering:)
      name: NSMetadataQueryDidFinishGatheringNotification
      object:_metadataQuery];
    [_metadataQuery startQuery];

}

- (void)metadataQueryDidFinishGathering:
(NSNotification *)notification {
  NSMetadataQuery *query = [notification object];
  [query disableUpdates];

   [[NSNotificationCenter defaultCenter]
      removeObserver:self
      name:NSMetadataQueryDidFinishGatheringNotification
      object:query];

  [query stopQuery];
  NSArray *results = [[NSArray alloc] initWithArray:[query results]];

  if ([results count] == 1)
  {
      
    // File exists in cloud so get URL
    _ubiquityURL = [results[0]
        valueForAttribute:NSMetadataItemURLKey];
      

    _document = [[MyDocument alloc]
          initWithFileURL:_ubiquityURL];
    [_document openWithCompletionHandler:
      ^(BOOL success) {
         if (success){
             NSLog(@"Opened iCloud doc");
             _textView.text = _document.userText;
          } else {
             NSLog(@"Failed to open iCloud doc");
          }
    }];
  } else {
      NSLog(@"File does not exist in cloud");
      // File does not exist in cloud.
        _document = [[MyDocument alloc]
            initWithFileURL:_ubiquityURL];

        [_document saveToURL:_ubiquityURL
           forSaveOperation: UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success){
                  NSLog(@"Saved to cloud");
              }  else {
                  NSLog(@"Failed to save to cloud");
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
      [_document saveToURL:_ubiquityURL
        forSaveOperation:UIDocumentSaveForOverwriting
        completionHandler:^(BOOL success) {
            if (success){
                NSLog(@"Saved to cloud for overwriting");
            } else {
                NSLog(@"Not saved to cloud for overwriting");
            }
        }];

}
@end
