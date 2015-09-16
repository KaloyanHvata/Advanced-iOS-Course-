//
//  AdvancedObjCConceptsViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/14/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "AdvancedObjCConceptsViewController.h"

@interface AdvancedObjCConceptsViewController (){
    //Declare a block:
    int (^add)(int a);
}

//Type Circle from a struct containing int,CGPoing
typedef struct {
    int radius;
    CGPoint center;
}Circle;

@end

@implementation AdvancedObjCConceptsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //////////Blocks///////////
   __block int c = 4; //__block is like making a variable Mutable
    add = ^(int a){
        c = 5;
        return a + c;
    };
    NSLog(@"3+5= %d\n",add(3));
    
    
    //////////Structs///////////
    Circle myCircle;
    myCircle.radius = 4;
    
    //print area of circle
    float area = powf(M_PI * myCircle.radius,2);
    NSLog(@"area = %f\n",area);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Methods
@end
