//
//  UIViewController+TFExtention.m
//  TianFeng
//
//  Created by hades on 2017/9/29.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "UIViewController+TFExtention.h"
#import "FFPagingViewController.h"
#import "TFLiveViewController.h"

@implementation UIViewController (TFExtention)
- (void)tf_pushToNavigationController:(UIViewController *)controller {
    if (self.parentViewController && [self.parentViewController isKindOfClass:[FFPagingViewController class]]) {
        FFPagingViewController *pagingVC = (FFPagingViewController *)self.parentViewController;
        controller.hidesBottomBarWhenPushed = YES;
        TFLiveViewController *liveVC = pagingVC.topViewController;
        [liveVC.navigationController pushViewController:controller animated:YES];
    } else {
        return;
    }
}
@end
