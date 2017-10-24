//
//  TFAccountHomeListTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/18.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAccountHomeListTableViewCell.h"
@interface TFAccountHomeListTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *listIcon;
@property (weak, nonatomic) IBOutlet UILabel *listNameLabel;



@end

@implementation TFAccountHomeListTableViewCell


#pragma mark - Public
- (void)configureWithModel:(NSDictionary *)model {
    self.listNameLabel.text = model[@"listName"];
    self.listIcon.image = [UIImage imageNamed:model[@"listIcon"]];
}

+ (CGFloat)heightForCell {
    if (IS_IPHONEX) {
        return 53.f;
    }
    return 53/667.0 * SCREENHEIGHT;
}

#pragma mark – Initialization & Memory management methods
- (void)setup{
    [super setup];
}
@end
