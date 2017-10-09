//
//  TFCommonLiveTableViewCell.m
//  TianFeng
//
//  Created by hades on 2017/9/27.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFCommonLiveTableViewCell.h"

//Views
#import "TFCommonVideoCollectionViewCell.h"

@interface TFCommonLiveTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView   *collectionView;
@property (weak, nonatomic) IBOutlet UILabel            *ColumnsName;

@property (strong, nonatomic)   NSMutableArray  *datasource;
@end

@implementation TFCommonLiveTableViewCell

#pragma mark - Public
- (void)configureWithModel:(NSDictionary *)model {
    self.ColumnsName.text = model[@"name"];
    self.datasource = model[@"data"];
    
    [self.collectionView reloadData];
}

+ (CGFloat)heightForCell {
    return 255/667.0 * SCREENHEIGHT;
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
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView.collectionViewLayout = flowLayout;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置每个item的大小，
    flowLayout.itemSize = CGSizeMake([TFCommonVideoCollectionViewCell widthOfPremonitoryStocksCollectionViewCell], [TFCommonVideoCollectionViewCell heightOfPremonitoryStocksCollectionViewCell]);
//    // 设置列的最小间距
    flowLayout.minimumInteritemSpacing = 0;
//    // 设置最小行间距
    flowLayout.minimumLineSpacing = 15;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 15, 15);
    _collectionView.contentOffset = CGPointMake(0, 0);
}

- (IBAction)action_more:(id)sender {
}



#pragma mark – Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datasource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TFCommonVideoCollectionViewCell * cell = [TFCommonVideoCollectionViewCell reusableCellDequeueCollectionView:self.collectionView forIndexPath:indexPath];
    [cell configureCellWithModel:self.datasource[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
