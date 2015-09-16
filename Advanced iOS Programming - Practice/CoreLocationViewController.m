//
//  CoreLocationViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "CoreLocationViewController.h"

@interface CoreLocationViewController ()

@end

@implementation CoreLocationViewController

@synthesize lbLatitude, lbLongitude;
@synthesize locManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnGetLocation:(UIButton *)sender
{
    if (!self.locManager) {
        self.locManager = [[CLLocationManager alloc] init];
        self.locManager.delegate = self;
        
        //use the significant - change location service. This is less
        //accurate, but also uses less battery:
        
        //we don't set a desired accuracy or a distance filter with this service.
        
        //This does not work in the simulator at all...Only Actual Device
        
        [self.locManager startMonitoringSignificantLocationChanges];
    }
}

- (IBAction) btnStopLocations:(id)sender
{
    if (self.locManager) {
        [self.locManager stopMonitoringSignificantLocationChanges];
        self.lbLatitude.text = @"";
        self.lbLongitude.text = @"";
    }
}

#pragma mark - location delegate method:

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //get the last location update, and its time stamp:
    CLLocation *lastLocation = [locations lastObject];
    NSDate *updateTime = lastLocation.timestamp;
    
    //how old is the update?
    NSTimeInterval updateAge = [updateTime timeIntervalSinceNow];
    //update age will be a "negative time" ...
    //if the event is less than 30 seconds old, process it...
    if (abs(updateAge) < 30.0) {
        self.lbLatitude.text = [NSString stringWithFormat:@"%f", lastLocation.coordinate.latitude];
        self.lbLongitude.text = [NSString stringWithFormat:@"%f", lastLocation.coordinate.longitude];
    }
}




@end
