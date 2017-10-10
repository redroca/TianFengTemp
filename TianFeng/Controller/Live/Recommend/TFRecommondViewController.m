//
//  TFRecommondViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFRecommondViewController.h"

#define kBannerViewHeight   221.f

//Controllers
#import "TFBaseLiveViewController.h"
#import "TFAnalystsListViewController.h"

//Cells
#import "TFRecommendAnalystsListTableViewCell.h"
#import "TFGoldAnalystsListTableViewCell.h"
#import "TFCommonLiveTableViewCell.h"
#import "TFSortListTableViewCell.h"

//Views
#import "TFPageControl.h"
#import "TFCycleBannerView.h"

//API

//Models

//Others
#import "TFNavigationBarManager.h"
#import "CommonAppHeaders.h"

@interface TFRecommondViewController () <TFCycleBannerViewDelegate, TFCycleBannerViewDataSource>

@end

@implementation TFRecommondViewController

#pragma mark - Setup
- (void)setupBannerView {
    UIView *bannerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, kBannerViewHeight * RATIO + 5)];
    bannerContainer.backgroundColor = [UIColor GlobalBackgroundColr];
    
    TFCycleBannerView *bannerView = [[TFCycleBannerView alloc] init];
    bannerView.frame = CGRectMake(0, 0, SCREENWIDTH, kBannerViewHeight * RATIO);
    bannerView.continuous = YES;
    bannerView.autoPlayTimeInterval = 2;
    bannerView.datasource = self;
    bannerView.delegate = self;
    
    [bannerContainer addSubview:bannerView];
    self.tableView.tableHeaderView = bannerContainer;
}

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
    self.tableView.estimatedRowHeight = 250.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self setupBannerView];
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
    
    switch (indexPath.row) {
        case 0: {
            TFBaseLiveViewController *baseLiveVC = [[TFBaseLiveViewController alloc] init];
            baseLiveVC.liveType = kLiveIsLiving;
            [self tf_pushToNavigationController:baseLiveVC];
        }
            break;
        case 1: {
            TFBaseLiveViewController *baseLiveVC = [[TFBaseLiveViewController alloc] init];
            baseLiveVC.liveType = kLiveAdvanceNotice;
            [self tf_pushToNavigationController:baseLiveVC];
        }
            break;
        case 2: {
            TFAnalystsListViewController *analystsVC = [[TFAnalystsListViewController alloc] init];
            [self tf_pushToNavigationController:analystsVC];
        }
            break;
        default:
            break;
    }
}

#pragma mark --- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        case 1:
            return [TFCommonLiveTableViewCell heightForCell];
            break;
        case 2:
            return 500;
        default:
            return 550;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 1) {
        TFCommonLiveTableViewCell *cell = [TFCommonLiveTableViewCell reusableCellDequeueTableView:self.tableView];
        NSString *name;
        if (indexPath.row == 0) {
            name = @"热门直播";
        } else {
            name = @"精彩预告";
        }
        
        NSDictionary *model = @{@"name" : name,
                                @"data" : @[@{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}]
                                };
        
        [cell configureWithModel:model];
        return cell;
    } else if (indexPath.row == 2) {
        TFRecommendAnalystsListTableViewCell *cell = [TFRecommendAnalystsListTableViewCell reusableCellDequeueTableView:self.tableView];
        cell.ColumnsLabel.text = @"首席推荐";
        cell.datasource = @[@{@"AnalystsHeaderImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"AnalystsName":@"张三", @"AnalystsDescription":@"额胜多负少的冯绍峰大声道"},
                            @{@"AnalystsHeaderImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"AnalystsName":@"张三", @"AnalystsDescription":@"额胜多负少的冯绍峰大声道"},
                            @{@"AnalystsHeaderImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"AnalystsName":@"张三", @"AnalystsDescription":@"额胜多负少的冯绍峰大声道"}];
        return cell;
    } else {
        TFSortListTableViewCell *cell = [TFSortListTableViewCell reusableCellDequeueTableView:self.tableView];
        cell.ColumnName.text = @"专题研究";
        cell.datasource = @[@{@"coverImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"sortName":@"专业视角|直击海外市场"},
  @{@"coverImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"sortName":@"专业视角|直击海外市场"},@{@"coverImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"sortName":@"专业视角|直击海外市场"},
                            @{@"coverImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"sortName":@"专业视角|直击海外市场"}];
        return cell;
    }
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [TFNavigationBarManager changeAlphaWithCurrentOffset:scrollView.contentOffset.y];
    
    if ([self.delegate respondsToSelector:@selector(scrollViewContentOffsetY:)]) {
        [self.delegate scrollViewContentOffsetY:scrollView.contentOffset.y];
    }
}

- (NSArray *)numberOfCycleBannerView:(TFCycleBannerView *)bannerView {
    return @[@"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"http://otdtbznd1.bkt.clouddn.com/1d6ab3e73c2bcffbb113ddd1f6507121.jpg", @"http://otdtbznd1.bkt.clouddn.com/079f1defe90d556d73f7574aae167eac.jpg"];
}

- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index {
    return UIViewContentModeScaleAspectFill;
}

#pragma mark - TFCycleBannerViewDelegate
- (void)cycleBannerView:(TFCycleBannerView *)bannerView didScrollToIndex:(NSUInteger)index {
    
}

- (void)cycleBannerView:(TFCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index {
    
}

- (UIImage *)placeHolderImageOfZeroBannerView {
    return nil;
}
@end
