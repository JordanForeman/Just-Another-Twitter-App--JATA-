//
//  tweet.h
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface tweet : NSObject {
	CLLocationCoordinate2D coordinate;
	int tweetId;
	NSString *text;
	NSString *userName;
    NSString *img;
}

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) int tweetId;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *img;

+(tweet *)randomTweet;

- (id)initWithContents:(CLLocationCoordinate2D)coord thisId:(int)thisId text:(NSString *)txt userName:(NSString *)un imgUrl:(NSString *)url;

@end