//
//  TFCommonLiveListTableViewCell.h
//  TianFeng
//
//  Created by 周恒 on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>

@interface TFCommonLiveListTableViewCell : CoreXibTableViewCell

- (void)configureWithModel:(NSDictionary *)model;

+ (CGFloat)heightForCell;
@end
