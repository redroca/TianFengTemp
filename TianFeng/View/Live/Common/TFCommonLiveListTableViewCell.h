//
//  TFCommonLiveListTableViewCell.h
//  TianFeng
//
//  Created by 周恒 on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>
typedef void(^ToVedioDetailBlock)(NSInteger index);

@interface TFCommonLiveListTableViewCell : CoreXibTableViewCell

@property (nonatomic, copy) ToVedioDetailBlock toVedioDetailBlock;


- (void)configureWithModel:(NSDictionary *)model;

+ (CGFloat)heightForCell;
@end
