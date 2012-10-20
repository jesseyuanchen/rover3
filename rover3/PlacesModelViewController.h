//
//  PlacesModelViewController.h
//  rover3
//
//  Created by Deborah Alves on 10/19/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import <CoreLocation/CoreLocation.h>

@interface PlacesModelViewController : UIViewController <CLLocationManagerDelegate> {
 
}

@property (nonatomic, strong) CLLocationManager *man;

- (NSMutableArray *) getPlaces:(NSString *)keyword;

@end
