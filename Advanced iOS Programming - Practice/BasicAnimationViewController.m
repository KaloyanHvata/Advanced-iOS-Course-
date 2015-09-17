//
//  BasicAnimationViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/17/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "BasicAnimationViewController.h"
#import "Triangle.h"
#import "Circle.h"

@interface BasicAnimationViewController ()

@property (nonatomic, strong) Circle *circle;
@property (nonatomic, strong) Triangle *triangle;

@end

@implementation BasicAnimationViewController

@synthesize circle,triangle;

- (void)viewDidLoad {
    [super viewDidLoad];
    //make the triangle
    CGRect triangleFrame = CGRectMake(30, 80, 100, 100);
    self.triangle = [[Triangle alloc]initWithFrame:triangleFrame];
    self.triangle.backgroundColor = [UIColor clearColor];
    
    //make the circle
    CGRect circleFrame = CGRectMake(200, 80, 150, 150);
    self.circle = [[Circle alloc]initWithFrame:circleFrame];
    self.circle.backgroundColor = [UIColor clearColor];
    
    //make a view to show view order
    CGRect testFrame = CGRectMake(80, 125, 200, 20);
    UIView *middleView = [[UIView alloc]initWithFrame:testFrame];
    middleView.backgroundColor = [UIColor blackColor];

    
    //add both views:
    [self.view addSubview:self.triangle];
    [self.view addSubview:middleView];
    [self.view addSubview:self.circle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animateButtonPressed:(id)sender {
    
    //Very simple animation. Just swap the two view's frames:
    CGRect tempFrame = self.triangle.frame;
    self.triangle.frame = self.circle.frame;
    self.circle.frame = tempFrame;
    
}
- (IBAction)rotationButtonPressed:(id)sender {
    
    __block float angle = M_PI / 2;   //90 degrees...
    
    void (^completionBlockFinal)(BOOL) = ^(BOOL finished) {
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             self.triangle.transform =
                             CGAffineTransformMakeRotation(angle);
                         }
                         completion:nil];
    };
    
    void (^completionBlockNotDone)(BOOL) = ^(BOOL finished){
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             while (angle <= (3 * M_PI / 2)) {
                                 self.triangle.transform =
                                 CGAffineTransformMakeRotation(angle);
                                 angle *= 2;
                             }
                         }
                         completion:completionBlockFinal];
    };
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.triangle.transform = CGAffineTransformMakeRotation(angle);
                         angle *= 2;
                     }
                     completion:completionBlockNotDone];

}


@end
