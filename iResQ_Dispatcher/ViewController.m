//
//  ViewController.m
//  iResQ_Dispatcher
//
//  Created by Boris Polania on 1/5/14.
//  Copyright (c) 2014 LLT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize fighter, civilian1, civilian2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updatePosition:) userInfo:nil repeats:YES];
    
    
}

- (IBAction)updatePosition:(id)sender {
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Locations"];
    [query whereKey:@"username" equalTo:@"bpolania"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            PFObject *reg = [objects objectAtIndex:0];
            
            double max = [[reg objectForKey:@"max"] doubleValue];
            
            double x = ([[reg objectForKey:@"X"] doubleValue] * 500)/max;
            double y = ([[reg objectForKey:@"Y"] doubleValue] * 500)/max;
            
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [button addTarget:self
                       action:@selector(showInfo:)
             forControlEvents:UIControlEventTouchDown];
            button.frame = CGRectMake(500 + x, 500 + y, 60, 30);
            [button setImage:[UIImage imageNamed:@"Fireman.png"] forState:UIControlStateNormal];
            [self.view addSubview:button];

            
            [self.view addSubview:button];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showInfo:(id)sender {
    
    if (fighter.hidden) {
        fighter.hidden = NO;
    } else {
        fighter.hidden = YES;
    }
    
}

- (IBAction)showCivilian1Info:(id)sender {
    
    if (civilian1.hidden) {
        civilian1.hidden = NO;
    } else {
        civilian1.hidden = YES;
    }
    
}

- (IBAction)showCivilian2Info:(id)sender {
    
    if (civilian2.hidden) {
        civilian2.hidden = NO;
    } else {
        civilian2.hidden = YES;
    }
    
}

@end
