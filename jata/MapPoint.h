//
//  MapPoint.h
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "tweet.h"

@interface MapPoint : NSObject <MKAnnotation, NSCoding>{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    
    tweet *tw;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) tweet *tw;

- (id)initWithTweet:(tweet *)t;
- (id)initWithCoord:(CLLocationCoordinate2D)c title:(NSString *)t subtitle:(NSString *)s;

@end
