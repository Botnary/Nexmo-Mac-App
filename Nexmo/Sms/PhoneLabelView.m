//
//  PhoneLabelView.m
//  Nexmo
//
//  Created by Constantin Botnari on 12-08-03.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "PhoneLabelView.h"

@implementation PhoneLabelView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        //[self updateSize];
    }
    
    return self;
}

- (id)init{
    self = [super self];
    if(self){
        //[self updateSize];
    }
    return self;
}

- (void)updateSize{
    NSSize size;
    size.height = 60;
    size.width = 144;
    [self setFrameSize:size];
    NSLog(@"inoutbackground");
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
   // [self updateSize];
    NSImage *image = [NSImage imageNamed:@"phone-label.png"]; //image for background
    [image setFlipped:YES]; //image need to be flipped
    //[self updateSize];
    //use this if You need borders
    
    //NSRect rectForBorders = NSMakeRect(2, 2, dirtyRect.size.width-4, dirtyRect.size.height-4);
    //[image drawInRect:rectForBorders fromRect:rectForBorders operation:NSCompositeSourceOver fraction:1.0];
    
    [image drawInRect:dirtyRect fromRect:dirtyRect operation:NSCompositeSourceOver fraction:1.0]; //no border
    NSLog(@"phone label");
}

@end
