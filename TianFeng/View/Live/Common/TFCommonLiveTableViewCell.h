//
//  TFCommonLiveTableViewCell.h
//  TianFeng
//
//  Created by hades on 2017/9/27.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>
typedef void(^ToVedioDetailBlock)(NSInteger index);

@interface TFCommonLiveTableViewCell : CoreXibTableViewCell

@property (nonatomic, copy) ToVedioDetailBlock toVedioDetailBlock;

- (void)configureWithModel:(NSDictionary *)model;

+ (CGFloat)heightForCell;
@end
