//
//  AudioViewController.h
//  Audio
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioViewController : UIViewController
<AVAudioPlayerDelegate>

@property (strong, nonatomic) IBOutlet UISlider *volumeControl;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
- (IBAction)playAudio:(id)sender;
- (IBAction)stopAudio:(id)sender;
- (IBAction)adjustVolume:(id)sender;
@end
