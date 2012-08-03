//
//  SmsViewController.m
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-18.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "SmsViewController.h"
#import "SmsBackgroundView.h"

@interface SmsViewController ()

@end

@implementation SmsViewController
@synthesize nsTextFieldTotalMoney = _nsTextFieldTotalMoney;
@synthesize nsTextFieldSmsLength = _nsTextFieldSmsLength;
@synthesize nsTextFieldPhoneNumber = _nsTextFieldPhoneNumber;
@synthesize nsTextFieldSmsText = _nsTextFieldSmsText;
@synthesize nsTextFieldStatus = _nsTextFieldStatus;
@synthesize nsProgressesSendinSms = _nsProgressesSendinSms;
@synthesize nexmoSendSms = _nexmoSendSms;
@synthesize sendSmsButton = _sendSmsButton;
@synthesize currentProgress = _currentProgress;

@synthesize timer = _timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        self.nexmoSendSms = [[SendSms alloc]init];
        self.currentProgress = 0;
    }
    
    return self;
}

- (id)init{
    self = [super init];
    if(self){
        self.nexmoSendSms = [[SendSms alloc]init];
        self.currentProgress = 0;
    }
    return self;
}

- (void)loadView
{       
    [super loadView];
    [self updateBalance]; 
    [self showCurrentStatus:FALSE withStatus:@"" withProgress:0];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:NSControlTextDidChangeNotification object:nil];
    [self.sendSmsButton setImage:[NSImage imageNamed:@"button-send.png"]];
}

- (IBAction)sendMessage:(NSButton *)sender {
    self.nexmoSendSms.smsMessage = [self.nsTextFieldPhoneNumber stringValue];
    self.nexmoSendSms.smsPhone = [self.nsTextFieldPhoneNumber stringValue];
    [self.nexmoSendSms sendIt];
    //[self updateBalance];
    /*
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 2.0
                                                  target: self
                                                selector:@selector(onTick:)
                                                userInfo: nil repeats:YES]; */
    
    [self showCurrentStatus:YES withStatus:@"Sending message" withProgress:0];
    NSString *response = [self.nexmoSendSms sendIt];
    [self showCurrentStatus:NO withStatus:response withProgress:0];
    NSLog(@"Message sent");
}

- (IBAction)updateMessageCount:(NSTextField *)sender {
    //NSString *test = [[NSString alloc]initWithFormat:@"%@", [sender stringValue]];
    //[self.nsTextFieldSmsLength setStringValue:[[NSString alloc]initWithFormat:@"%@",test.length]];
    //NSLog(@"%@",[self.nsTextFieldTotalMoney stringValue]);
    ///NSLog(@"Message length %@",test.length);
}

- (void) updateBalance{
    NSString *balance = [[NSString alloc]initWithFormat:@"%@ $",[self.nexmoSendSms getBalance]];
    NSLog(@"%@",balance);
    [self.nsTextFieldTotalMoney setStringValue:balance];
    [self.nsTextFieldStatus setStringValue:@"Balance loaded..."];
}

-(void) textDidChange:(NSNotification *)obj {
    if ([obj object] == self.nsTextFieldSmsText) {
        //do stuff
        [self.nsTextFieldSmsLength setIntValue:[[self.nsTextFieldSmsText stringValue]length]];
    }
    NSLog(@"%@\n%@",[obj object],self.nsTextFieldSmsText);
}

-(void)showCurrentStatus:(BOOL) showSpiner withStatus:(NSString *)status withProgress:(double)progress{
    [self showSpiner:showSpiner withProgress:progress];
    [self.nsTextFieldStatus setStringValue:status];
}

-(void)showSpiner:(BOOL)show withProgress:(double)progress{
    if(show){
        [self.nsProgressesSendinSms startAnimation:self];
        [self.nsProgressesSendinSms setHidden:NO];
        [self.nsProgressesSendinSms setDoubleValue:progress];
    }else {
        [self.nsProgressesSendinSms setHidden:YES];
        [self.nsProgressesSendinSms stopAnimation:self];
    }
}

-(void)onTick:(NSTimer *)timer {
    /*if(progressValue <= 100){
     [self showCurrentStatus:TRUE withStatus:@"Sending message..." withProgress:progressValue];
     progressValue ++;
     }
    [self showSpiner:TRUE withProgress:[self.nsProgressesSendinSms doubleValue] + 10];
    double currentProgress = [self.nsProgressesSendinSms doubleValue];
    if(currentProgress >= 100){
        [self.timer invalidate];
    }*/
    NSLog(@"ticked");
}

@end
