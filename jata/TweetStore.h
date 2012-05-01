//
//  TweetStore.h
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import <Foundation/Foundation.h>

@class tweet;

@interface TweetStore : NSObject {
    NSMutableArray *allTweets;
}

+ (TweetStore *)defaultStore;
- (void)removeTweet:(tweet *)t;
- (void)addTweet:(tweet *)t;
- (NSArray *)allTweets;
- (tweet *)createTweet;
- (void)moveTweetAtIndex:(int)from
                 toIndex:(int)to;

@end
