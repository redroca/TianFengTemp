//
//  RecommendAnalystsTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "RecommendAnalystsTableViewCell.h"

@interface RecommendAnalystsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *analystsHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *analystsName;
@property (weak, nonatomic) IBOutlet UILabel *analystsDescription;


@end


@implementation RecommendAnalystsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
