//
//  AppConstants.h
//  Patrol
//
//  Created by Benjamin on 4/6/17.
//  Copyright © 2017 Cloud4Magic. All rights reserved.
//


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define IS_IOS_11    floorf([[UIDevice currentDevice].systemVersion floatValue]) ==11.0 ? 1 : 0

#define IS_IPHONEX     [UIScreen mainScreen].bounds.size.height == 812 ? 1 : 0
