//
//  CustomAnimator.m
//  SlidingTabbarControllerDemo
//
//  Created by KDB on 2017/3/21.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

#import "CustomAnimator.h"

@implementation CustomAnimator

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    toView.frame = CGRectMake(fromView.frame.origin.x, fromView.frame.size.height / 2, fromView.frame.size.width, fromView.frame.size.height);
    toView.alpha = 0;
    
    [containerView addSubview:toView];
    
    NSTimeInterval animationDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:animationDuration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        toView.alpha = 1;
        toView.frame = [transitionContext finalFrameForViewController:toVC];
//        toView.frame = CGRectMake(0, 64, 375, 300);
        
    } completion:^(BOOL finished) {
        
        BOOL cancelled = [transitionContext transitionWasCancelled];
        
        [transitionContext completeTransition:!cancelled];
        
    }];
    
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 5.0f;
}





@end
