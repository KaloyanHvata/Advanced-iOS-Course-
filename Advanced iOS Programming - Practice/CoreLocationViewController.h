//
//  CoreLocationViewController.h
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"

@interface CoreLocationViewController : UIViewController<CLLocationManagerDelegate>

//Significant Change CoreLocation Service - Saves battery but is less accurate
@property (nonatomic, weak) IBOutlet UILabel *lbLatitude;
@property (nonatomic, weak) IBOutlet UILabel *lbLongitude;
@property (nonatomic, strong) CLLocationManager *locManager;

- (IBAction) btnGetLocation:(UIButton *) sender;
- (IBAction) btnStopLocations:(id)sender;

@end
