//
//  Placemark.h
//  seminar2
//
//  Created by Louis Li on 9/29/12.
//  Copyright (c) 2012 Louis Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Placemark : NSObject <MKAnnotation>
- (id) initWithCoordinate: (CLLocationCoordinate2D) coord;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) NSString *title;

@end
