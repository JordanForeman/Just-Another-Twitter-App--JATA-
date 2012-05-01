//
//  jataAppDelegate.h
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>

@interface jataAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)refreshTweets;

@end
