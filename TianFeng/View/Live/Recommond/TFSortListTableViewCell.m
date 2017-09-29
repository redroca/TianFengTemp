//
//  TFSortListTableViewCell.m
//  TianFeng
//
//  Created by hades on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFSortListTableViewCell.h"
#import "TFSortTableViewCell.h"

@interface TFSortListTableViewCell () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TFSortListTableViewCell
#pragma mark - Setter & Getter
- (void)setDatasource:(NSArray *)datasource {
    _datasource = datasource;
    
    [self.tableView reloadData];
}

#pragma mark – Initialization & Memory management methods
- (void)setup{
    [super setup];
    [self initInterface];
}

#pragma mark – Private methods
- (void)initInterface{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
}

#pragma mark – Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_datasource) {
        _datasource = [NSArray array];
    }
    return  self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TFSortTableViewCell * cell = [TFSortTableViewCell reusableCellDequeueTableView:self.tableView];
    cell.selectionStyle = NO;
    [cell configureCellWithModel:self.datasource[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}
@end
