//
//  Operation1.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/15/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "Operation1.h"

//static int i = 1; //something like a class property in other languages. By making it static we save the variable in the class and every time it's instantiated we take the value.

@implementation Operation1

@synthesize delegate;

-(void) main{
    
    @autoreleasepool {
        int i = 1;
    //make a weak reference to self here to avoid a retain cycle under ARC:
        __weak NSOperation *thisOp = self;
        while (YES) {
            if([thisOp isCancelled]){
                NSLog(@"Op Cancelled");
                break;
            }
            sleep(1);
            [self.delegate operationDidSendNumber:i];
            i++;
            
        }
    }
}

@end
