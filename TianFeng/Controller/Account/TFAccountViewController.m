//
//  TFAccountViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/21.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAccountViewController.h"
//Controllers
#import "TFMyDownloadViewController.h"
#import "TFAboutUsViewController.h"

//Cells
#import "TFAccountHomeListTableViewCell.h"
//Views
#import "TFAccountListHeaderView.h"
//API

//Models

//Other
#import "CommonAppHeaders.h"
@interface TFAccountViewController ()
{
    int listCount;
}
@property (weak, nonatomic) IBOutlet UITableView *accountTableView;


@property (nonatomic, strong) TFAccountListHeaderView *accountHomeHeaderView;
@property (nonatomic, strong) NSArray  *datasource;


@end

@implementation TFAccountViewController

#pragma mark - Setters/Getters

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark - Override super methods

#pragma mark – Target action methods

#pragma mark – Request service methods

#pragma mark – Initialization & Memory management methods
- (void)setUpTableViewHeaderView {
    TFAccountListHeaderView *accountHomeHeaderView = [[TFAccountListHeaderView  alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [TFAccountListHeaderView heightOfView])];
    self.accountHomeHeaderView = accountHomeHeaderView;

    NSDictionary *model = @{@"username" : @"刘小雯", @"headerBackImage" : @"https://pic1.zhimg.com/v2-9c6c0b581a5a62ba594f9e615cfea14c_r.jpg", @"userHeaderImage":@"https://pic1.zhimg.com/v2-9c6c0b581a5a62ba594f9e615cfea14c_r.jpg"};
    [accountHomeHeaderView configureWithModel:model];
    
    self.accountTableView.tableHeaderView = accountHomeHeaderView;
}

- (void)initBarManager {
    [TFNavigationBarManager managerWithController:self];
    [TFNavigationBarManager setBarColor:[UIColor whiteColor]];
    [TFNavigationBarManager setZeroAlphaOffset:0];
    [TFNavigationBarManager setFullAlphaOffset:150];
}

- (void)initDatasource {
    listCount = 0;
    self.datasource = @[
                       @{@"listName" : @"新建直播", @"listIcon":@"icon_stream_nor"},
                       @{@"listName" : @"我的分享", @"listIcon":@"icon_share_nor"},
                       @{@"listName" : @"我的收藏", @"listIcon":@"icon_collect_nor"},
                       @{@"listName" : @"我的下载", @"listIcon":@"icon_download_nor"},
                       @{@"listName" : @"我的评论", @"listIcon":@"icon_comment_nor"},
                       @{@"listName" : @"关于天风", @"listIcon":@"icon_about us_nor"},
                       @{@"listName" : @"账号管理", @"listIcon":@"icon_set_nor"}];
    [self.accountTableView reloadData];
}

#pragma mark – View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableViewHeaderView];
    [self initBarManager];
    [self initDatasource];
    self.navigationItem.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
    if ([TFNavigationBarManager sharedManager].selfNavigationBar) {
        [TFNavigationBarManager sharedManager].selfNavigationBar.hidden = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
    if ([TFNavigationBarManager sharedManager].selfNavigationBar) {
        [TFNavigationBarManager sharedManager].selfNavigationBar.hidden = YES;
    }
}



#pragma mark – Delegate
#pragma mark - UITableViewDelegate & UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //新建直播
        NSLog(@"新建直播");
    } else if(indexPath.section == 1) {
        //
        switch (indexPath.row) {
            case 0:
                //我的分享
                NSLog(@"我的分享");
                break;
            case 1:
                //我的收藏
                NSLog(@"我的收藏");
                break;
            case 2:
            {
                //我的下载
                TFMyDownloadViewController *myDownloadVC = [[TFMyDownloadViewController alloc] init];
                [self.navigationController pushViewController:myDownloadVC animated:YES];
                break;
            }
            case 3:
                //我的评论
                NSLog(@"我的评论");
                break;
                
            default:
                break;
        }
        
    } else if(indexPath.section == 2) {
        //关于天风
        TFAboutUsViewController *aboutUsVC = [[TFAboutUsViewController alloc] init];
        [self.navigationController pushViewController:aboutUsVC animated:YES];
    } else if(indexPath.section == 3) {
        //账号管理
        NSLog(@"账号管理");
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 4;
    } else {
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TFAccountHomeListTableViewCell heightForCell];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (listCount > 6) {
        listCount = 0;
    }
    TFAccountHomeListTableViewCell *cell = [TFAccountHomeListTableViewCell reusableCellDequeueTableView:self.accountTableView];
    
    [cell configureWithModel:self.datasource[listCount]];
    listCount += 1;
    cell.selectionStyle = NO;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 5)];
    backView.backgroundColor = [UIColor GlobalBackgroundColr];
    return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

@end
