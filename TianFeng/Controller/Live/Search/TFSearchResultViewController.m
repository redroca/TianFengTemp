//
//  TFSearchResultViewController.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/9.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFSearchResultViewController.h"
//Controllers

//Cells
#import "TFSearchResultsTableViewCell.h"

//Views

//API

//Models

//Others
#import "TFNavigationBarManager.h"

@interface TFSearchResultViewController ()
@property (nonatomic, strong)   NSMutableArray  *datasource;

@end

@implementation TFSearchResultViewController


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
        NSDictionary *dic = @{@"coverImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"vedioTitle" : @"直播都是对的的手段", @"vedioAuthor":@"张三", @"vedioTime" : @"10/1 16:00"};
        [self.datasource addObject:dic];
    }
    [self.tableView reloadData];
    [self receiveRefreshDataDidFinished:YES pageInfo:nil refreshStatus:LoadFirstPageData];
}

- (void)loadMoreData {
    for (int i=0; i<10; i++) {
        NSDictionary *dic = @{@"coverImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"vedioTitle" : @"直播都是对的的手段", @"vedioAuthor":@"张三", @"vedioTime" : @"10/1 16:00"};
        [self.datasource addObject:dic];
    }
    [self.tableView reloadData];
}

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

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
    return [TFSearchResultsTableViewCell heightForCell];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFSearchResultsTableViewCell *cell = [TFSearchResultsTableViewCell reusableCellDequeueTableView:self.tableView];

    [cell configureCellWithModel:self.datasource[indexPath.row]];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 15, 100, 20)];
    label.text = @"搜索结果";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor LiveTitleGrayColor];
    [backView addSubview:label];
    return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}




@end
