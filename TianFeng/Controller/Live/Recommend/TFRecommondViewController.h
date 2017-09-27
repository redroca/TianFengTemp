//
//  TFRecommondViewController.h
//  TianFeng
//
//  Created by hades on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>
#import <UIKit/UIKit.h>

@protocol TFRecommondViewControllerDelegate <NSObject>
- (void)scrollViewContentOffsetY:(float)contentOffsetY;
@end

@interface TFRecommondViewController : BaseTableViewController
@property (nonatomic, weak)     id <TFRecommondViewControllerDelegate> delegate;
@end

