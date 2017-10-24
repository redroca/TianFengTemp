//
//  TFAccountListHeaderView.h
//  TianFeng
//
//  Created by 周恒 on 2017/10/17.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>
#import "CommonAppHeaders.h"

@interface TFAccountListHeaderView : CoreDesignableXibUIView
+ (CGFloat)heightOfView;
- (void)configureWithModel:(NSDictionary *)model;
@end
