//
//  TimeCardViewController.h
//  Timecard
//
//  Created by madhwang on 2014. 5. 18..
//  Copyright (c) 2014년 madhwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *memberNo;
@property (weak, nonatomic) IBOutlet UITextField *password;


@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *receivedData;


/* 엔터 클릭시 키보드 숨김 */
- (IBAction) textFieldReturn:(id)sender;

/* 백그라운드 터치시 키보드 숨김 */
- (IBAction) backgroundTouched:(id)sender;

/* 인증하기 버튼 터치시 */
- (IBAction) authConfirmBtnTouched:(id)sender;


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

-(void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end
