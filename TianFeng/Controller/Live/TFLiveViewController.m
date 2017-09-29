//
//  TFLiveViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/21.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFLiveViewController.h"

#define kHeaderViewTop      40.0f

//Controllers
#import "TFRecommondViewController.h"
#import "TFAnalystsViewController.h"
#import "TFStocksViewController.h"
#import "TFRoomViewController.h"
#import "FFPagingViewController.h"

//Cells

//Views

//API

//Models

//Other
#import "CommonAppHeaders.h"

@interface TFLiveViewController () <FFPagingViewControllerDelegate, FFPagingViewControllerDataSource, TFRecommondViewControllerDelegate>
@property(nonatomic, strong)    FFPagingViewController     *pagingViewController;

@property(nonatomic, strong)    NSMutableArray             *viewControllers;
@property(nonatomic, strong)    NSArray                    *titlesData;

@property(nonatomic, assign)    BOOL                       scrollNeedToChangeColor;
@end

@implementation TFLiveViewController

#pragma mark - Setters/Getters
- (NSArray<NSString *> *)titlesData {
    if (!_titlesData) {
        _titlesData = @[@"推荐", @"分析师", @"个股", @"大讲堂"];
    }
    return _titlesData;
}

#pragma mark - getter
- (FFPagingViewController *)pagingViewController
{
    if (!_pagingViewController) {
        _pagingViewController = [[FFPagingViewController alloc] init];
        _pagingViewController.delegate = self;
        _pagingViewController.dataSource = self;
        _pagingViewController.scrolled = NO;
    }
    return _pagingViewController;
}

- (FFPagingHeaderView *)pagingHeaderView
{
    if (!_pagingHeaderView) {
        _pagingHeaderView = [[FFPagingHeaderView alloc] init];
        _pagingHeaderView.backgroundColor = [UIColor clearColor];
        _pagingHeaderView.showItemLine = NO;
        _pagingHeaderView.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        _pagingHeaderView.selectTextColor = [UIColor whiteColor];
        _pagingHeaderView.lineColor = [UIColor clearColor];
        _pagingHeaderView.itemLinePosition = FFPagingViewItemLineTop;
    }
    return _pagingHeaderView;
}

- (NSMutableArray *)viewControllers
{
    if (!_viewControllers) {
        _viewControllers = [NSMutableArray array];
    }
    return _viewControllers;
}

#pragma mark - Setup
- (void)setupTitleView {
    
    CGFloat width = SCREENWIDTH / (self.titlesData.count + 1);
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, kHeaderViewTop)];
    titleView.backgroundColor = [UIColor clearColor];
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, kHeaderViewTop)];
    [leftButton addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitle:@"搜索" forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    leftButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    
    WS(weakSelf);
    self.pagingHeaderView.pagingViewItemClickHandle = ^(FFPagingHeaderView *headerView, NSString *title, NSInteger currentIndex) {
        weakSelf.pagingViewController.seletedIndex = currentIndex;
        if (currentIndex) {
            headerView.textColor = [UIColor LiveTitleNormalColor];
            headerView.selectTextColor = [UIColor blackColor];
            [leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        } else {
            if (weakSelf.scrollNeedToChangeColor) {
                headerView.textColor = [UIColor LiveTitleNormalColor];
                headerView.selectTextColor = [UIColor blackColor];
            } else {
                headerView.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
                headerView.selectTextColor = [UIColor whiteColor];
            }            
        }
    };
    
    self.pagingHeaderView.frame = CGRectMake(width, 0, SCREENWIDTH - width, kHeaderViewTop);
    self.pagingHeaderView.itemWidth = width;
    self.pagingHeaderView.titles = self.titlesData;
    
    [titleView addSubview:leftButton];
    [titleView addSubview:self.pagingHeaderView];
    [self.navigationController.navigationBar addSubview:titleView];
    [self.view addSubview:self.pagingViewController.view];
    [self.pagingViewController reloadData];
}

- (void)setupData
{
    TFRecommondViewController *recommondVC = [[TFRecommondViewController alloc] init];
    recommondVC.delegate = self;
    TFAnalystsViewController *analystsVC = [[TFAnalystsViewController alloc] init];
    TFStocksViewController *stocksVC = [[TFStocksViewController alloc] init];
    TFRoomViewController *roomVC = [[TFRoomViewController alloc] init];
    
    self.viewControllers = @[recommondVC, analystsVC, stocksVC, roomVC].mutableCopy;
}

- (void)initBarManager {
    [TFNavigationBarManager managerWithController:self];
    [TFNavigationBarManager setBarColor:[UIColor whiteColor]];
    [TFNavigationBarManager setZeroAlphaOffset:0];
    [TFNavigationBarManager setFullAlphaOffset:150];
    [TFNavigationBarManager setFullAlphaTintColor:[UIColor whiteColor]];
    [TFNavigationBarManager setFullAlphaBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark - Override super methods

#pragma mark – Target action methods
- (void)searchAction:(UIButton *)btn {

}

#pragma mark – Request service methods

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initBarManager];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navigationItem.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollNeedToChangeColor = NO;
    
    [self setupData];
    [self setupTitleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – Delegate
#pragma mark - Datasource & Delegate
#pragma mark - FFPagingViewControllerDelegate
- (void)customPagingViewController:(FFPagingViewController *)pagingViewController slideIndex:(NSInteger)slideIndex
{
    [self.pagingHeaderView updateTitleContentOffset:slideIndex];
}

- (void)customPagingViewController:(FFPagingViewController *)pagingViewController contentOffset:(CGPoint)slideOffset
{
    self.pagingHeaderView.contentOffset = slideOffset;
}

#pragma mark - FFPagingViewControllerDataSource
- (NSUInteger)numberOfChildViewControllersInPagingViewController:(FFPagingViewController *)pagingViewController
{
    return self.viewControllers.count;
}

- (UIViewController *)pagingViewController:(FFPagingViewController *)pageingViewController atIndex:(NSInteger)index
{
    return self.viewControllers[index];
}

- (CGRect)pagingViewControllerFrameAtIndex:(NSInteger)index {
    CGFloat tabbarHeight = self.tabBarController.tabBar.sizeH;

    if (index) {
        CGFloat navigationBarHeight = 64.0f;
        
        if (IS_IPHONEX) {
            navigationBarHeight = 88.0f;
        }
        return CGRectMake(0, navigationBarHeight, self.view.sizeW, self.view.sizeH - navigationBarHeight - tabbarHeight);
    } else {
        return CGRectMake(0, 0, self.view.sizeW, self.view.sizeH - tabbarHeight);
    }
}

#pragma mark - TFRecommondViewControllerDelegate
- (void)scrollViewContentOffsetY:(float)contentOffsetY {
    if (contentOffsetY > [TFNavigationBarManager sharedManager].fullAlphaOffset/2.0) {
        self.pagingHeaderView.textColor = [UIColor LiveTitleNormalColor];
        self.pagingHeaderView.selectTextColor = [UIColor blackColor];
        self.scrollNeedToChangeColor = YES;
    } else {
        self.pagingHeaderView.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        self.pagingHeaderView.selectTextColor = [UIColor whiteColor];
        self.scrollNeedToChangeColor = NO;
    }
}
@end
