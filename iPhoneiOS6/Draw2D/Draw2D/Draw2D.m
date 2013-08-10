//
//  Draw2D.m
//  Draw2D
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "Draw2D.h"

@implementation Draw2D

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIImage *myimage = [UIImage imageNamed:@"pumpkin.jpg"];
    CIImage *cimage = [[CIImage alloc] initWithImage:myimage];

    CIFilter *sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"];
    [sepiaFilter setDefaults];
    [sepiaFilter setValue:cimage forKey:@"inputImage"];
    [sepiaFilter setValue:[NSNumber numberWithFloat:0.8f]
         forKey:@"inputIntensity"];

    CIImage *image = [sepiaFilter outputImage];
    CIContext *context = [CIContext contextWithOptions: nil];
    CGImageRef cgImage = [context createCGImage: 
          image fromRect: image.extent];
    UIImage *resultUIImage = [UIImage imageWithCGImage: cgImage];

    CGRect imageRect =[[UIScreen mainScreen] bounds];
    [resultUIImage drawInRect:imageRect];


}


@end
