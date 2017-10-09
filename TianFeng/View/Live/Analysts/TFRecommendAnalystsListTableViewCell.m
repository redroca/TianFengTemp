//
//  RecommendAnalystsListTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/26.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFRecommendAnalystsListTableViewCell.h"
#import "TFRecommendAnalystsTableViewCell.h"

@interface TFRecommendAnalystsListTableViewCell()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *RecommendAnalystsListTableView;
@end

@implementation TFRecommendAnalystsListTableViewCell

#pragma mark - Setter & Getter
- (void)setDatasource:(NSArray *)datasource {
    _datasource = datasource;
    
    [self.RecommendAnalystsListTableView reloadData];
}

#pragma mark – Initialization & Memory management methods
- (void)setup{
    [super setup];
    [self initInterface];
}

#pragma mark – Private methods
- (void)initInterface{
    _RecommendAnalystsListTableView.dataSource = self;
    _RecommendAnalystsListTableView.delegate = self;
    _RecommendAnalystsListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (IBAction)action_more:(id)sender {
}


#pragma mark – Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_datasource) {
        _datasource = [NSArray array];
    }
    return  self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TFRecommendAnalystsTableViewCell * cell = [TFRecommendAnalystsTableViewCell reusableCellDequeueTableView:self.RecommendAnalystsListTableView];
    cell.selectionStyle = NO;
    [cell configureCellWithModel:self.datasource[indexPath.row]];
    if (indexPath.row == 2) {
        [cell hideBottonLine];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
@end
