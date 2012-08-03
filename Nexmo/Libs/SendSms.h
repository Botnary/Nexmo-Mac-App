//
//  SendSms.h
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-23.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmsPreferences.h"

@interface SendSms : NSObject
@property (assign) NSString *smsPhone;
@property (assign) NSString *smsMessage;
@property (assign) SmsPreferences *smsPreferences;
@property (assign) NSSound *errorSound;
@property (assign) NSSound *successSound;
-(NSString *)sendIt;
-(NSString *)getBalance;

@end
