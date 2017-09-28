//
//  GoldAnalystsListTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFGoldAnalystsListTableViewCell.h"
#import "GoldAnalystsCollectionViewCell.h"

@interface TFGoldAnalystsListTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *ColumnsName;



@end


@implementation TFGoldAnalystsListTableViewCell

#pragma mark – Initialization & Memory management methods
- (void)setup{
    [super setup];
    [self initInterface];
}

#pragma mark – Private methods
- (void)initInterface{
    _goldAnalystsListCollection.delegate = self;
    _goldAnalystsListCollection.dataSource = self;
    _goldAnalystsListCollection.showsVerticalScrollIndicator = NO;
    _goldAnalystsListCollection.showsHorizontalScrollIndicator = NO;
    _goldAnalystsListCollection.bounces = NO;
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _goldAnalystsListCollection.collectionViewLayout = flowLayout;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置每个item的大小，
    flowLayout.itemSize = CGSizeMake([GoldAnalystsCollectionViewCell widthOfCollectionViewCell], [GoldAnalystsCollectionViewCell heightOfCollectionViewCell]);
    // 设置列的最小间距
    flowLayout.minimumInteritemSpacing = 0;
    // 设置最小行间距
    flowLayout.minimumLineSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _goldAnalystsListCollection.contentOffset = CGPointMake(0, 0);
}


#pragma mark – Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GoldAnalystsCollectionViewCell * cell = [GoldAnalystsCollectionViewCell reusableCellDequeueCollectionView:_goldAnalystsListCollection forIndexPath:indexPath];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end