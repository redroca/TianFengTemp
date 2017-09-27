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

//Cells

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
    UIView *bannerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, kBannerViewHeight * RATIO + 10)];
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
}

#pragma mark --- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Override
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
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
