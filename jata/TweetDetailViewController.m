//
//  TweetDetailViewController.m
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import "TweetDetailViewController.h"
#import "TweetStore.h"
#import "MapPoint.h"

@implementation TweetDetailViewController

@synthesize tw;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self initWithTweet:[[TweetStore defaultStore] createTweet]];
}

- (id)initWithTweet:(tweet *)t 
{
    if(self = [super initWithNibName:nil bundle:nil])
    {
        [self setTw:t];
        [self setTitle:[tw userName]];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSURL *url = [NSURL URLWithString:[tw img]];
    NSData *imgData = [[NSData alloc] initWithContentsOfURL:url];
    [profilePic setImage:[UIImage imageWithData:imgData]];
    [imgData release];
    
    [tweetText setText:[tw text]];
    [tweetUsername setText:[tw userName]];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([tw coordinate], 10000, 10000);
    [tweetMapview setRegion:region];
    
    MapPoint *mp = [[MapPoint alloc] initWithTweet:tw];
    [tweetMapview addAnnotation:mp];
    [mp release];
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
