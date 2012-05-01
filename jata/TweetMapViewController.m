//
//  TweetMapViewController.m
//  jata
//
//  Created by CS Student on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TweetMapViewController.h"
#import "TweetStore.h"
#import "MapPoint.h"

//#if TARGET_IPHONE_SIMULATOR
//
//@interface CLLocationManager (Simulator)
//-(void)hack;
//@end
//
//@implementation CLLocationManager (Simulator)
//
//- (void)hack {
//    CLLocation *fake = [[[CLLocation alloc] initWithLatitude:41.4 longitude:-92.93] autorelease];
//    [[self delegate] locationManager:self didUpdateToLocation:fake fromLocation:fake];
//}
//
//- (void)startUpdatingLocation {
//    [self performSelector:@selector(hack) withObject:nil afterDelay:0.1];
//}
//
//@end
//
//#endif

@implementation TweetMapViewController

@synthesize pointsLoaded;

#pragma mark -
#pragma mark Initializers

- (id)init
{
    if(self = [super initWithNibName:nil bundle:nil]) 
    {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Nearby"];
        [tbi setImage:[UIImage imageNamed:@"Map.png"]];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)loadPoints:(CLLocationCoordinate2D)userLoc
{
    if(!pointsLoaded)
    {
        for(int i = 0; i < [[[TweetStore defaultStore] allTweets] count]; i++)
        {
            tweet *t = [[[TweetStore defaultStore] allTweets] objectAtIndex:i];
            if(YES) //TODO: Make this YES only if tweets are close enough to userLoc
            {
                MapPoint *mp = [[MapPoint alloc] initWithTweet:t];
                [mapView addAnnotation:mp];
                [mp release];
            }
        }
        pointsLoaded = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([userLocation coordinate], 1000, 1000);
    [mapView setRegion:region animated: YES];
    [activityIndicator stopAnimating];
    [activityIndicator setHidden:YES];
    [mapView setShowsUserLocation:NO];
    [self loadPoints:[userLocation coordinate]];
}

- (IBAction)nearbyButtonTapped:(id)sender
{
    [activityIndicator startAnimating];
    [mapView setShowsUserLocation:YES];
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [activityIndicator startAnimating];
    [mapView setDelegate:self]; //TODO: fix this
    [mapView setShowsUserLocation:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
