//
//  TFRecommondViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFRecommondViewController.h"

#import "FFPagingViewController.h"

#import "TFNavigationBarManager.h"

@interface TFRecommondViewController ()

@end

@implementation TFRecommondViewController

#pragma mark - Setup

#pragma mark - Setters/Getters

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark - Override super methods

#pragma mark – Target action methods

#pragma mark – Request service methods

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.tableFooterView = [UIView new];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – Delegate
#pragma mark --- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark --- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Override
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [TFNavigationBarManager changeAlphaWithCurrentOffset:scrollView.contentOffset.y];
    
    if ([self.delegate respondsToSelector:@selector(scrollViewContentOffsetY:)]) {
        [self.delegate scrollViewContentOffsetY:scrollView.contentOffset.y];
    }
}
@end
