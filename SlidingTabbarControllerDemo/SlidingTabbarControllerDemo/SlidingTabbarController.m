//
//  SlidingTabbarController.m
//  SlidingTabbarControllerDemo
//
//  Created by KDB on 2017/3/21.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

#import "SlidingTabbarController.h"
#import "LeftViewController.h"
#import "MiddleViewController.h"
#import "RightViewController.h"



@interface SlidingTabbarController ()<UITabBarControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation SlidingTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LeftViewController *left = [[LeftViewController alloc]init];
    left.view.backgroundColor = [UIColor purpleColor];
    left.title = @"left";
    UINavigationController *leftNav = [[UINavigationController alloc]initWithRootViewController:left];
    [self addChildViewController:leftNav];
    
    MiddleViewController *middle = [[MiddleViewController alloc]init];
    middle.view.backgroundColor = [UIColor blueColor];
    middle.title = @"middle";
    UINavigationController *middleNav = [[UINavigationController alloc]initWithRootViewController:middle];
    [self addChildViewController:middleNav];
    
    RightViewController *right = [[RightViewController alloc]init];
    right.view.backgroundColor = [UIColor orangeColor];
    right.title = @"right";
    UINavigationController *rightNav = [[UINavigationController alloc]initWithRootViewController:right];
    [self addChildViewController:rightNav];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
    [self.view addGestureRecognizer:pan];
    
}
-(void)panGes:(UIPanGestureRecognizer *)pan
{
//    if (self.transitionCoordinator) {
//        return
//    }
    
    if (pan.state == UIGestureRecognizerStateBegan ||
        pan.state == UIGestureRecognizerStateChanged) {
        
        [self beginInteractiveTransitionIfPossible:pan];
        
    }
    
}

- (void)beginInteractiveTransitionIfPossible:(UIPanGestureRecognizer *)sender{
    // 通过滑动的方法判断应该像那边跳转
    CGPoint translation = [sender translationInView:self.view];
    
    if (translation.x > 0 && self.selectedIndex >0) {
        self.selectedIndex --;
    } else if(translation.x < 0 && self.selectedIndex < self.viewControllers.count - 1) {
        self.selectedIndex ++;
    }
    
    [self.transitionCoordinator animateAlongsideTransitionInView:self.view animation:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
    
    
}

//-(id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
//{
//    
//}
//-(id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
//{
//    
//}

@end
