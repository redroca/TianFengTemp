//
//  RecommendAnalystsListTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/26.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFRecommendAnalystsListTableViewCell.h"
#import "RecommendAnalystsTableViewCell.h"

@interface TFRecommendAnalystsListTableViewCell()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *ColumnsLabel;

@end


@implementation TFRecommendAnalystsListTableViewCell

#pragma mark – Initialization & Memory management methods
- (void)setup{
    [super setup];
    [self initInterface];
}

#pragma mark – Private methods
- (void)initInterface{
    _RecommendAnalystsListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark – Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendAnalystsTableViewCell * cell = [RecommendAnalystsTableViewCell reusableCellDequeueTableView:_RecommendAnalystsListTableView];
    cell.selectionStyle = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


@end




