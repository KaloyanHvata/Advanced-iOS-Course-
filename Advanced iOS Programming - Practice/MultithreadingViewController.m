//
//  MultithreadingViewController.m
//  Advanced iOS Programming - Practice
//
//  Created by Kaloyan Petrov on 9/14/15.
//  Copyright (c) 2015 Kaloyan Petrov. All rights reserved.
//

#import "MultithreadingViewController.h"

@interface MultithreadingViewController ()
//NSThread properties
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSThread *thread;
//GCD Properties
@property (nonatomic, weak) IBOutlet UIProgressView *progressBar1;
@property (nonatomic, weak) IBOutlet UIProgressView *progressBar2;
//NSOperatioQueue Properties
@property (nonatomic, weak) IBOutlet UILabel *displayNSOperation;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation MultithreadingViewController

//Synthesizing for NSOperation
@synthesize displayNSOperation, operationQueue;
//Synthesizing for NSThread Example
@synthesize  label, thread;
//Synthesizing for GCD Example
@synthesize progressBar1, progressBar2;

-(NSOperationQueue *)operationQueue{

    if(!operationQueue){
        operationQueue = [[NSOperationQueue alloc]init];
    }
    return operationQueue;
}

-(NSThread *) thread{
    if(!thread){
        thread = [[NSThread alloc]
                  initWithTarget:self
                        selector:@selector(longLoop)
                          object:nil];
    }
    return thread;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSThread Methods and IBActions

-(void) longLoop{

    for (long i = 0; YES ; i++){
    //change the text in the label on the main thread:
        [self performSelector:@selector(updateLabel:)
                     onThread:[NSThread mainThread]
                   withObject:[NSNumber numberWithLong:i]
                waitUntilDone:NO];
        sleep(1);
        if ([self.thread isCancelled]){
            //stop the thread:
            self.thread = nil;
            break;
        
        }
    }
}

-(void) updateLabel:(NSNumber *)i{

    self.label.text = [NSString stringWithFormat:@"%ld",[i longValue]];

}

- (IBAction)goButtonPressed:(id)sender {
    
    NSLog(@"go pressed");
    
    if([self.thread isExecuting]){
        NSLog(@"Stopping thread");
        [self.thread cancel];
    }else{
        NSLog(@"Starting thread");
        [self.thread start];
    }
}

- (IBAction)pushMeButtonPressed:(id)sender {
    
    if ([self.thread isExecuting]) {
        NSLog(@"Thread is running");
    }else{
        NSLog(@"push me pressed");
    }
}

#pragma mark - GCD Methods and IBActions

- (IBAction)GCDButtonGoPressed:(id)sender {
    //define two tasks (blocks) to be executed on the queue:
    void (^showProgress1)(void) = ^ {
        for (int p = 1; p <= 10; p++) {
            sleep(1);
            
            //execute a task on the main queue  to update progressBar1:
            dispatch_queue_t mainQueue = dispatch_get_main_queue();
            dispatch_async(mainQueue, ^{
                
                self.progressBar1.progress = (float)p / 10;
                NSLog(@"%f", self.progressBar1.progress);
                
            });
        }
    
    };
    void(^showProgress2)(void) = ^{
        for (int p = 1; p<=10; p++) {
            sleep(1);
            
            //execute a task on the main queue to update progressBar2
            dispatch_queue_t mainQueue = dispatch_get_main_queue();
            dispatch_async(mainQueue, ^{
            
                self.progressBar2.progress = (float)p / 10;
                NSLog(@"%f",self.progressBar2.progress);
            });
        }
    
    };
    
    //setup a serial dispatch queue:
    /*  dispatch_queue_t queue = dispatch_queue_create("com.KaloyanPetrovAdvacedIOS.multithreading", 0); */
    
    //set up a concurrent dispatch queue:
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //dispatch both tasks to the queue:
    dispatch_async(queue, showProgress1);
    dispatch_async(queue, showProgress2);
    
    //Note that ARC in iOS 6 and above , releases dispatch queues for you. 
    
}
#pragma mark - NSOperation Methods and IBActions
- (IBAction)GoButtonNSOperationPressed:(id)sender {
    
    Operation1 *operation1 = [[Operation1 alloc]init];
    operation1.delegate = self;
    //Starting this operation here puts it in the main run loop.
    //With a long running operation, this is a bad idea
    // [operation1 start];
    
    if ([self.operationQueue operationCount]>0) {
        [self.operationQueue cancelAllOperations];
    }else{
        [self.operationQueue addOperation:operation1];
    
    }
    
}
-(void) operationDidSendNumber:(NSInteger)number{

    self.displayNSOperation.text = [NSString stringWithFormat:@"%ld",number];
    NSLog(@"%ld",number);
    
}

@end