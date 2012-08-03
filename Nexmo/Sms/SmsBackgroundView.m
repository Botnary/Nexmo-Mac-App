//
//  SmsBackgroundView.m
//  Nexmo
//
//  Created by Constantin Botnari on 12-08-02.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "SmsBackgroundView.h"

@implementation SmsBackgroundView
@synthesize imageBackground = _imageBackground;


- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    [super drawRect:dirtyRect];
    self.imageBackground = [NSImage imageNamed:@"transparent_glass_ui_pack.png"];
    [self.imageBackground setFlipped:YES];
    
    NSSize isize = [self.imageBackground size];
    [self.imageBackground drawInRect:[self bounds] fromRect:NSMakeRect(0.0, 0.0, isize.width, isize.height) operation: NSCompositeHighlight fraction:1.0];
    //NSRectFill(dirtyRect);

    //self.myImage.backgroundColor = 
    NSLog(@"drawRect done...");
    
}

- (void)awakeFromNib
{
    //[self setDrawsBackground:NO];
    //[self setNeedsDisplay:YES];
    
    //NSLog(@"awakeFromNib done...");
}


@end
