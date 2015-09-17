//
//  Triangle.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/17/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    
    //make three points:
    CGPoint topCorner = CGPointMake(self.bounds.size.width / 2, 0);
    CGPoint lowerLeftCorner = CGPointMake(0, self.bounds.size.height);
    CGPoint lowerRightCorner =
    CGPointMake(self.bounds.size.width, self.bounds.size.height);
    
    //draw the path
    CGContextMoveToPoint(context, topCorner.x, topCorner.y);
    CGContextAddLineToPoint(context, lowerRightCorner.x, lowerRightCorner.y);
    CGContextAddLineToPoint(context, lowerLeftCorner.x, lowerLeftCorner.y);
    
    //close and fill the path
    CGContextClosePath(context);
    CGContextFillPath(context);
}

@end
