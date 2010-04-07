//
//  ChatBoxView.h
//  ChatTest
//
//  Created by Neeraj Goyal on 12/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChatBoxView : UIView {
	
	NSString *message;
	//UIImageView *backgroundImage;
}
@property (nonatomic, retain) NSString *message;
//@property (nonatomic, retain) UIImageView *backgroundImage;
@end
