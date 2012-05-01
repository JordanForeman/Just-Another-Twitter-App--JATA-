//
//  TweetDetailViewController.h
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@class tweet;

@interface TweetDetailViewController : UIViewController {
    IBOutlet UITextView *tweetText;
    IBOutlet UILabel *tweetUsername;
    IBOutlet MKMapView *tweetMapview;
    IBOutlet UIImageView *profilePic;
    tweet *tw;
}

@property (nonatomic, retain) tweet *tw;
- (id)initWithTweet:(tweet *)t;

@end
