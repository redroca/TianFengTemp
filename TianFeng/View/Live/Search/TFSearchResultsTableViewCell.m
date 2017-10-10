//
//  SearchResultsTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/26.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFSearchResultsTableViewCell.h"

@interface TFSearchResultsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *VedioCoverImage;
@property (weak, nonatomic) IBOutlet UIImageView *VedioStatusImage;
@property (weak, nonatomic) IBOutlet UILabel *VedioTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *VedioAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *VedioTimeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthOfStatusImage;


@end

@implementation TFSearchResultsTableViewCell

- (void)setup {
    [super setup];
}

+ (CGFloat)heightForCell {
    if (IS_IPHONEX) {
        return 100.f;
    }
    return 100/667.0 * SCREENHEIGHT;
}

- (void)configureCellWithModel:(NSDictionary *)model {
    [self.VedioCoverImage img:[NSURL URLWithString:model[@"coverImg"]] withPlaceholder:nil completion:nil];
    [self.VedioStatusImage img:[NSURL URLWithString:model[@"statusImg"]] withPlaceholder:nil completion:nil];
    self.VedioTitleLabel.text = model[@"vedioTitle"];
    self.VedioAuthorLabel.text = model[@"vedioAuthor"];
    self.VedioTimeLabel.text = model[@"vedioTime"];
}

@end
