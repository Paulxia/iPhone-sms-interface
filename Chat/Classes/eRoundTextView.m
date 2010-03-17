//
//  eRoundTextView.m
//  Chat
//
//  Created by Neeraj Goyal on 3/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "eRoundTextView.h"


@implementation eRoundTextView

@synthesize borderColor, fillColor;
@synthesize borderWidth, roundRadius;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.borderColor = [UIColor blackColor];
		self.fillColor = [UIColor	whiteColor];
		self.borderWidth = 2.0;
		self.roundRadius = 10.0;
    }
    return self;
}

-(void)awakeFromNib
{
	self.borderColor = [UIColor blackColor];
	self.fillColor = [UIColor	whiteColor];
	self.borderWidth = 2.0;
	self.roundRadius = 10.0;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	CGRect localRect = CGRectInset(rect, self.borderWidth / 2, self.borderWidth / 2);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	
	CGContextTranslateCTM(context, self.borderWidth / 2, self.borderWidth / 2);
	
	// create the border - we start at the top left edge (without including the edge itself) and move around counter-clockwise
	CGContextMoveToPoint(context, 0.0, self.roundRadius);
	CGContextAddLineToPoint(context, 0.0, (localRect.size.height - self.roundRadius));
	CGContextAddCurveToPoint(context, 0.0, localRect.size.height,
							 self.roundRadius, localRect.size.height,
							 self.roundRadius, localRect.size.height);
	
	CGContextAddLineToPoint(context, (localRect.size.width - self.roundRadius), localRect.size.height);
	CGContextAddCurveToPoint(context, localRect.size.width, localRect.size.height,
							 localRect.size.width, (localRect.size.height - self.roundRadius),
							 localRect.size.width, (localRect.size.height - self.roundRadius));
	
	CGContextAddLineToPoint(context, localRect.size.width, self.roundRadius);
	CGContextAddCurveToPoint(context, localRect.size.width, 0.0,
							 localRect.size.width - self.roundRadius, 0.0,
							 localRect.size.width - self.roundRadius, 0.0);
	
	CGContextAddLineToPoint(context, self.roundRadius, 0.0);
	CGContextAddCurveToPoint(context, 0.0, 0.0,
							 0.0, self.roundRadius,
							 0.0, self.roundRadius);
	
	CGContextClosePath(context);
	
	CGContextRestoreGState(context);
	
	// draw
	[self.fillColor setFill];
	[self.borderColor setStroke];
	CGContextSetLineWidth(context, self.borderWidth);
	
	CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)dealloc {
	[self.fillColor release];
	[self.borderColor release];
    [super dealloc];
}


@end
