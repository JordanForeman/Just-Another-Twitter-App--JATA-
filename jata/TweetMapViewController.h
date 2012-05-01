//
//  TweetMapViewController.h
//  jata
//
//  Created by CS Student on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface TweetMapViewController : UIViewController
{
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet MKMapView *mapView;
    IBOutlet UIButton *nearbyButton;
    
    BOOL pointsLoaded;
}

@property BOOL pointsLoaded;

- (IBAction)nearbyButtonTapped:(id)sender;
- (void)loadPoints:(CLLocationCoordinate2D)userLoc;

@end
