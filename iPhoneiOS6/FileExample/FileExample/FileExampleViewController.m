//
//  FileExampleViewController.m
//  FileExample
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "FileExampleViewController.h"

@interface FileExampleViewController ()

@end

@implementation FileExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        NSFileManager *filemgr;
        NSString *dataFile;
        NSString *docsDir;
        NSArray *dirPaths;

        filemgr = [NSFileManager defaultManager];

        // Identify the documents directory
        dirPaths = NSSearchPathForDirectoriesInDomains(
           NSDocumentDirectory, NSUserDomainMask, YES);

        docsDir = dirPaths[0];

        // Build the path to the data file
        dataFile = [docsDir stringByAppendingPathComponent:
           @"datafile.dat"];

        // Check if the file already exists
        if ([filemgr fileExistsAtPath: dataFile])
        {
                // Read file contents and display in textBox
                NSData *databuffer;
                databuffer = [filemgr contentsAtPath: dataFile];

                NSString *datastring = [[NSString alloc]
                  initWithData: databuffer
                  encoding:NSASCIIStringEncoding];

                _textBox.text = datastring;
        }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveText:(id)sender {
        NSFileManager *filemgr;
        NSData *databuffer;
        NSString *dataFile;
        NSString *docsDir;
        NSArray *dirPaths;

        filemgr = [NSFileManager defaultManager];

        dirPaths = NSSearchPathForDirectoriesInDomains(
           NSDocumentDirectory, NSUserDomainMask, YES);

        docsDir = dirPaths[0];
        dataFile = [docsDir
          stringByAppendingPathComponent: @"datafile.dat"];
        databuffer = [_textBox.text
          dataUsingEncoding: NSASCIIStringEncoding];
        [filemgr createFileAtPath: dataFile
          contents: databuffer attributes:nil];

}
@end
