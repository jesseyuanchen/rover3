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
    
    name.text = [self.data objectForKey:@"name"];
    address.text = [NSString stringWithFormat:@"Address: %@", [self.data objectForKey:@"vicinity"]];
    rating.text = [NSString stringWithFormat:@"Rating: %@", [self.data objectForKey:@"rating"]];
    
    name.font = [name.font fontWithSize:25];
    name.textAlignment = NSTextAlignmentCenter;
    address.textAlignment = NSTextAlignmentCenter;
    address.numberOfLines = 0;
    address.lineBreakMode = NSLineBreakByWordWrapping;
    rating.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:name];
    [self.view addSubview:address];
    [self.view addSubview:rating];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
