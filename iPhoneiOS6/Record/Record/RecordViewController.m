//
//  RecordViewController.m
//  Record
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
_playButton.enabled = NO;
   _stopButton.enabled = NO;

   NSArray *dirPaths;
   NSString *docsDir;

   dirPaths = NSSearchPathForDirectoriesInDomains(
        NSDocumentDirectory, NSUserDomainMask, YES);
   docsDir = dirPaths[0];

    NSString *soundFilePath = [docsDir
       stringByAppendingPathComponent:@"sound.caf"];

   NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

   NSDictionary *recordSettings = [NSDictionary
            dictionaryWithObjectsAndKeys:
            [NSNumber numberWithInt:AVAudioQualityMin],
            AVEncoderAudioQualityKey,
            [NSNumber numberWithInt:16],
            AVEncoderBitRateKey,
            [NSNumber numberWithInt: 2],
            AVNumberOfChannelsKey,
            [NSNumber numberWithFloat:44100.0],
            AVSampleRateKey,
            nil];

  NSError *error = nil;

  _audioRecorder = [[AVAudioRecorder alloc]
                  initWithURL:soundFileURL
                  settings:recordSettings
                  error:&error];

   if (error)
   {
           NSLog(@"error: %@", [error localizedDescription]);
   } else {
           [_audioRecorder prepareToRecord];
   }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordAudio:(id)sender {
     if (!_audioRecorder.recording)
     {
             _playButton.enabled = NO;
             _stopButton.enabled = YES;
             [_audioRecorder record];
     }

}

- (IBAction)playAudio:(id)sender {
    if (!_audioRecorder.recording)
    {
       _stopButton.enabled = YES;
       _recordButton.enabled = NO;

        NSError *error;

        _audioPlayer = [[AVAudioPlayer alloc]
        initWithContentsOfURL:_audioRecorder.url
        error:&error];

        _audioPlayer.delegate = self;

        if (error)
              NSLog(@"Error: %@",
              [error localizedDescription]);
        else
              [_audioPlayer play];
   }

}

- (IBAction)stop:(id)sender {
    _stopButton.enabled = NO;
    _playButton.enabled = YES;
    _recordButton.enabled = YES;

    if (_audioRecorder.recording)
    {
            [_audioRecorder stop];
    } else if (_audioPlayer.playing) {
            [_audioPlayer stop];
    }

}

-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
        _recordButton.enabled = YES;
        _stopButton.enabled = NO;
}

-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player 
error:(NSError *)error
{
        NSLog(@"Decode Error occurred");
}

-(void)audioRecorderDidFinishRecording:
(AVAudioRecorder *)recorder 
successfully:(BOOL)flag
{
}

-(void)audioRecorderEncodeErrorDidOccur:
(AVAudioRecorder *)recorder 
error:(NSError *)error
{
        NSLog(@"Encode Error occurred");
}

@end
