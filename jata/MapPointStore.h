//
//  MapPointStore.h
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import <Foundation/Foundation.h>

@class MapPoint;

@interface MapPointStore : NSObject
{
    NSMutableArray *allMapPoints;
}

+ (MapPointStore *)defaultStore;

- (NSArray *)allMapPoints;
- (void)addMapPoint:(MapPoint *)p;

@end
