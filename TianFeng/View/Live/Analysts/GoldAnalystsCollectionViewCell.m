//
//  GoldAnalystsCollectionViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "GoldAnalystsCollectionViewCell.h"

@interface GoldAnalystsCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *analystsHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *analystsName;
@property (weak, nonatomic) IBOutlet UILabel *analystsPosition;



@end


@implementation GoldAnalystsCollectionViewCell

- (void)setup {
    [super setup];
    [self initUserInterface];
}

#pragma mark – Initialization & Memory management methods
- (void)initUserInterface {
    
    
}



#pragma mark – Public methods
+ (CGFloat)widthOfCollectionViewCell {
    return (SCREENWIDTH) * (115 / 375.0);
}

+ (CGFloat)heightOfCollectionViewCell {
    return (SCREENHEIGHT) * (208 / 667.0);
}

@end
