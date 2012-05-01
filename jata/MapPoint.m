//
//  MapPoint.m
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import "MapPoint.h"
#import "AddressBook/AddressBook.h"
#import "MapPointStore.h"

@implementation MapPoint

@synthesize coordinate, title, subtitle, tw;

- (id)initWithCoord:(CLLocationCoordinate2D)c title:(NSString *)t subtitle:(NSString *)s {
    if ((self = [super init])) {
        coordinate = c;
        title = t;
        subtitle = s;
    }
    [[MapPointStore defaultStore] addMapPoint:self];
    return self;
}

- (id)initWithTweet:(tweet *)t {
    if((self = [super init])) {
        tw = t;
        coordinate = [tw coordinate];
        title = [tw userName];
        subtitle = [tw text];
    }
    [[MapPointStore defaultStore] addMapPoint:self];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        CLLocationDegrees lat = [aDecoder decodeDoubleForKey:@"mapPointLatitude"];
        CLLocationDegrees lon = [aDecoder decodeDoubleForKey:@"mapPointLongitude"];
        [self setCoordinate:CLLocationCoordinate2DMake(lat, lon)];
        [self setTitle:[aDecoder decodeObjectForKey:@"mapPointTitle"]];
        [self setSubtitle:[aDecoder decodeObjectForKey:@"mapPointSubTitle"]];
    }
    return self;
}

- (void)dealloc {
    [title release];
    [super dealloc];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeDouble:coordinate.latitude forKey:@"mapPointLatitude"];
    [aCoder encodeDouble:coordinate.longitude forKey:@"mapPointLongitude"];
    [aCoder encodeObject:title forKey:@"mapPointTitle"];
    [aCoder encodeObject:subtitle forKey:@"mapPointSubTitle"];
}

@end
