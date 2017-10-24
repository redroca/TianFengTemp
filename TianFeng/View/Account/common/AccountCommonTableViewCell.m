//
//  AccountCommonTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/23.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "AccountCommonTableViewCell.h"
@interface AccountCommonTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation AccountCommonTableViewCell

#pragma mark - Public
- (void)configureWithModel:(NSDictionary *)model {
    [self.coverImage img:[NSURL URLWithString:model[@"coverImage"]] withPlaceholder:nil completion:nil];
    self.titleLabel.text = model[@"title"];
    self.nameLabel.text = model[@"name"];
    self.timeLabel.text = model[@"time"];
}

+ (CGFloat)heightForCell {
    if (IS_IPHONEX) {
        return 85.f;
    }
    return 85/667.0 * SCREENHEIGHT;
}

#pragma mark – Initialization & Memory management methods
- (void)setup{
    [super setup];
}

@end
