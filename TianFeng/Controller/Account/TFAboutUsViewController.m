//
//  AboutTFViewController.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/23.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAboutUsViewController.h"

@interface TFAboutUsViewController ()

@end

@implementation TFAboutUsViewController

#pragma mark – View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}


@end
