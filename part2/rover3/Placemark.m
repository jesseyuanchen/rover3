//
//  Placemark.m
//  seminar2
//
//  Created by Louis Li on 9/29/12.
//  Copyright (c) 2012 Louis Li. All rights reserved.
//

#import "Placemark.h"

@implementation Placemark
@synthesize coordinate;

- (id) initWithCoordinate: (CLLocationCoordinate2D) coord {
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}


@end
