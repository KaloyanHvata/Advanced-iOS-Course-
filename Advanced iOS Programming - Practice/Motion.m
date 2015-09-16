//
//  Motion.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "Motion.h"

@implementation Motion

@synthesize delegate,_manager;

#pragma mark - get single update:

-(void) pullAccelerationWithX:(double *)x andY:(double *)y andZ:(double *)z{

    self._manager = [[CMMotionManager alloc]init];
    if (self._manager.accelerometerActive) {
        
        [self._manager startAccelerometerUpdates];
        *x = self._manager.accelerometerData.acceleration.x;
        *y = self._manager.accelerometerData.acceleration.y;
        *z = self._manager.accelerometerData.acceleration.z;
        [self._manager stopAccelerometerUpdates];
        
    }else{
    
        [self.delegate motionSentMessage:@"No Accelerometer Available"];
        
    }
}
#pragma mark - get continuos updates:
- (void)startPushingAccelerationUpdatesWithX:(double *)x
                                        andY:(double *)y
                                        andZ:(double *)z{
    self._manager = [[CMMotionManager alloc] init];
    if (self._manager.accelerometerAvailable) {
        NSTimeInterval timeInterval = 0.05;
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        self._manager.accelerometerUpdateInterval = timeInterval;
        [self._manager
         startAccelerometerUpdatesToQueue:queue
         withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
             *x = accelerometerData.acceleration.x;
             *y = accelerometerData.acceleration.y;
             *z = accelerometerData.acceleration.z;
             [self.delegate motionSentX:*x andY:*y andZ:*z];
         }];
    } else {
        [self.delegate motionSentMessage:@"No Accelerometer Available"];
    }
}

- (void)stopPushingAccelerationUpdates
{
    if (self._manager.accelerometerAvailable && self._manager.accelerometerActive) {
        [self._manager stopAccelerometerUpdates];
    }
}

@end
