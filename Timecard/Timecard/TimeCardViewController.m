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
    
    _receivedResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
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
    
    NSLog(@"%@" , self.receivedResult);
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

//-(IBAction) authConfirmBtnTouched:(id)sender
//{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8080/timecard/api/auth/authConfirm?memberNo=%@&passwd=%@",_memberNo,_password]];
    
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;

    
    //start the connection
    [connection start];
    
    /* 
     결과값이 OK이면 다음 페이지로 이동한다.
    */

   /* if([_receivedResult isEqualToString:@"OK"])
    {
        TimeCardInfoViewController *dest = [segue destinationViewController];
        dest.loginMemberNo = _memberNo.text ;
    }
    */
}
@end