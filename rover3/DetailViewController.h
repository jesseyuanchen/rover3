//
//  DetailViewController.h
//  rover3
//
//  Created by Deborah Alves on 10/20/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"

@interface DetailViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSDictionary *data;

+ (void)setAnnotation:(NSDictionary *)annotation;

@end
