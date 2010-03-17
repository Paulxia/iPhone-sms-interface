//
//  ChatBox.h
//  Chat
//
//  Created by Neeraj Goyal on 3/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ChatBox : UITextView 
{
	UIColor		*color;
	BOOL		allignment;
}

-(id)initWithMessage:(NSString *)msg color:(UIColor *)colour allignment:(BOOL)allign andFrame:(CGRect)frame;

@property(nonatomic, retain) UIColor	*color;
@end
