//
//  TFAnalystsDetailViewController.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/10.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAnalystsDetailViewController.h"
//Controllers

//Cells
#import "TFCommonVideoCollectionViewCell.h"
//Views
#import "TFAnalystsDetailView.h"

//API

//Models

//Others
#import "TFNavigationBarManager.h"

@interface TFAnalystsDetailViewController ()
@property (nonatomic, strong)   NSMutableArray  *datasource;
@property (nonatomic, strong)   TFAnalystsDetailView *analystsHeaderView;

@end

@implementation TFAnalystsDetailViewController

#pragma mark - Setup
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
    
    flowLayout.headerReferenceSize = CGSizeMake(SCREENWIDTH, [TFAnalystsDetailView heightOfView]);  //设置headerView大小
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];  //  一定要设置
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
    self.title = @"分析师页面";
    [self setupCollectionView];
    
    [self loadData];
    [self refreshCollectionViewWithHeaderSel:@selector(loadData) withFooterRefreshSel:@selector(loadMoreData)];
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

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor GlobalBackgroundColr];
    
    TFAnalystsDetailView *analystsHeaderView= [[TFAnalystsDetailView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [TFAnalystsDetailView heightOfView])];
    self.analystsHeaderView = analystsHeaderView;
    NSDictionary *model = @{@"headerImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"name" : @"罗大涛", @"psition":@"这是一个分析师这是一个分析师", @"description":@"如果你不能简述你的想法说明你还不够了解它如果你不能简述你的想法说明你还不够了解它"};
    [analystsHeaderView configureWithModel:model];
    analystsHeaderView.backgroundColor = [UIColor orangeColor];
    [headerView addSubview:analystsHeaderView];
    return headerView;
}


@end
