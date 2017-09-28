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
@property (weak, nonatomic) IBOutlet UIView *AnalystsBottomLine;

@end


@implementation TFRecommendAnalystsTableViewCell

- (void)setup {
    [super setup];
}

- (void)configureCellWithModel:(NSDictionary *)model {
    [self.AnalystsHeaderImage img:[NSURL URLWithString:model[@"AnalystsHeaderImage"]] withPlaceholder:nil completion:nil];
    self.AnalystsName.text = model[@"AnalystsName"];
    self.AnalystsDescription.text = model[@"AnalystsDescription"];
}

- (void)hideBottonLine {
    self.AnalystsBottomLine.hidden = YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
