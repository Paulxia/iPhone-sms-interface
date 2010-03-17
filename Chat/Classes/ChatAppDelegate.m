//
//  ChatAppDelegate.m
//  Chat
//
//  Created by Neeraj Goyal on 3/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ChatAppDelegate.h"
#import "ChatViewController.h"

@implementation ChatAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
