//
//  TimeCardViewController.m
//  Timecard
//
//  Created by madhwang on 2014. 5. 18..
//  Copyright (c) 2014년 madhwang. All rights reserved.
//

#import "TimeCardViewController.h"

@interface TimeCardViewController ()

@end

@implementation TimeCardViewController

-(IBAction) textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction) backgroundTouched:(id)sender
{
    [_memberNo resignFirstResponder];
    [_password resignFirstResponder];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receivedData appendData:data];
}

/*
 if there is an error occured, this method will be called by connection
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@" , error);
}

/*
 if data is successfully received, this method will be called by connection
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //initialize convert the received data to string with UTF8 encoding
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData
                                              encoding:NSUTF8StringEncoding];

    if([htmlSTR isEqualToString:@"OK"] == true)
    {
        // 화면 이동
        //멤버 번호를 가지고 이동
    }
    
   
}


-(IBAction) authConfirmBtnTouched:(id)sender
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8080/authConfirm?memberNo=%@&passwd=%@",_memberNo,_password]];
    
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;

    
    //start the connection
    [connection start];
}
@end