//
//  PlacesModelViewController.m
//  rover3
//
//  Created by Deborah Alves on 10/19/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import "PlacesModelViewController.h"

@interface PlacesModelViewController ()

@end

@implementation PlacesModelViewController

@synthesize man = _man;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
            }
    return self;
}

- (NSMutableArray *) getPlaces:(NSString *)keyword {
    
    /*
    // gets current location - not working
    self.man = [[CLLocationManager alloc] init];
    self.man.delegate = self;
    self.man.desiredAccuracy = kCLLocationAccuracyBest;
    self.man.distanceFilter = kCLDistanceFilterNone;
    [self.man startUpdatingLocation];
    
    CLLocation *loc = self.man.location;
        
    float latitude, longitude;
    if (self.man == nil) {
        latitude = 42.369967;
        longitude = -71.117572;
        NSLog(@"fail");
    }
    else {
        latitude = [loc coordinate].latitude;
        longitude = [loc coordinate].longitude;
        NSLog(@"yay!  %@", loc);
    }
    */
    
    // hardcoding location instead :(
    float latitude, longitude;
    latitude = 42.371343;
    longitude = -71.11682;
    
    NSString *str = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?key=AIzaSyC-na2wu6vvWzJLq53UgErCcJ7AWzaAijs&location=%f,%f&rankby=distance&sensor=false&keyword=%@", latitude, longitude, keyword];
    
    NSURL *url = [[NSURL alloc] initWithString:str];
    NSString *fileContent= [NSString stringWithContentsOfURL:url encoding:NSStringEncodingConversionAllowLossy error:nil];
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *data = (NSDictionary*) [parser objectWithString:fileContent error:nil];
    
    
    return [data valueForKey:@"results"];
}



- (void)viewDidLoad
{
    
    self.man = [[CLLocationManager alloc] init];
    self.man.delegate = self;
    self.man.desiredAccuracy = kCLLocationAccuracyBest;
    self.man.distanceFilter = kCLDistanceFilterNone;
    [self.man startUpdatingLocation];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
