//
//  GoldAnalystsListTableViewCell.h
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonAppHeaders.h"

typedef void(^AnalystsDetailBlock)(NSInteger index);

@interface TFGoldAnalystsListTableViewCell : CoreXibTableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *goldAnalystsListCollection;
@property (nonatomic, copy) AnalystsDetailBlock analystsDetailBlock;
- (void)configureWithModel:(NSDictionary *)model;
@end
