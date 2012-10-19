//
//  PlacesModelViewController.h
//  rover3
//
//  Created by Deborah Alves on 10/19/12.
//  Copyright (c) 2012 Jesse Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"


@interface PlacesModelViewController : UIViewController

+ (NSArray *) getPlaces:(NSString *)keyword;


@end
