//
//  PreferencesViewController.m
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-17.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "PreferencesViewController.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController
@synthesize nsTextFieldApiKey = _nsTextFieldApiKey;
@synthesize nsTextFieldApiPassword = _nsTextFieldApiPassword;
@synthesize nsTextFieldFrom = _nsTextFieldFrom;
@synthesize smsPreferences = _smsPreferences;

@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        self.smsPreferences = [[SmsPreferences alloc]init];
    }
    return self;
}

-(id)init{
    self = [super init];
    if(self){
       self.smsPreferences = [[SmsPreferences alloc]init]; 
    }
    return self;
}

- (IBAction)savePreferences:(NSButton *)sender {
    NSString *key = [self.nsTextFieldApiKey stringValue];
    NSString *secret = [self.nsTextFieldApiPassword stringValue];
    NSString *from = [self.nsTextFieldFrom stringValue];
    [self.smsPreferences savePreferences:key withSecret:secret withFrom:from];
    [self.delegate InvokePreferenceSaved:self isSaved:TRUE];
}

-(void)setPreference{
    [self.smsPreferences getPreferences];
    [self.nsTextFieldApiKey setStringValue:self.smsPreferences.apiKey];
    [self.nsTextFieldApiPassword setStringValue:self.smsPreferences.apiSecret];
    [self.nsTextFieldFrom setStringValue:self.smsPreferences.apiFrom];
}

@end
