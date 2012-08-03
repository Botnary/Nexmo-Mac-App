//
//  SmsPreferences.h
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-25.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmsPreferences : NSObject
@property (assign) NSString *apiKey;
@property (assign) NSString *apiSecret;
@property (assign) NSString *apiFrom;

-(void)savePreferences:(NSString *)aKey withSecret:(NSString *)aSecret withFrom:(NSString *)aFrom;
-(void)getPreferences;
@end
