//
//  MapPointStore.m
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import "MapPointStore.h"
#import "MapPoint.h"

static MapPointStore *defaultStore = nil;

@implementation MapPointStore

+ (MapPointStore *)defaultStore
{
    if(!defaultStore)
    {
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
    if(defaultStore)
    {
        return defaultStore;
    }
    
    self = [super init];
    if(self)
    {
        allMapPoints = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allMapPoints
{
    return allMapPoints;
}

- (void)addMapPoint:(MapPoint *)p
{
    [allMapPoints addObject:p];
}

- (id)retain
{
    return self;
}

- (void)release
{
    //do nothing
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

@end
