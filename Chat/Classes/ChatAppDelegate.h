//
//  ChatAppDelegate.h
//  Chat
//
//  Created by Neeraj Goyal on 3/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChatViewController;

@interface ChatAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ChatViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ChatViewController *viewController;

@end

