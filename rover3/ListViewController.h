//
//  ListViewController.h
//  rover3
//
//  Created by Jesse Chen on 10/19/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlacesModelViewController.h"

@interface ListViewController : UITableViewController

@property NSMutableArray *results;
@property UISearchBar *keywordField;
@property NSString *keyword;


- (void)searchPlaces:(NSString *)keyword;

@end
