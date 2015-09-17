//
//  CoreAnimationViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/17/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import "Circle.h"

@interface CoreAnimationViewController ()

@property (nonatomic, strong)Circle *circle;

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // The circle:
    CGRect circleFrame = CGRectMake(10, 180, 80, 80);
    self.circle = [[Circle alloc] initWithFrame:circleFrame];
    self.circle.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.circle];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)animateButtonPressed:(id)sender {
    
    // use core animation keyframe techniques
    // to move the circle along a path
    
    //create the path:
    CGPoint startPoint = self.circle.layer.position;
    CGMutablePathRef keypath = CGPathCreateMutable();
    CGPathMoveToPoint(keypath, NULL, startPoint.x, startPoint.y);
    CGPathAddArc(keypath, NULL, 180, 180, 150, 3*M_PI/2, M_PI, NO);
    CGPathAddLineToPoint(keypath, NULL, startPoint.x, startPoint.y);
    
    
    //create the circle animation:
    CAKeyframeAnimation *animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = keypath;
    animation.duration = 10.0;
    
    //add the animation to the circle view's layer:
    [self.circle.layer addAnimation:animation forKey:@"CircleAnimation"];
    
    //release the path:
    CGPathRelease(keypath);

    
}



@end
