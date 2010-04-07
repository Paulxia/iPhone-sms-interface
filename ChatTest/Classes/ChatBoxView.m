//
//  ChatBoxView.m
//  ChatTest
//
//  Created by Neeraj Goyal on 12/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ChatBoxView.h"


@implementation ChatBoxView

@synthesize message;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		self.opaque = YES;
		self.backgroundColor = [UIColor clearColor];
		
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
#define MAIN_FONT_SIZE 16
#define WIDTH_OF_CALLOUT 250
#define MAX_CALLOUT_HEIGHT 420
	
	// Drawing code
	CGSize constrainedSize = CGSizeMake (WIDTH_OF_CALLOUT, MAX_CALLOUT_HEIGHT);
	
	UIFont *mainFont = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
	CGSize sizeOfMessageBox;
	
	CGRect calloutRectangle;
	CGRect imageRect;
	
	sizeOfMessageBox = [message sizeWithFont:mainFont constrainedToSize:constrainedSize lineBreakMode:UILineBreakModeCharacterWrap];
	calloutRectangle = CGRectMake(5, 5, sizeOfMessageBox.width, sizeOfMessageBox.height);
	imageRect = CGRectMake(0, 0, sizeOfMessageBox.width + 20, sizeOfMessageBox.height + 20);
	UIImage *backgroundimage = [UIImage  imageNamed:@"deleteme.PNG"];
	UIImage *reqImage = [backgroundimage stretchableImageWithLeftCapWidth:10.0 topCapHeight:10.0];
	[backgroundimage release];
	[reqImage drawInRect:imageRect blendMode:kCGBlendModeNormal alpha:1.0];
	//[reqImage release];
	[self.message drawInRect:calloutRectangle withFont:mainFont lineBreakMode:UILineBreakModeWordWrap];
	
}


- (void)dealloc {
	[self.message release];
	[message release];
    [super dealloc];
}


@end
