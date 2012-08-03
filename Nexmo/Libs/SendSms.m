//
//  SendSms.m
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-23.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "SendSms.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"

@implementation SendSms
@synthesize smsPhone = _smsPhone;
@synthesize smsMessage = _smsMessage;
@synthesize smsPreferences = _smsPreferences;
@synthesize errorSound = _errorSound;
@synthesize successSound = _successSound;

-(id)init{
    self = [super init];
    if(self){
        self.smsPreferences = [[SmsPreferences alloc]init];
        self.errorSound = [NSSound soundNamed:@"Sosumi"];
        self.successSound = [NSSound soundNamed:@"Glass"];
    }
    return self;
}

-(NSString *)sendIt{
    NSURL *url = [[NSURL alloc]initWithString:@"http://localhost/sms/index.php"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:url];
    [request setPostValue:self.smsPhone forKey:@"phone"];
    [request setPostValue:self.smsMessage forKey:@"message"];
    [self.smsPreferences getPreferences];
    [request setPostValue:self.smsPreferences.apiKey forKey:@"apiKey"];
    [request setPostValue:self.smsPreferences.apiSecret forKey:@"apiSecret"];
    [request setPostValue:self.smsPreferences.apiFrom forKey:@"apiFrom"];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        NSLog(@"Response %@",response);
        [self playSuccess]; 
        return [[NSString alloc]initWithFormat:@"%@",response];
    }else{
        NSLog(@"error");
        [self playError]; 
        return [error localizedDescription];
    }
}

-(NSString *)getBalance{
    NSLog(@"http://rest.nexmo.com/account/get-balance/%@/%@",
          self.smsPreferences.apiKey,self.smsPreferences.apiSecret);
    //http://rest.nexmo.com/account/get-balance/%@/%@
    NSString *url = [[NSString alloc]initWithFormat:@"http://rest.nexmo.com/account/get-balance/%@/%@",
                     self.smsPreferences.apiKey,self.smsPreferences.apiSecret];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:[[NSURL alloc]initWithString:url]];
    [request setRequestMethod:@"GET"];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        NSLog(@"Balance response %@",response);
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSArray *balance = [parser objectWithString:response];
        NSString *balanceValue = [[NSString alloc]initWithFormat:@"%@",[balance valueForKey:@"value"]];
        [parser release]; parser = nil;
        NSLog(@"Balance = %@",balanceValue);
        return balanceValue;
    }else{
        NSLog(@"Balance error");
        [self playError]; 
        return [[NSString alloc]initWithFormat:@"Balance error %@",[error description]];
    }
}

- (void)playError{
    [self.errorSound play];
}

- (void)playSuccess{
    [self.successSound play];
}

@end
