//
//  InputBackground.m
//  Nexmo
//
//  Created by Constantin Botnari on 12-08-02.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "InputBackground.h"

@implementation InputBackground

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
       //[self updateSize];
    }
    
    return self;
}

-(id)init{
    self = [super init];
    if(self){
        //[self updateSize];
    }
    return self;
}

- (void)updateSize{
    NSSize size;
    size.height = 49;
    size.width = 254;
    [self setFrameSize:size];
    NSLog(@"inoutbackground");
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    
    //dirtyRect.size.height = 49;
    //dirtyRect.size.width = 254;
    [super drawRect:dirtyRect];
    
    NSImage *image = [NSImage imageNamed:@"input-bg.png"]; //image for background
    [image setFlipped:YES]; //image need to be flipped
    //[self updateSize];
    //use this if You need borders
    
    //NSRect rectForBorders = NSMakeRect(2, 2, dirtyRect.size.width-4, dirtyRect.size.height-4);
    //[image drawInRect:rectForBorders fromRect:rectForBorders operation:NSCompositeSourceOver fraction:1.0];

    [image drawInRect:dirtyRect fromRect:dirtyRect operation:NSCompositeSourceOver fraction:1.0]; //no border
}

@end
