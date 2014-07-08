//
//  MainViewController.m
//  week3a
//
//  Created by Jung Eun Kim on 7/6/14.
//  Copyright (c) 2014 jung. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headlineView;
- (IBAction)onPanGeatureHeadline:(UIPanGestureRecognizer *)sender;
@property (nonatomic, assign) float headlineOriginalY;
- (void)onCustomPan:(UIPanGestureRecognizer *)panGestureRecognizer;
@property (weak, nonatomic) IBOutlet UIView *headlineContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *menuImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *cardScrollView;

@end

@implementation MainViewController

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
 
    // The onCustomPan: method will be defined in Step 3 below.
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onCustomPan:)];
    
    // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
   [self.headlineView addGestureRecognizer:panGestureRecognizer];
    self.cardScrollView.contentSize = CGSizeMake(1444,227);

}

- (void)onCustomPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    CGPoint translation = [panGestureRecognizer translationInView:self.view];
  //  CGRect newFrame = self.menuImageView.frame;
    
    [panGestureRecognizer setTranslation:CGPointZero inView:panGestureRecognizer.view];
    
    //move the view the same amount as the pandgesture recognizer
    if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        if (velocity.y<=0) {
            self.headlineContainerView.center = CGPointMake(self.headlineContainerView.center.x, self.headlineContainerView.center.y + (translation.y * 0.1));
        } else {
            self.headlineContainerView.center = CGPointMake(self.headlineContainerView.center.x, self.headlineContainerView.center.y + (translation.y * 0.5));
        }
        
    }
    
    //once the pan has stopped determine the direction of the pan and complete the view movement
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (velocity.y >= 0) {
            [UIView animateWithDuration:.5 animations:^{
                self.headlineContainerView.frame = CGRectMake(0, 520, 320, 568);
            }];
            
        }else {
            [UIView animateWithDuration:.5 animations:^{
                self.headlineContainerView.frame = CGRectMake(0, 0, 320, 568);
            }];
          
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end