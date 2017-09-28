//
//  RecommendAnalystsTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFRecommendAnalystsTableViewCell.h"

@interface TFRecommendAnalystsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *AnalystsHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *AnalystsName;
@property (weak, nonatomic) IBOutlet UILabel *AnalystsDescription;


@end


@implementation TFRecommendAnalystsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
