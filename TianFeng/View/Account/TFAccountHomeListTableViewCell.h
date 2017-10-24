//
//  TFAccountHomeListTableViewCell.h
//  TianFeng
//
//  Created by 周恒 on 2017/10/18.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>
#import "CommonAppHeaders.h"

@interface TFAccountHomeListTableViewCell : CoreXibTableViewCell
- (void)configureWithModel:(NSDictionary *)model;
+ (CGFloat)heightForCell;

@end
