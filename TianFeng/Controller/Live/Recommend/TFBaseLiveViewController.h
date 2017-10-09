//
//  TFBaseLiveViewController.h
//  TianFeng
//
//  Created by hades on 2017/9/29.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>

typedef NS_ENUM(NSUInteger, TFLiveType) {
    kLiveIsLiving,
    kLiveAdvanceNotice,
    kLiveVideoHistory,
};

@interface TFBaseLiveViewController : BaseRefreshCollectionViewController
@property (nonatomic, assign)   TFLiveType  liveType;
@end
