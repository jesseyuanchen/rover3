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
    
    // get current location - not working
    // hardcode location instead :(
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(42.371343, -71.11682);
    
    // center coordinate and span
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(0.01, 0.01));
    mapView.region = region;
    
    ListViewController *lst = [[[[self.tabBarController viewControllers] objectAtIndex:0] viewControllers] objectAtIndex:0];
   
    NSArray *data = lst.results;
    for (int i = 0; i < [data count]; i++) {
        
        NSDictionary *location = [data objectAtIndex:i];
        NSDictionary *geo = [[location objectForKey:@"geometry"] objectForKey:@"location"];
        
        NSNumber *lat = [geo objectForKey:@"lat"];
        NSNumber *lng = [geo objectForKey:@"lng"];
        
        // convert to dou
        double latitude = [lat doubleValue];
        double longitude = [lng doubleValue];
        
        // new pin
        Placemark *pin = [[Placemark alloc] initWithCoordinate: CLLocationCoordinate2DMake(latitude, longitude)];
        pin.title = [NSString stringWithFormat:@"%@", [[data objectAtIndex:i] objectForKey:@"name"]];
        pin.data = [data objectAtIndex:i];
        
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
    pinView.rightCalloutAccessoryView = rightButton;
    return pinView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view 
calloutAccessoryControlTapped:(UIControl *)control
{
    Placemark *pin = view.annotation;
    DetailViewController *detailView = [[DetailViewController alloc] init];
    detailView.data = pin.data;
    detailView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:detailView animated:YES];
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
