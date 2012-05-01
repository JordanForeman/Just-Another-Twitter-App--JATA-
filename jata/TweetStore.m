//
//  TweetStore.h
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import "TweetStore.h"
#import "tweet.h"

static TweetStore *defaultStore = nil;

@implementation TweetStore

+(TweetStore *)defaultStore 
{
    if(!defaultStore) {
        defaultStore = [[super allocWithZone:NULL] init];
    }
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    if (defaultStore) {
        return defaultStore;
    }
    
    self = [super init];
    if(self){
        allTweets = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allTweets
{
    return allTweets;
}

- (tweet *)createTweet
{
    tweet *t = [tweet randomTweet];
    
    [allTweets addObject:t];
    
    return t;
}

- (void)removeTweet:(tweet *)t
{
    [allTweets removeObjectIdenticalTo:t];
}

- (void)addTweet:(tweet *)t
{
    [allTweets addObject:t];
}

- (void)moveTweetAtIndex:(int)from 
                 toIndex:(int)to
{
    if(from == to)
    {
        return;
    }
    tweet *t = [allTweets objectAtIndex:from];
    [t retain];
    [allTweets removeObjectAtIndex:from];
    [allTweets insertObject:t atIndex:to];
    [t release];
}

- (id)retain
{
    return self;
}

- (void)release //TODO: Can I fix this?
{
    //Do nothing
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

@end
