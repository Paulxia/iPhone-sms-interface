//
//  eRoundTextView.h
//  Chat
//
//  Created by Neeraj Goyal on 3/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface eRoundTextView : UITextView 
{
	UIColor *borderColor;
	UIColor	*fillColor;
	
	CGFloat		borderWidth;
	CGFloat		roundRadius;
}

@property(nonatomic, retain) UIColor	*borderColor;
@property(nonatomic, retain) UIColor	*fillColor;

@property(nonatomic, assign) CGFloat	borderWidth;
@property(nonatomic, assign) CGFloat	roundRadius;
@end
