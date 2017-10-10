//
//  GoldAnalystsCollectionViewCell.h
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonAppHeaders.h"

@interface TFGoldAnalystsCollectionViewCell : CoreXibCollectionViewCell
- (void)configureCellWithModel:(NSDictionary *)model;
+ (CGFloat)widthOfCollectionViewCell;
+ (CGFloat)heightOfCollectionViewCell;

@end
