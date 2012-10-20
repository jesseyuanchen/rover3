//
//  ListViewController.m
//  rover3
//
//  Created by Jesse Chen on 10/19/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

@synthesize results = _results;
@synthesize keyword = _keyword;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.title = NSLocalizedString(@"Places", @"Places");
        self.tabBarItem.image = [UIImage imageNamed:@"macbookIcon.png"];        
        
    }
    return self;
}

- (void)viewDidLoad
{
    man = [[CLLocationManager alloc] init];
    man.desiredAccuracy = kCLLocationAccuracyBest;
    man.distanceFilter = kCLDistanceFilterNone;
    man.delegate = self;
    [man startUpdatingLocation];
    self.currentLocation = man.location;
    
    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    search.delegate = self;
    self.tableView.tableHeaderView = search;
    
    [self searchPlaces:@"food"];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    // Configure the cell...
    cell.textLabel.text = [[self.results objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    return cell;
}

- (void)searchPlaces:(NSString *)keyword {
    NSString *str = [keyword stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    PlacesModelViewController *placesVC = [[PlacesModelViewController alloc] init];
    self.results = [placesVC getPlaces:str andLocation:self.currentLocation];
    [self.tableView reloadData];
    MapViewController *map = [[[[self.tabBarController viewControllers] objectAtIndex:1] viewControllers] objectAtIndex:0];
    [map viewDidLoad];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self searchPlaces:searchBar.text];
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations lastObject];    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailViewController *detailedViewController = [[DetailViewController alloc] init];
    detailedViewController.data = [self.results objectAtIndex:indexPath.row];
    
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailedViewController animated:YES];
    
}

@end