//
//  PreferencesViewController.h
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-17.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SmsPreferences.h"

@class PreferencesViewController;
@protocol PreferencesDelegate <NSObject>

-(void)InvokePreferenceSaved:(PreferencesViewController *) controller  isSaved:(BOOL) saved;

@end

@interface PreferencesViewController : NSViewController
@property (assign) id <PreferencesDelegate> delegate;
@property (assign) IBOutlet NSTextField *nsTextFieldApiKey;
@property (assign) IBOutlet NSTextField *nsTextFieldApiPassword;
@property (assign) IBOutlet NSTextField *nsTextFieldFrom;
@property (assign) SmsPreferences *smsPreferences;

- (IBAction)savePreferences:(NSButton *)sender;
-(void)setPreference;
@end
