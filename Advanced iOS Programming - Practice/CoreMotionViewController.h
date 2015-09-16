//
//  CoreMotionViewController.h
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Motion.h"
@interface CoreMotionViewController : UIViewController
<MotionDelegate>

@property (nonatomic, strong) Motion *motion;

@property (nonatomic, weak) IBOutlet UILabel *accX;
@property (nonatomic, weak) IBOutlet UILabel *accY;
@property (nonatomic, weak) IBOutlet UILabel *accZ;

- (IBAction)btnGetAccPressed:(id)sender;
- (IBAction)btnStartContinous:(id)sender;
- (IBAction)btnStopContinous:(id)sender;
@end
