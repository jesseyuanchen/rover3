//
//  DetailViewController.m
//  rover3
//
//  Created by Deborah Alves on 10/20/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

static NSDictionary *location;
NSArray * locations;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 25)];
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 300, 50)];
    UILabel *rating = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 25)];
    UIButton *addFavorites = [[UIButton alloc] initWithFrame:CGRectMake(75, 140, 150, 50)];
    [addFavorites setBackgroundColor:[UIColor greenColor]];
    UIButton *removeFromFavorites = [[UIButton alloc] initWithFrame:CGRectMake(75, 200, 150, 50)];
    [removeFromFavorites setBackgroundColor:[UIColor redColor]];
    
    name.text = [self.data objectForKey:@"name"];
    address.text = [NSString stringWithFormat:@"Address: %@", [self.data objectForKey:@"vicinity"]];
    rating.text = [NSString stringWithFormat:@"Rating: %@", [self.data objectForKey:@"rating"]];
    
    name.font = [name.font fontWithSize:25];
    name.textAlignment = NSTextAlignmentCenter;
    address.textAlignment = NSTextAlignmentCenter;
    address.numberOfLines = 0;
    address.lineBreakMode = NSLineBreakByWordWrapping;
    rating.textAlignment = NSTextAlignmentCenter;
    
    [addFavorites addTarget:self action:@selector(addToFavorites) forControlEvents:UIControlEventTouchUpInside];
    [removeFromFavorites addTarget:self action:@selector(removeFromFavorites) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:name];
    [self.view addSubview:address];
    [self.view addSubview:rating];
    [self.view addSubview:addFavorites];
    [self.view addSubview:removeFromFavorites];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) addToFavorites 
{
    NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSManagedObject *newFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"Favorites" inManagedObjectContext:context];
    [newFavorite setValue:[self.data objectForKey:@"name"] forKey:@"name"];
}

- (void) removeFromFavorites
{
    NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    // retrieve set of objects
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // specify which entities we would like
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Favorites" inManagedObjectContext:context];
    [request setEntity:description];
    
    // order results
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    // handle fetching
    NSFetchedResultsController *fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    fetchController.delegate = self;
    
    locations = fetchController.fetchedObjects;
    for (int i = 0; i < [locations count]; i++){
        NSString *name = [[locations objectAtIndex:i] objectForKey:@"name"];
        if (name == [self.data objectForKey:@"name"]) {
            // delete some object [context deleteObject:]
        }
    }
}

+ (NSDictionary *)locationData
{
    return location;
}

+ (void)setAnnotation:(NSDictionary *)annotation
{
    if (location != annotation)
    {
        location = annotation;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
