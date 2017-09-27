//
//  SearchResultsTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/26.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "SearchResultsTableViewCell.h"

@interface SearchResultsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *VedioCoverImage;
@property (weak, nonatomic) IBOutlet UIImageView *VedioStatusImage;
@property (weak, nonatomic) IBOutlet UILabel *VedioTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *VedioAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *VedioTimeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthOfStatusImage;


@end


@implementation SearchResultsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
