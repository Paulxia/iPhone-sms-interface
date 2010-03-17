//
//  ChatViewController.m
//  Chat
// 
//  Created by Neeraj Goyal on 3/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatBox.h"
#import "UIImage+Resize.h"

@implementation ChatViewController

@synthesize chatAreaScrollView, textEnterView; 
@synthesize keyboardShown, txtViewMessage;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.keyboardShown = NO;
	originY = 10;
	contentSize = CGSizeMake(320, 0);
	UIImage *im = [[UIImage imageNamed:@"02.jpg"] resizedImage:self.view.frame.size interpolationQuality:kCGInterpolationHigh];
	self.view.backgroundColor = [UIColor colorWithPatternImage:im];
}

-(void)viewWillAppear:(BOOL)animated
{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) 
												 name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) 
												 name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self.chatAreaScrollView release];
	[self.txtViewMessage release];
	[self.textEnterView	release];
	
    [super dealloc];
}


#pragma mark -
#pragma mark helper functions

#pragma mark -
#pragma mark IBAction methods

-(void)sendButtonPressed:(id)sender
{
	if([self.txtViewMessage.text length]>0)
	{
		UIFont *fontt = self.txtViewMessage.font;
		NSString *message = self.txtViewMessage.text;
		
		CGSize constrainedSize = CGSizeMake(230.0f, 999.0f);
		CGSize boundingRectSize =  [message sizeWithFont:fontt
									   constrainedToSize:constrainedSize 
										   lineBreakMode:UILineBreakModeCharacterWrap];
		
		self.txtViewMessage.text = @"";
		
		CGRect frame = CGRectMake(10, originY, boundingRectSize.width, boundingRectSize.height);
		if (frame.size.width <51) 
		{
			frame.size.width = 51;
		}
		
		UIColor *colour = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.0];
		ChatBox *box = [[ChatBox alloc] initWithMessage:message color:colour allignment:YES andFrame:frame];
		
		[self.chatAreaScrollView addSubview:box];
		
		/* calculate the new position for next box */
 		originY = originY + box.frame.size.height + SafeY;
		contentSize.height = self.chatAreaScrollView.frame.size.height + originY;
		
		[self.chatAreaScrollView setContentSize:contentSize];
		[self.chatAreaScrollView scrollRectToVisible:box.frame animated:YES];
		
		[box release];
	}
	
	[self.txtViewMessage resignFirstResponder];
}

#pragma mark -
#pragma mark Keyboard Handling

- (void)keyboardWillShow:(NSNotification *)notification {
	if (self.keyboardShown)
        return;
	
    NSDictionary* info = [notification userInfo];
	
    // Get the size of the keyboard.
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
	
    CGRect scrollFrame = [self.chatAreaScrollView frame];
    scrollFrame.size.height -= keyboardSize.height;
    self.chatAreaScrollView.frame = scrollFrame;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	CGRect viewFrame = [self.textEnterView frame];
	viewFrame.origin.y -=keyboardSize.height;
	self.textEnterView.frame = viewFrame;
	[UIView commitAnimations];
	
    self.keyboardShown = YES;
}

- (void)keyboardWillHide:(NSNotification *)note 
{
	NSDictionary* info = [note userInfo];
	
    // Get the size of the keyboard.
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
	
    // Reset the height of the scroll view to its original value
    CGRect scrollFrame = [self.chatAreaScrollView frame];
    scrollFrame.size.height += keyboardSize.height;
    self.chatAreaScrollView.frame = scrollFrame;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	CGRect viewFrame = [self.textEnterView frame];
	viewFrame.origin.y +=keyboardSize.height;
	self.textEnterView.frame = viewFrame;
	[UIView commitAnimations];

	self.keyboardShown = NO;
}

#pragma mark -
#pragma mark UITextViewDelegate

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
	return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	return YES;
}

#pragma mark -
#pragma mark Touches Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}
@end
