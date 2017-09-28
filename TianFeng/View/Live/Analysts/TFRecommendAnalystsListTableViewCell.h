//
//  RecommendAnalystsListTableViewCell.h
//  TianFeng
//
//  Created by 周恒 on 2017/9/26.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonAppHeaders.h"

@interface TFRecommendAnalystsListTableViewCell : CoreXibTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ColumnsLabel;

@property (strong, nonatomic)   NSArray *datasource;
@end
