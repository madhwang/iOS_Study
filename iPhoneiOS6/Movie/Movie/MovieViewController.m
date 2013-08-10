//
//  MovieViewController.m
//  Movie
//
//  Created by Neil Smyth on 9/27/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

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

- (IBAction)playMovie:(id)sender {
   NSURL *url = [NSURL URLWithString:
      @"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];

    _moviePlayer =  [[MPMoviePlayerController alloc]
                 initWithContentURL:url];

    [[NSNotificationCenter defaultCenter] addObserver:self
                   selector:@selector(moviePlayBackDidFinish:)
                   name:MPMoviePlayerPlaybackDidFinishNotification
                   object:_moviePlayer];

    _moviePlayer.controlStyle = MPMovieControlStyleDefault;
    _moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:_moviePlayer.view];
    [_moviePlayer setFullscreen:YES animated:YES];

}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] 
      removeObserver:self
      name:MPMoviePlayerPlaybackDidFinishNotification
      object:player];

    if ([player
        respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}

@end
