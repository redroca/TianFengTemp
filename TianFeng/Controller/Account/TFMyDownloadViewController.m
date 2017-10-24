//
//  TFMyDownloadViewController.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/23.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFMyDownloadViewController.h"
//Cell
#import "AccountCommonTableViewCell.h"
//Controllers

//Views

//API

//Models

//Others
#import "TFNavigationBarManager.h"

@interface TFMyDownloadViewController ()
@property (nonatomic, strong)   NSMutableArray  *datasource;

@end

@implementation TFMyDownloadViewController

#pragma mark - Setters/Getters
- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

#pragma mark - Setup
- (void)setupTextFiled {
    UITextField *textField = [[UITextField alloc] init];
    [self.navigationItem.titleView addSubview:textField];
    
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
        NSDictionary *dic = @{@"coverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"title" : @"直播都是对的的手段", @"name":@"张三", @"time" : @"10/1 16:00"};
        [self.datasource addObject:dic];
    }
    [self.tableView reloadData];
    [self receiveRefreshDataDidFinished:YES pageInfo:nil refreshStatus:LoadFirstPageData];
}

- (void)loadMoreData {
    for (int i=0; i<10; i++) {
        NSDictionary *dic = @{@"coverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"title" : @"直播都是对的的手段", @"name":@"张三", @"time" : @"10/1 16:00"};
        [self.datasource addObject:dic];
    }
    [self.tableView reloadData];
}

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的下载";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    [self setupTextFiled];
    [self loadData];
    [self refreshTableViewWithHeaderSel:@selector(loadData) withFooterRefreshSel:@selector(loadMoreData)];
    
}

#pragma mark – Delegate
#pragma mark --- UITableViewDelegate, UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AccountCommonTableViewCell heightForCell];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AccountCommonTableViewCell *cell = [AccountCommonTableViewCell reusableCellDequeueTableView:self.tableView];

    [cell configureWithModel:self.datasource[indexPath.row]];
    return cell;
}

@end
