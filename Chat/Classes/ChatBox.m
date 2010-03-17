//
//  ChatBox.m
//  Chat
//
//  Created by Neeraj Goyal on 3/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChatBox.h"


@implementation ChatBox
@synthesize color;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

-(id)initWithMessage:(NSString *)msg color:(UIColor *)colour allignment:(BOOL)allign andFrame:(CGRect)frame
{
	if (self = [self initWithFrame:frame]) {
        // Initialization code
		self.opaque = YES;
		self.text = msg;
		self.textColor = [UIColor whiteColor];
		self.color = colour;
		self.editable = NO;
		self.backgroundColor = [UIColor clearColor];
		self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
		self.scrollEnabled = NO;
		allignment = allign;
		if(allign)
		{
			self.textAlignment = UITextAlignmentLeft;
		}
		else 
		{
			self.textAlignment = UITextAlignmentRight;
		}
		
		frame.size.height = frame.size.height + 15;
		self.frame = frame;
		
    }
    return self;
}

- (void)drawRect:(CGRect)rect 
{
    // Drawing code
	
	CGRect restoreRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height - 10);
	CGRect localRect = CGRectInset(restoreRect, 1.0 / 2, 1.0 /  2);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	CGFloat radius = 10.0;
	CGContextTranslateCTM(context, 1.0 / 2, 1.0 / 2);
	
	// create the border - we start at the top left edge (without including the edge itself) and move around counter-clockwise
	CGContextMoveToPoint(context, 0.0, radius);
	CGContextAddLineToPoint(context, 0.0, (localRect.size.height - radius));
	CGContextAddCurveToPoint(context, 0.0, localRect.size.height,
							 radius, localRect.size.height,
							 radius, localRect.size.height);
	
	if (allignment) 
	{
		CGContextAddLineToPoint(context, radius + 5, localRect.size.height + 10);
		CGContextAddLineToPoint(context, radius + 10, localRect.size.height);
		
		CGContextAddLineToPoint(context, (localRect.size.width - radius), localRect.size.height);
		CGContextAddCurveToPoint(context, localRect.size.width, localRect.size.height,
								 localRect.size.width, (localRect.size.height - radius),
								 localRect.size.width, (localRect.size.height - radius));
		
	}
	else 
	{
		CGContextAddLineToPoint(context, localRect.size.width - radius - 10, localRect.size.height);
		CGContextAddLineToPoint(context, localRect.size.width - radius - 5 , localRect.size.height + 10);
		CGContextAddLineToPoint(context, localRect.size.width - radius , localRect.size.height);

	}

	CGContextAddCurveToPoint(context, localRect.size.width, localRect.size.height,
							 localRect.size.width, (localRect.size.height - radius),
							 localRect.size.width, (localRect.size.height - radius));
	
	CGContextAddLineToPoint(context, localRect.size.width, radius);
	CGContextAddCurveToPoint(context, localRect.size.width, 0.0,
							 localRect.size.width - radius, 0.0,
							 localRect.size.width - radius, 0.0);
	
	CGContextAddLineToPoint(context, radius, 0.0);
	CGContextAddCurveToPoint(context, 0.0, 0.0,
							 0.0, radius,
							 0.0, radius);
	
	CGContextClosePath(context);
	
	CGContextRestoreGState(context);
	
	// draw
	[self.color setFill];
	[[self.color colorWithAlphaComponent:1.0] setStroke];
	CGContextSetLineWidth(context, 1.0);
	CGContextDrawPath(context, kCGPathFillStroke);
	
}

- (void)dealloc {
	[self.color release];
    [super dealloc];
}


@end
