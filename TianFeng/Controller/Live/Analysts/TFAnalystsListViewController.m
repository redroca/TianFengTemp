//
//  TFAnalystsListViewController.m
//  TianFeng
//
//  Created by hades on 2017/10/9.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAnalystsListViewController.h"

//Controllers

//Cells
#import "TFRecommendAnalystsTableViewCell.h"

//Views

//API

//Models

//Others

@interface TFAnalystsListViewController ()
@property (nonatomic, strong)   NSMutableArray  *datasource;
@end

@implementation TFAnalystsListViewController

#pragma mark - Setup

#pragma mark - Setters/Getters
- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark - Override super methods

#pragma mark – Target action methods

#pragma mark – Request service methods
- (void)loadData {
    [self.datasource removeAllObjects];
    for (int i=0; i<10; i++) {
        NSDictionary *dic = @{@"AnalystsHeaderImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"AnalystsName":@"张三", @"AnalystsDescription":@"额胜多负少的冯绍峰大声道"};
        [self.datasource addObject:dic];
    }
    [self.tableView reloadData];
    [self receiveRefreshDataDidFinished:YES pageInfo:nil refreshStatus:LoadFirstPageData];
}

- (void)loadMoreData {
    for (int i=0; i<10; i++) {
        NSDictionary *dic = @{@"AnalystsHeaderImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"AnalystsName":@"张三", @"AnalystsDescription":@"额胜多负少的冯绍峰大声道"};
        [self.datasource addObject:dic];
    }
    [self.tableView reloadData];
}

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"首席推荐";
    
    [self loadData];
    [self refreshTableViewWithHeaderSel:@selector(loadData) withFooterRefreshSel:@selector(loadMoreData)];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFRecommendAnalystsTableViewCell *cell = [TFRecommendAnalystsTableViewCell reusableCellDequeueTableView:self.tableView];
    [cell configureCellWithModel:self.datasource[indexPath.row]];
    
    return cell;
}

//cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140.f;
}
@end
