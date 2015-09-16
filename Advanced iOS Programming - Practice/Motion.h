//
//  Motion.h
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@protocol MotionDelegate <NSObject>

-(void) motionSentMessage: (NSString*)msg;
-(void) motionSentX:(double) x andY:(double) y andZ:(double) z;

@end

@interface Motion : NSObject

@property (nonatomic, weak) id <MotionDelegate> delegate;
//Don't instantiate more than one CMMotionManager in your app
@property (nonatomic, strong) CMMotionManager *_manager;

//for single pull;
-(void) pullAccelerationWithX:(double *)x
                         andY:(double *)y
                         andZ:(double *)z;
//for continuous updates:
-(void) startPushingAccelerationUpdatesWithX:(double *)x
                                        andY:(double *)y
                                        andZ:(double *)z;
-(void) stopPushingAccelerationUpdates;

@end
