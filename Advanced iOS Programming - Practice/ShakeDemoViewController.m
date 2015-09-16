//
//  ShakeDemoViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "ShakeDemoViewController.h"

@interface ShakeDemoViewController ()

@property (nonatomic, weak)IBOutlet UITextField *textField;
@property (nonatomic, weak)IBOutlet UIView *littleView;

@end

@implementation ShakeDemoViewController

@synthesize  textField, littleView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//seting the ViewController to become First Responder
- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (IBAction)dismissKeyboard:(UITextField*)sender{
    
    [self.textField resignFirstResponder];
   
    
}
- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
    if (event.type
        == UIEventSubtypeMotionShake) {
        
        [self.textField setText:@""];
        if (self.littleView.backgroundColor ==[UIColor redColor]) {
            
            self.littleView.backgroundColor = [UIColor yellowColor];
        }else{
        
            [self.littleView setBackgroundColor:[UIColor redColor]];
        
        }
    }

}

@end
