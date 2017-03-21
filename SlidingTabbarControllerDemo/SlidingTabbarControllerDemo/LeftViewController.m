//
//  LeftViewController.m
//  SlidingTabbarControllerDemo
//
//  Created by KDB on 2017/3/21.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

#import "LeftViewController.h"
#import "RightViewController.h"
#import "CustomAnimator.h"

@interface LeftViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic ,strong)CustomAnimator *animator;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.animator = [[CustomAnimator alloc]init];
    
//    self.transitioningDelegate = self;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    RightViewController *right = [[RightViewController alloc]init];
    right.view.backgroundColor = [UIColor orangeColor];
    right.title = @"right";
    
    right.transitioningDelegate = self;
    right.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:right animated:YES completion:^{
        
    }];
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.animator;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.animator;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
