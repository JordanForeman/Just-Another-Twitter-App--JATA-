//
//  jataAppDelegate.m
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//


#import "jataAppDelegate.h"
#import "tweet.h"
#import "TweetTableViewController.h"
#import "TweetMapViewController.h"
#import "TweetStore.h"

@implementation jataAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self refreshTweets];
    
    TweetTableViewController *tweetTableViewController = [[TweetTableViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] 
                                             initWithRootViewController:tweetTableViewController];
    [tweetTableViewController release];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    TweetMapViewController *tweetMapViewController = [[TweetMapViewController alloc] init];
    NSArray *viewControllers = [NSArray arrayWithObjects:navController, tweetMapViewController, nil];
    [tweetMapViewController release];
    [navController release];
    
    [tabBarController setViewControllers:viewControllers];
    
    [[self window] setRootViewController:tabBarController];
    [tabBarController release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)refreshTweets
{
    //GET REAL TWEETS
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/public_timeline.json"];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"20", @"count", nil];
    TWRequest *tweetRequest = [[TWRequest alloc] initWithURL:url parameters:parameters requestMethod:TWRequestMethodGET];
    [tweetRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSError *jsonError = nil;
        id timelineData = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&jsonError];
        if(timelineData == NULL)
        {
            NSLog(@"Didn't work");
        }
        NSDictionary *timelineDict = (NSDictionary *)timelineData;
        NSArray *tweets = (NSArray *)timelineDict;
        for(int i =0; i < [tweets count]; i++)
        {
            NSString *text = [[tweets objectAtIndex:i] objectForKey:@"text"];
            NSLog(@"%@\n",text);
            
            NSString *username = [[[tweets objectAtIndex:i] objectForKey:@"user"] objectForKey:@"screen_name"];
            NSLog(@"%@\n",username);
            
            NSString *imgUrl = [[[tweets objectAtIndex:i] objectForKey:@"user"] objectForKey:@"profile_image_url"];
            NSLog(@"%@\n", imgUrl);
            
            int tweetId = (int)[[tweets objectAtIndex:i] objectForKey:@"id"];
            //double lat = ([[tweets objectAtIndex:i] objectForKey:@"coordinates"] == @"<null>") ? 41.051371:[[(NSArray *)[[tweets objectAtIndex:i] objectForKey:@"coordinates"] objectAtIndex:0] doubleValue];
            //double lon = ([[tweets objectAtIndex:i] objectForKey:@"coordinates"] == @"<null>") ? -94.36741:[[(NSArray *)[[tweets objectAtIndex:i] objectForKey:@"coordinates"] objectAtIndex:1] doubleValue];
            double lat = 41.051371;
            double lon = -94.36741;
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
            
            tweet *t = [[tweet alloc] initWithContents:coord thisId:tweetId text:text userName:username imgUrl:imgUrl];
            [[TweetStore defaultStore] addTweet:t];
            [t release];
        }
    }];
    [tweetRequest release];
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
