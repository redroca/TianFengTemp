//
//  TFCommonLiveListTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFCommonLiveListTableViewCell.h"

//Cells
#import "TFCommonVideoCollectionViewCell.h"


@interface TFCommonLiveListTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (weak, nonatomic) IBOutlet UICollectionView *commonLiveListCollection;
@property (weak, nonatomic) IBOutlet UILabel *columnsLabel;

@property (strong, nonatomic)   NSMutableArray  *datasource;


@end


@implementation TFCommonLiveListTableViewCell

#pragma mark - Public
- (void)configureWithModel:(NSDictionary *)model {
    self.columnsLabel.text = model[@"name"];
    self.datasource = model[@"data"];

    [self.commonLiveListCollection reloadData];
}

+ (CGFloat)heightForCell {
    if (IS_IPHONEX) {
        return 455.f;
    }
    return 455/667.0 * SCREENHEIGHT;
}

- (IBAction)moreAction:(id)sender {
    
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
    
    _commonLiveListCollection.delegate = self;
    _commonLiveListCollection.dataSource = self;
    _commonLiveListCollection.scrollEnabled = NO;
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _commonLiveListCollection.collectionViewLayout = flowLayout;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // 设置每个item的大小，
    flowLayout.itemSize = CGSizeMake([TFCommonVideoCollectionViewCell widthOfStocksVedioCollectionViewCell], [TFCommonVideoCollectionViewCell heightOfStocksVedioCollectionViewCell]);
    // 设置列的最小间距
    flowLayout.minimumInteritemSpacing = 10;
    // 设置最小行间距
    flowLayout.minimumLineSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 12.5, 0, 12.5);
    _commonLiveListCollection.contentOffset = CGPointMake(0, 0);
}




#pragma mark – Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TFCommonVideoCollectionViewCell * cell = [TFCommonVideoCollectionViewCell reusableCellDequeueCollectionView:self.commonLiveListCollection forIndexPath:indexPath];
    [cell configureCellWithModel:self.datasource[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.toVedioDetailBlock) {
        self.toVedioDetailBlock(indexPath.row);
    }
}






@end
