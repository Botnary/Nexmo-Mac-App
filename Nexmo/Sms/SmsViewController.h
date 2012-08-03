//
//  SmsViewController.h
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-18.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SendSms.h"
#import "PhoneLabelView.h"

@interface SmsViewController : NSViewController{

}
@property (nonatomic, retain) IBOutlet NSTextField *nsTextFieldTotalMoney;
@property (nonatomic, retain) IBOutlet NSTextField *nsTextFieldSmsLength;
@property (nonatomic, retain) IBOutlet NSTextField *nsTextFieldPhoneNumber;
@property (nonatomic, retain) IBOutlet NSTextField *nsTextFieldSmsText;
@property (nonatomic, retain) IBOutlet NSTextField *nsTextFieldStatus;
@property (nonatomic, retain) SendSms *nexmoSendSms;
@property (assign) IBOutlet NSButton *sendSmsButton;
@property (assign) IBOutlet NSBox *nsBoxContainer;
@property (assign) PhoneLabelView *phoneLabelView;
@property (assign) IBOutlet NSTextField *phoneLabelNSTextField;

@property (assign) int currentProgress;
@property (assign) NSTimer *timer;

@property (assign) IBOutlet NSProgressIndicator *nsProgressesSendinSms;
- (IBAction)sendMessage:(NSButton *)sender;
- (IBAction)updateMessageCount:(NSTextField *)sender;

@end
