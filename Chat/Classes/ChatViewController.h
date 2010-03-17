//
//  ChatViewController.h
//  Chat
//
//  Created by Neeraj Goyal on 3/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "eRoundTextView.h"

#define SafeY 15

@class ChatBox;
@interface ChatViewController : UIViewController 
{
	UIScrollView		*chatAreaScrollView;
	UIView				*textEnterView;
	
	eRoundTextView		*txtViewMessage;
	BOOL				keyboardShown;
	CGFloat				originY;
	CGSize				contentSize;
	
}

@property(nonatomic, retain) IBOutlet UIScrollView *chatAreaScrollView;
@property(nonatomic, retain) IBOutlet UIView *textEnterView;

@property(nonatomic, retain) IBOutlet eRoundTextView *txtViewMessage;
@property(nonatomic, assign) BOOL keyboardShown;

-(IBAction) sendButtonPressed:(id)sender;

@end

