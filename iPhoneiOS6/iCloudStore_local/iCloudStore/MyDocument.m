//
//  MyDocument.m
//  iCloudStore
//
//  Created by Neil Smyth on 9/25/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument

-(id)contentsForType:(NSString *)typeName
               error:(NSError *__autoreleasing *)outError
{
    return [NSData dataWithBytes:[_userText UTF8String]
                          length:[_userText length]];
}

-(BOOL) loadFromContents:(id)contents
                  ofType:(NSString *)typeName
                   error:(NSError *__autoreleasing *)outError
{
    if ( [contents length] > 0) {
        _userText = [[NSString alloc]
                     initWithBytes:[contents bytes]
                     length:[contents length]
                     encoding:NSUTF8StringEncoding];
    } else {
        _userText = @"";
    }
    return YES;
}

@end
