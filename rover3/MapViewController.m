//
//  MapViewController.m
//  rover3
//
//  Created by Jesse Chen on 10/19/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Map", @"Map");
    }
    return self;
}
- (void)viewDidLoad
{
    // create mapView
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 480.0)];
    
    // center coordinate and span
    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(42.371343, -71.11682), MKCoordinateSpanMake(0.01, 0.01));
    mapView.region = region;
    
    NSArray *data = [PlacesModelViewController getPlaces:@"food"];
    for (int i = 1; i < [data count]; i++) {
        NSDictionary *location = [data objectAtIndex:i];
        NSDictionary *geo = [[location objectForKey:@"geometry"] objectForKey:@"location"];
        
        NSNumber *lat = [geo objectForKey:@"lat"];
        NSNumber *lng = [geo objectForKey:@"lng"];
        
        // convert to double
        double latitude = [lat doubleValue];
        double longitude = [lng doubleValue];
        
        // new pin
        Placemark *pin = [[Placemark alloc] initWithCoordinate: CLLocationCoordinate2DMake(latitude, longitude)];
        // pin.title = (NSString *)[[data objectAtIndex:i] objectForKey:@"name"];
        pin.title = @"hi";
        [mapView addAnnotation:pin];
    }
    // add pins
    
    [self.view addSubview:mapView];
    [super viewDidLoad];
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

@end
