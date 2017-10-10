//
//  GoldAnalystsCollectionViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFGoldAnalystsCollectionViewCell.h"

@interface TFGoldAnalystsCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *analystsHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *analystsName;
@property (weak, nonatomic) IBOutlet UILabel *analystsPosition;



@end


@implementation TFGoldAnalystsCollectionViewCell

- (void)setup {
    [super setup];
}

#pragma mark – Initialization & Memory management methods

- (void)configureCellWithModel:(NSDictionary *)model {
    [self.analystsHeaderImage img:[NSURL URLWithString:model[@"AnalystsHeaderImage"]] withPlaceholder:nil completion:nil];
    self.analystsName.text = model[@"AnalystsName"];
    self.analystsPosition.text = model[@"AnalystsDescription"];
}

#pragma mark – Public methods
+ (CGFloat)widthOfCollectionViewCell {
    return (SCREENWIDTH) * (115 / 375.0);
}

+ (CGFloat)heightOfCollectionViewCell {
    return (SCREENHEIGHT) * (208 / 667.0);
}

@end
