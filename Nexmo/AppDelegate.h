//
//  AppDelegate.h
//  Nexmo
//
//  Created by Constantin Botnari on 12-07-17.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PreferencesViewController.h"
#import "SmsViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,PreferencesDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong,nonatomic) PreferencesViewController *nexmoPref;
@property (strong,nonatomic) SmsViewController *nexmoSms;

- (IBAction)saveAction:(id)sender;
- (IBAction)nexmoPreferences:(NSMenuItem *)sender;
-(void)InvokePreferenceSaved:(PreferencesViewController *) controller  isSaved:(BOOL) saved;

@end
