//
//  CoreMotionViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "CoreMotionViewController.h"

@interface CoreMotionViewController ()

@end

@implementation CoreMotionViewController
@synthesize motion;
@synthesize accX, accY, accZ;

- (Motion *)motion
{
    if (!motion) {
        motion = [[Motion alloc] init];
    }
    return motion;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.motion.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnGetAccPressed:(id)sender
{
    double x, y, z;
    [self.motion pullAccelerationWithX:&x andY:&y andZ:&z];
    self.accX.text = [NSString stringWithFormat:@"%f", x];
    self.accY.text = [NSString stringWithFormat:@"%f", y];
    self.accZ.text = [NSString stringWithFormat:@"%f", z];
}

- (IBAction)btnStartContinous:(id)sender
{
    double x, y, z;
    [self.motion startPushingAccelerationUpdatesWithX:&x andY:&y andZ:&z];
    //we can read the starting x, y, and z here, but
    //continuous updates are handled by the
    //motionSentX:(double)x andY:(double)y andZ:(double)z
    //delegate method.
    self.accX.text = [NSString stringWithFormat:@"%f", x];
    self.accY.text = [NSString stringWithFormat:@"%f", y];
    self.accZ.text = [NSString stringWithFormat:@"%f", z];
}

- (IBAction)btnStopContinous:(id)sender
{
    [self.motion stopPushingAccelerationUpdates];
}

- (void) motionSentMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void) motionSentX:(double)x andY:(double)y andZ:(double)z
{
    self.accX.text = [NSString stringWithFormat:@"%f", x];
    self.accY.text = [NSString stringWithFormat:@"%f", y];
    self.accZ.text = [NSString stringWithFormat:@"%f", z];
}




@end
