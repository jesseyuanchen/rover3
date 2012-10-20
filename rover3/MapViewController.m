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
    mapView.delegate = self;
    
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
        // pin.title = [[data objectAtIndex:i] objectForKey:@"name"];
        pin.title = @"Work in Progress";
        [mapView addAnnotation:pin];
        
    }
    // add pins
    
    [self.view addSubview:mapView];
    [super viewDidLoad];
}
- (MKAnnotationView *)mapView:(MKMapView *)sender viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton setTitle:annotation.title forState:UIControlStateNormal];
    [rightButton addTarget:self 
                    action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
    pinView.rightCalloutAccessoryView = rightButton;
    return pinView;
}

-(void)showDetails:(id)sender
{
    NSLog(@"hi");
    DetailedViewController *details = [[DetailedViewController alloc] initWithNibName:@"DetailedViewController" bundle:nil];
    details.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:details animated:YES];
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view 
calloutAccessoryControlTapped:(UIControl *)control
{

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
