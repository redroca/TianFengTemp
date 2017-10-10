//
//  TFBaseLiveViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/29.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFBaseLiveViewController.h"

//Controllers

//Cells

//Views
#import "TFCommonVideoCollectionViewCell.h"

//API

//Models

//Others
#import "TFNavigationBarManager.h"

@interface TFBaseLiveViewController ()
@property (nonatomic, strong)   NSMutableArray  *datasource;
@end

@implementation TFBaseLiveViewController

#pragma mark - Setup
- (void)setupTitleWithLiveType {
    switch (self.liveType) {
        case kLiveIsLiving: {
            self.title = @"热门直播";
        }
            break;
        case kLiveAdvanceNotice: {
            self.title = @"直播预告";
        }
            break;
        default:
            self.title = @"精彩回放";
            break;
    }
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView.collectionViewLayout = flowLayout;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // 设置每个item的大小，
    flowLayout.itemSize = CGSizeMake([TFCommonVideoCollectionViewCell widthOfStocksVedioCollectionViewCell], [TFCommonVideoCollectionViewCell heightOfStocksVedioCollectionViewCell]);
    // 设置列的最小间距
    flowLayout.minimumInteritemSpacing = 10;
    // 设置最小行间距
    flowLayout.minimumLineSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 12.5, 20, 12.5);
}

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
        NSDictionary *dic = @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"};
        [self.datasource addObject:dic];
    }
    [self.collectionView reloadData];
    [self receiveRefreshDataDidFinished:YES pageInfo:nil refreshStatus:LoadFirstPageData];
}

- (void)loadMoreData {
    for (int i=0; i<10; i++) {
        NSDictionary *dic = @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"};
        [self.datasource addObject:dic];
    }
    [self.collectionView reloadData];
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
    
    [self setupCollectionView];
    [self setupTitleWithLiveType];
    
    [self loadData];
    [self refreshCollectionViewWithHeaderSel:@selector(loadData) withFooterRefreshSel:@selector(loadMoreData)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – Delegate
#pragma mark --- UICollectionViewDelegate, UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TFCommonVideoCollectionViewCell *cell = [TFCommonVideoCollectionViewCell reusableCellDequeueCollectionView:self.collectionView forIndexPath:indexPath];
    [cell configureCellWithModel:self.datasource[indexPath.item]];
    
    return cell;
}

@end
