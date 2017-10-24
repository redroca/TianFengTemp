//
//  AccountCommonTableViewCell.h
//  TianFeng
//
//  Created by 周恒 on 2017/10/23.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>
#import "CommonAppHeaders.h"

@interface AccountCommonTableViewCell : CoreXibTableViewCell

+ (CGFloat)heightForCell;
- (void)configureWithModel:(NSDictionary *)model;

@end
