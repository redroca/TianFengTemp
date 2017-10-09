//
//  GoldAnalystsListTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFGoldAnalystsListTableViewCell.h"
#import "TFGoldAnalystsCollectionViewCell.h"

@interface TFGoldAnalystsListTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *ColumnsName;

@property (strong, nonatomic)   NSMutableArray  *datasource;
@end


@implementation TFGoldAnalystsListTableViewCell

#pragma mark - Public
- (void)configureWithModel:(NSDictionary *)model {
    self.ColumnsName.text = model[@"name"];
    self.datasource = model[@"data"];
    
    [self.goldAnalystsListCollection reloadData];
}

#pragma mark – Initialization & Memory management methods
- (void)setup{
    [super setup];
    [self initInterface];
}

#pragma mark - Setter & Getter
- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
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
    flowLayout.itemSize = CGSizeMake([TFGoldAnalystsCollectionViewCell widthOfCollectionViewCell], [TFGoldAnalystsCollectionViewCell heightOfCollectionViewCell]);
    // 设置列的最小间距
    flowLayout.minimumInteritemSpacing = 0;
    // 设置最小行间距
    flowLayout.minimumLineSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _goldAnalystsListCollection.contentOffset = CGPointMake(0, 0);
}

- (IBAction)action_more:(id)sender {
}



#pragma mark – Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.datasource.count;
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TFGoldAnalystsCollectionViewCell * cell = [TFGoldAnalystsCollectionViewCell reusableCellDequeueCollectionView:_goldAnalystsListCollection forIndexPath:indexPath];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
