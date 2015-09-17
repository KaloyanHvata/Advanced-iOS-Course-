//
//  Circle.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/17/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "Circle.h"

@implementation Circle

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
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    
    //make a circular path:
    CGRect boundingRect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    CGContextAddEllipseInRect(context, boundingRect);
    CGContextFillPath(context);
}


@end
