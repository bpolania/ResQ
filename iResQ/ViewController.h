//
//  ViewController.h
//  iResQ
//
//  Created by Boris Polania on 1/4/14.
//  Copyright (c) 2014 LLT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FYX/FYXSightingManager.h>
#import <FYX/FYX.h>
#import <FYX/FYXTransmitter.h>

@interface ViewController : UIViewController <FYXServiceDelegate, FYXSightingDelegate> {
    double north;
    double south;
    double west;
    
    
    double lastX;
    double lastY;
    
}

@property (nonatomic) FYXSightingManager *sightingManager;

@end
