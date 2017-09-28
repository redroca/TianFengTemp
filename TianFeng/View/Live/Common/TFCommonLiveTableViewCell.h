//
//  TFCommonLiveTableViewCell.h
//  TianFeng
//
//  Created by hades on 2017/9/27.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>

@interface TFCommonLiveTableViewCell : CoreXibTableViewCell

- (void)configureWithModel:(NSDictionary *)model;

+ (CGFloat)heightForCell;
@end
