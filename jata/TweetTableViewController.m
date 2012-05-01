//
//  TweetTableViewController.m
//  Just Another Twitter App
//
//  Created by Jordan Foreman on 11/18/11.
//  Copyright (c) 2011 Jordan Foreman. All rights reserved.
//

#import "TweetTableViewController.h"
#import "TweetDetailViewController.h"


@implementation TweetTableViewController

- (id)init {
    if(self = [super initWithStyle:UITableViewStyleGrouped])
    {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Tweets"];
        [tbi setImage:[UIImage imageNamed:@"Timeline.png"]];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)addTweet
{
    [[TweetStore defaultStore] createTweet];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    if(self){
        [self setTitle:@"JATA"];
        
        UIBarButtonItem *back = [[UIBarButtonItem alloc] init];
        [back setTitle:@"Main"];
        
        [[self navigationItem] setBackBarButtonItem:back];
        [back release];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[self tableView] reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[TweetStore defaultStore] allTweets] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    tweet *t = [[[TweetStore defaultStore] allTweets] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[t text]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetDetailViewController *detailViewController = [[[TweetDetailViewController alloc] initWithTweet:[[[TweetStore defaultStore] allTweets] objectAtIndex:[indexPath row]]] autorelease];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

@end
