//
//  tweet.m
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import "tweet.h"

@implementation tweet

@synthesize coordinate, tweetId, text, userName, img;

+ (id)randomTweet {
    
    double lat = arc4random() % 90;
    lat = (arc4random() % 2 == 1) ? lat : lat * -1.0;
    //NSLog(@"lat - %f", lat);

    double lon = arc4random() % 180;
    lon = (arc4random() % 2 == 1) ? lon : lon * -1.0;
    //NSLog(@"lon - %f", lon);
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
    
    int thisId = arc4random();
    
	NSArray *contents = [[NSArray alloc] initWithObjects:@"Thanks so much for having us tonight, Norva. Sorry I wasn't my best. You all sang so loud and danced do hard. Respect.",
						@"Something is in @LWeber_27 's pants. #awkward",
						@"Holy mother of pearl!!!!",
						@"thanks everybody for a great season. send in your audition tapes to our blog. see you next year.", nil];
	NSArray *authors = [[NSArray alloc] initWithObjects:@"SomeRockstar",
						@"AFriendOfYours",
						@"RandomGirl",
						@"TelevisionCeleb", nil];
	int cindex = arc4random() % [contents count];
	int aindex = arc4random() % [authors count];
	NSString *text = [contents objectAtIndex:cindex];
	[contents release];
	NSString *userName = [authors objectAtIndex:aindex];
	[authors release];
    tweet *t = [[[tweet alloc] initWithContents:coord thisId:thisId text:text userName:userName imgUrl:@"http://a1.twimg.com/profile_images/553508996/43082001_N00_normal.jpg"] autorelease];
    return t;
}

- (id)initWithContents:(CLLocationCoordinate2D)coord thisId:(int)thisId text:(NSString *)txt userName:(NSString *)un imgUrl:(NSString *)url{
	if(self = [super init])
	{
        [self setCoordinate:coord];
        [self setTweetId:thisId];
		[self setText:txt];
		[self setUserName:un];
        [self setImg:url];
	}
	return self;
}

//TODO: finish description
- (NSString *)description {
	return [NSString stringWithFormat:@"use synthesized fields here"];
}

- (void)dealloc {
	[text release];
	[userName release];
    [super dealloc];
}

@end