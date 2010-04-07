//
//  ChatTestAppDelegate.h
//  ChatTest
//
//  Created by Neeraj Goyal on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChatTestViewController;

@interface ChatTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ChatTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ChatTestViewController *viewController;

@end

