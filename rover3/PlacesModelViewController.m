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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (NSArray *) getPlaces:(NSString *)keyword {
    
    float latitude = 42.369967;
    float longitude = -71.117572;
    NSString *str = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?key=AIzaSyC-na2wu6vvWzJLq53UgErCcJ7AWzaAijs&location=%f,%f&rankby=distance&sensor=false&keyword=%@", latitude, longitude, keyword];
    
    NSURL *url = [[NSURL alloc] initWithString:str];
    NSString *fileContent= [NSString stringWithContentsOfURL:url encoding:NSStringEncodingConversionAllowLossy error:nil];
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *data = (NSDictionary*) [parser objectWithString:fileContent error:nil];
    
    //NSLog(@"Raw json: %@", [data allKeys]);
    return [data valueForKey:@"results"];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
