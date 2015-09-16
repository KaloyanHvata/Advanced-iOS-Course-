//
//  Operation1.h
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/15/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Operation1_Delegate <NSObject>

-(void) operationDidSendNumber:(NSInteger)number;

@end

@interface Operation1 : NSOperation

@property (nonatomic, weak) id <Operation1_Delegate>
delegate;

@end
