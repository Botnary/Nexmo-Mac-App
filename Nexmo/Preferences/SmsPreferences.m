//
//  SmsPreferences.m
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-25.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "SmsPreferences.h"

@implementation SmsPreferences
@synthesize apiKey = _apiKey;
@synthesize apiSecret = _apiSecret;
@synthesize apiFrom = _apiFrom;

-(id)init{
    self = [super init];
    if(self){
        [self getPreferences];
    }
    return self;
}

-(void)savePreferences:(NSString *)aKey withSecret:(NSString *)aSecret withFrom:(NSString *)aFrom{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:aKey forKey:@"nexmoApiKey"];
    [prefs setObject:aSecret forKey:@"nexmoApiPasswd"];
    [prefs setObject:aFrom forKey:@"nexmoFrom"];
    [prefs synchronize];
}

-(void)getPreferences{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    self.apiKey = [prefs stringForKey:@"nexmoApiKey"];
    self.apiSecret = [prefs stringForKey:@"nexmoApiPasswd"];
    self.apiFrom = [prefs stringForKey:@"nexmoFrom"];
    [prefs synchronize];
}

@end
