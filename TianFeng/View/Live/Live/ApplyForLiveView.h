//
//  ApplyForLiveView.h
//  TianFeng
//
//  Created by 周恒 on 2017/10/11.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonAppHeaders.h"
@interface ApplyForLiveView : CoreDesignableXibUIView
+ (CGFloat)heightOfView;
- (void)configureWithModel:(NSDictionary *)model;

@end
