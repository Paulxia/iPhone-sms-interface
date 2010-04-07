//
//  ChatTestAppDelegate.m
//  ChatTest
//
//  Created by Neeraj Goyal on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ChatTestAppDelegate.h"
#import "ChatTestViewController.h"

@implementation ChatTestAppDelegate

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
