//
//  ChatTestViewController.h
//  ChatTest
//
//  Created by Neeraj Goyal on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChatBoxView;

@interface ChatTestViewController : UIViewController
<UIScrollViewDelegate, UITextFieldDelegate>
{
	UITextField *msg;
	NSMutableArray *messages;
	UILabel *check;
	UIScrollView *scrollView;
	ChatBoxView *calloutView;
	NSUInteger originX;
	NSUInteger originY;
	CGSize contentSize;
	
}
@property (nonatomic, retain) IBOutlet UITextField *msg;
@property (nonatomic, retain) IBOutlet UILabel *check;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *messages;
@property (nonatomic, retain) ChatBoxView *calloutView;
-(IBAction) textFieldDoneEditing:(id)sender;
-(IBAction)textFieldDidEndEditing:(id)sender;


@end

