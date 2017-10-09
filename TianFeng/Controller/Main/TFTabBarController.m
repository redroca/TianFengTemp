//
//  TFTabBarController.m
//  TianFeng
//
//  Created by hades on 2017/9/21.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFTabBarController.h"

//Controllers
#import "TFHomeViewController.h"
#import "TFMineViewController.h"
#import "TFCategoryViewController.h"
#import "TFLiveViewController.h"
#import "TFAccountViewController.h"
#import "TFNavigationController.h"

//Cells

//Views

//API

//Models

//Others
#import "CommonAppHeaders.h"
@interface TFTabBarController ()

@end

@implementation TFTabBarController

#pragma mark - Setup
- (void)setupViewControllers {
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    TFHomeViewController *homeVC = [[TFHomeViewController alloc] init];
    [viewControllers addObject:[self configureViewController:homeVC title:@"首页" normalImage:[UIImage imageNamed:@"tab_home_nor"] highlightedImage:[UIImage imageNamed:@"tab_home_pre"]]];
    
    TFMineViewController *mineVC = [[TFMineViewController alloc] init];
    [viewControllers addObject:[self configureViewController:mineVC title:@"我的" normalImage:[UIImage imageNamed:@"tab_mine_nor"] highlightedImage:[UIImage imageNamed:@"tab_mine_pre"]]];
    
    TFCategoryViewController *categoryVC = [[TFCategoryViewController alloc] init];
    [viewControllers addObject:[self configureViewController:categoryVC title:@"分类" normalImage:[UIImage imageNamed:@"tab_classify_nor"] highlightedImage:[UIImage imageNamed:@"tab_classify_pre"]]];
    
    TFLiveViewController *liveVC = [[TFLiveViewController alloc] init];
    TFNavigationController *nav = (TFNavigationController *)[self configureViewController:liveVC title:@"直播" normalImage:[UIImage imageNamed:@"tab_live_nor"] highlightedImage:[UIImage imageNamed:@"tab_live_pre"]];
    [viewControllers addObject:nav];
    
    TFAccountViewController *accountVC = [[TFAccountViewController alloc] init];
    [viewControllers addObject:[self configureViewController:accountVC title:@"账户" normalImage:[UIImage imageNamed:@"tab_id_nor"] highlightedImage:[UIImage imageNamed:@"tab_id_pre"]]];
    
    self.viewControllers = viewControllers;
}

#pragma mark - Setters/Getters

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods
- (UIViewController *)configureViewController:(UIViewController *)controller
                          title:(NSString *)title
                    normalImage:(UIImage *)normalImage
               highlightedImage:(UIImage *)highlightedImage {
    controller.title = title;
    controller.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [highlightedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor GlobalTabBarItemSelectedColor]} forState:UIControlStateSelected];
    return [[TFNavigationController alloc] initWithRootViewController:controller];
}

#pragma mark - Override super methods

#pragma mark – Target action methods

#pragma mark – Request service methods

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – Delegate
@end
