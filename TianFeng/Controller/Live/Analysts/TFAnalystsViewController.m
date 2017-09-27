//
//  TFAnalystsViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAnalystsViewController.h"
#import "TFGoldAnalystsListTableViewCell.h"
#import "GoldAnalystsCollectionViewCell.h"
#import "TFRecommendAnalystsListTableViewCell.h"

@interface TFAnalystsViewController ()

@end

@implementation TFAnalystsViewController

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
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < 2) {
        TFGoldAnalystsListTableViewCell * cell = [TFGoldAnalystsListTableViewCell reusableCellDequeueTableView:self.tableView];
        cell.selectionStyle = NO;
        return cell;
    } else {
//        TFRecommendAnalystsListTableViewCell * cell = [TFRecommendAnalystsListTableViewCell reusableCellDequeueTableView:self.tableView];
        TFGoldAnalystsListTableViewCell * cell = [TFGoldAnalystsListTableViewCell reusableCellDequeueTableView:self.tableView];
        cell.selectionStyle = NO;
        return cell;
    }
}

//cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 273.5;
}

@end
