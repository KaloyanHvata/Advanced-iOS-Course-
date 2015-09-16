//
//  BlockNSOperationQueueViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/16/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "BlockNSOperationQueueViewController.h"

@interface BlockNSOperationQueueViewController ()

@property (nonatomic, weak) IBOutlet UILabel *display;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, assign) BOOL isCancelled;
@property (nonatomic, weak) IBOutlet UIButton *buttonGo;

@end

@implementation BlockNSOperationQueueViewController
@synthesize display, queue, isCancelled, buttonGo;

- (NSOperationQueue *)queue{
    if (!queue) {
       queue = [[NSOperationQueue alloc] init];
    }
    return queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isCancelled = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Mehtods and IBActions


- (IBAction)goButtonPressed:(id)sender {
    
    self.buttonGo.enabled = NO;
    self.buttonGo.alpha = 0.5f;
    __block int i = 1;
    [self.queue addOperationWithBlock:^{
        while (YES) {
            if(self.isCancelled){
            //main thread is the only thread that we can use to change the UI
                [self performSelector:@selector(updateDisplay:)
                             onThread:[NSThread mainThread]
                           withObject:[NSNumber numberWithInt:0]
                        waitUntilDone:NO];
                self.isCancelled = NO;
                break;
            }
            sleep(1);
            NSLog(@"%d , in block operation",i);
            [self performSelector:@selector(updateDisplay:)
                         onThread:[NSThread mainThread]
                       withObject:[NSNumber numberWithInt:i]
                    waitUntilDone:NO];
            i++;
        }
    }];
}


- (IBAction)cancelButtonPressed:(id)sender {
    NSLog(@"Cancel button pressed!");
    self.isCancelled = YES;
    self.buttonGo.enabled = YES;
    self.buttonGo.alpha = 1.0f;
    
}

-(void)updateDisplay:(NSNumber*) number{
    
    self.display.text = [NSString stringWithFormat:@"%d",[number intValue]];
    NSLog(@"%d , in updateDisplay",[number intValue]);
    
}


@end
