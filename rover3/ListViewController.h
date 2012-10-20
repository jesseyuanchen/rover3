//
//  ListViewController.h
//  rover3
//
//  Created by Jesse Chen on 10/19/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlacesModelViewController.h"
#import "DetailViewController.h"
#import "MapViewController.h"

@interface ListViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *results;
@property (nonatomic, strong) NSString *keyword;


- (void)searchPlaces:(NSString *)keyword;

@end
