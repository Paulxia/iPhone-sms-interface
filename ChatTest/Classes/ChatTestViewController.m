//
//  ChatTestViewController.m
//  ChatTest
//
//  Created by Neeraj Goyal on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ChatTestViewController.h"
#import "ChatBoxView.h"

@implementation ChatTestViewController

@synthesize msg;
@synthesize messages;
@synthesize check;
@synthesize scrollView;
@synthesize calloutView;

-(IBAction) textFieldDoneEditing:(id)sender {
	
	NSString *message = self.msg.text;
	NSUInteger lengthOfMessage = [message length];
	
	if(lengthOfMessage > 0)
	{
		if(self.messages == nil)
		messages = [[NSMutableArray alloc] initWithObjects:message, nil];
		else
		[messages addObject:message];
		NSString *str = [NSString stringWithFormat:@"%d",[messages count]];
		self.check.text = str;
		[message release];		
	}
	
	[sender resignFirstResponder];
	
}

- (IBAction)textFieldDidEndEditing:(id)sender
{

#define MAIN_FONT_SIZE 18
#define WIDTH_OF_CALLOUT 300
#define MAX_CALLOUT_HEIGHT 420
#define SAFE_Y 10
	
	CGSize constrainedSize = CGSizeMake (WIDTH_OF_CALLOUT, MAX_CALLOUT_HEIGHT);
	NSString *messageHere = self.msg.text;
	NSUInteger lengthOfMessage = [messageHere length];
	
	if(lengthOfMessage > 0)
	{
		UIFont *mainFont = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
		CGSize size;
		size = [messageHere sizeWithFont:mainFont constrainedToSize:constrainedSize lineBreakMode:UILineBreakModeCharacterWrap];
		CGRect frame = CGRectMake(originX, originY, size.width, size.height);
		calloutView = [[ChatBoxView alloc] initWithFrame:frame];
		calloutView.message = messageHere;
		originY = originY + size.height + SAFE_Y ;
		[scrollView addSubview:calloutView];
		[scrollView bringSubviewToFront:calloutView];
		//contentSize.width += size.width;
		contentSize.height = originY;
		[scrollView setContentSize:contentSize];
	//	[scrollView setNeedsDisplay];
		[scrollView scrollRectToVisible:frame animated:YES];
		[calloutView release];
	}
	
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	originX = 10;
	originY	= 10;
	scrollView.scrollEnabled = YES;
	scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
	scrollView.showsVerticalScrollIndicator = YES;
	scrollView.bounces = NO;
	contentSize = CGSizeMake(320,0);
	//[scrollView setContentSize:CGSizeMake(320, [scrollView bounds].size.height)];
	[super viewDidLoad];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [super dealloc];
}

@end
