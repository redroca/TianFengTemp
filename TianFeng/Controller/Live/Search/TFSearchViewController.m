//
//  TFSearchViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFSearchViewController.h"
#import "TFSearchResultViewController.h"

@interface TFSearchViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITextField *searchTextFirld;


@end

@implementation TFSearchViewController

#pragma mark - Setters/Getters

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark - Override super methods

#pragma mark – Target action methods
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)action_toSearchResult:(id)sender {
    TFSearchResultViewController *searchResultVC = [[TFSearchResultViewController alloc] init];
    [self.navigationController pushViewController:searchResultVC animated:YES];
}

#pragma mark – Request service methods

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}



@end
