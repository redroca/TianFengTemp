//
//  TFCommonVideoCollectionViewCell.h
//  TianFeng
//
//  Created by hades on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>
#import "CommonAppHeaders.h"

@interface TFCommonVideoCollectionViewCell : CoreXibCollectionViewCell
- (void)configureCellWithModel:(NSDictionary *)dic;

//股票预告图片尺寸300*200
+ (CGFloat)widthOfPremonitoryStocksCollectionViewCell;
+ (CGFloat)heightOfPremonitoryStocksCollectionViewCell;

//股票讲堂图片尺寸330*220
+ (CGFloat)widthOfStocksVedioCollectionViewCell;
+ (CGFloat)heightOfStocksVedioCollectionViewCell;

@end
