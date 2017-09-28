//
//  TFCommonVideoCollectionViewCell.m
//  TianFeng
//
//  Created by hades on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFCommonVideoCollectionViewCell.h"
@interface TFCommonVideoCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *VedioCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *VedioTitle;
@property (weak, nonatomic) IBOutlet UILabel *VedioName;
@property (weak, nonatomic) IBOutlet UILabel *VedioTime;
@property (weak, nonatomic) IBOutlet UIImageView *vedioStatusImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthOfStatusImage;
@end

@implementation TFCommonVideoCollectionViewCell

- (void)setup {
    [super setup];
    [self initUserInterface];
}

- (void)configureCellWithModel:(NSDictionary *)dic {
    [self.VedioCoverImage img:[NSURL URLWithString:dic[@"VedioCoverImage"]] withPlaceholder:nil completion:nil];
    self.VedioTitle = dic[@"VedioTitle"];
    self.VedioName = dic[@"VedioName"];
    self.VedioTime = dic[@"VedioTime"];
}

#pragma mark – Initialization & Memory management methods
- (void)initUserInterface {
    
}

#pragma mark – Public methods
//股票预告图片尺寸300*200
+ (CGFloat)widthOfPremonitoryStocksCollectionViewCell {
    return (SCREENWIDTH) * (150 / 375.0);
}
+ (CGFloat)heightOfPremonitoryStocksCollectionViewCell {
    if (IS_IPHONEX) {
        return 162.0f;
    }
    return (SCREENHEIGHT) * (162 / 667.0);
}

//股票讲堂图片尺寸330*220
+ (CGFloat)widthOfStocksVedioCollectionViewCell {
    return (SCREENWIDTH) * (165 / 375.0);
}
+ (CGFloat)heightOfStocksVedioCollectionViewCell {
    if (IS_IPHONEX) {
        return 202.f;
    }
    return (SCREENHEIGHT) * (202 / 667.0);
}

@end
