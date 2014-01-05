//
//  ViewController.m
//  iResQ
//
//  Created by Boris Polania on 1/4/14.
//  Copyright (c) 2014 LLT. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    north = 0;
    south = 0;
    west = 0;
    
    [FYX startService:self];
}

- (void)serviceStarted
{
    // this will be invoked if the service has successfully started
    // bluetooth scanning will be started at this point.
    NSLog(@"FYX Service Successfully Started");
    NSMutableDictionary *options = [[NSMutableDictionary alloc] init];
    [options setObject:[NSNumber numberWithInt:FYXSightingOptionSignalStrengthWindowMedium]
                forKey:FYXSightingOptionSignalStrengthWindowKey];
    
    self.sightingManager = [[FYXSightingManager alloc] init];
    self.sightingManager.delegate = self;
    [self.sightingManager scanWithOptions:options];
}

- (void)startServiceFailed:(NSError *)error
{
    // this will be called if the service has failed to start
    NSLog(@"%@", error);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveSighting:(FYXTransmitter *)transmitter time:(NSDate *)time RSSI:(NSNumber *)RSSI
{
    // this will be invoked when an authorized transmitter is sighted
    NSLog(@"I received a FYX sighting!!! %@ at str:%i", transmitter.name, [RSSI intValue]);
    
    
    if ([transmitter.name isEqualToString:@"North"]) {
        
        north = -[RSSI doubleValue];
        north = north - 40;
        
        if (north < 0) {
            north = 0;
        }
        
        north = north / 10;
    }
    
    if ([transmitter.name isEqualToString:@"South"]) {
        
        south = -[RSSI doubleValue];
        south = south - 40;
        
        if (south < 0) {
            south = 0;
        }
        
        south = south / 10;
        
    }
    
    if ([transmitter.name isEqualToString:@"West"]) {

        west = -[RSSI doubleValue];
        west = west - 40;
        
        if (west < 0) {
            west = 0;
        }
        
        west = west / 10;
        
    }
    
    NSLog(@"N:%0.5f / S:%0.5f", north, south);
    double maxX = (north + south)/2;
    double y = -(north*north - south*south)/20;
    double R = (y-maxX)*(y-maxX);
    double x1 = sqrt(north*north - R);
    double x2 = -x1;
    double d1 = sqrt((x2-maxX)*(x2-maxX) + y*y);
    //double d2 = sqrt((x1+5)*(x1+5) + y*y);
    
    double finalx;
    
    if (d1 >= west) {
        finalx = x1;
    } else {
        finalx = x2;
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"Locations"];
    [query whereKey:@"username" equalTo:@"bpolania"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            PFObject *reg = [objects objectAtIndex:0];
            // Do something with the found objects
            /*
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
             */
            
            if (lastX != finalx || lastY != y) {
                
                NSNumber *X = [NSNumber numberWithDouble:finalx];
                NSNumber *Y = [NSNumber numberWithDouble:y];
                NSNumber *MAXX = [NSNumber numberWithDouble:maxX];
                
                reg[@"x"] = X;
                reg[@"y"] = Y;
                reg[@"max"] = MAXX;
                [reg saveInBackground];
                
            }
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    
    
    
    lastX = finalx;
    lastY = y;
    
     NSLog(@"X:%0.5f / Y:%0.5f", finalx, y);
    
    
    
    
}


@end
