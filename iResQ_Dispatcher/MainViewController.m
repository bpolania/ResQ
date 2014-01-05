//
//  MainViewController.m
//  iResQ_Dispatcher
//
//  Created by Boris Polania on 1/5/14.
//  Copyright (c) 2014 LLT. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize truck1, truck2, truck3, truck4;
@synthesize policeButton, hazmatButton, mainViewer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPanGestureRecognizer *panner1 = [[UIPanGestureRecognizer alloc]
                                      initWithTarget:self action:@selector(panWasRecognized:)];
    UIPanGestureRecognizer *panner2 = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(panWasRecognized:)];
    UIPanGestureRecognizer *panner3 = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(panWasRecognized:)];
    UIPanGestureRecognizer *panner4 = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(panWasRecognized:)];
    [truck1 addGestureRecognizer:panner1];
    [truck2 addGestureRecognizer:panner2];
    [truck3 addGestureRecognizer:panner3];
    [truck4 addGestureRecognizer:panner4];
    
	// Do any additional setup after loading the view.
}

- (void)panWasRecognized:(UIPanGestureRecognizer *)panner {
    UIView *draggedView = panner.view;
    CGPoint offset = [panner translationInView:draggedView.superview];
    CGPoint center = draggedView.center;
    draggedView.center = CGPointMake(center.x + offset.x, center.y + offset.y);
    // Reset translation to zero so on the next `panWasRecognized:` message, the
    // translation will just be the additional movement of the touch since now.
    [panner setTranslation:CGPointZero inView:draggedView.superview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toLocator:(id)sender {

    ViewController *locatorView = [self.storyboard instantiateViewControllerWithIdentifier:@"locator"];
    [self.navigationController pushViewController:locatorView animated:YES];

}

- (IBAction)addPolice:(id)sender {
  

    CGRect rect = CGRectMake(500, 350, 40, 40);
    UIImageView *policeImageView = [[UIImageView alloc] initWithFrame:rect];
    policeImageView.userInteractionEnabled = YES;
    
    [policeImageView setImage:[UIImage imageNamed:@"Police.png"]];
    
    UIPanGestureRecognizer *panner = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(panWasRecognized:)];
    
    [policeImageView addGestureRecognizer:panner];
    
    [mainViewer addSubview:policeImageView];
    
}

- (IBAction)addHazmat:(id)sender {
    
    
    CGRect rect = CGRectMake(500, 350, 40, 40);
    UIImageView *hazmatImageView = [[UIImageView alloc] initWithFrame:rect];
    hazmatImageView.userInteractionEnabled = YES;
    
    [hazmatImageView setImage:[UIImage imageNamed:@"Hazmat.png"]];
    
    UIPanGestureRecognizer *panner = [[UIPanGestureRecognizer alloc]
                                      initWithTarget:self action:@selector(panWasRecognized:)];
    
    [hazmatImageView addGestureRecognizer:panner];
    
    [mainViewer addSubview:hazmatImageView];
    
}

@end
