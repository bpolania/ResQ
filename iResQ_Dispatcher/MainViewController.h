//
//  MainViewController.h
//  iResQ_Dispatcher
//
//  Created by Boris Polania on 1/5/14.
//  Copyright (c) 2014 LLT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *policeButton;
@property (nonatomic, strong) IBOutlet UIButton *hazmatButton;

@property (nonatomic, strong) IBOutlet UIImageView *truck1;
@property (nonatomic, strong) IBOutlet UIImageView *truck2;
@property (nonatomic, strong) IBOutlet UIImageView *truck3;
@property (nonatomic, strong) IBOutlet UIImageView *truck4;

@property (nonatomic, strong) IBOutlet UIView *mainViewer;

@end
