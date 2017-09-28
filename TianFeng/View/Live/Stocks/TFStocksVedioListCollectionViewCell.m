//
//  StocksVedioListCollectionViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFStocksVedioListCollectionViewCell.h"

@interface TFStocksVedioListCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *VedioCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *VedioTitle;
@property (weak, nonatomic) IBOutlet UILabel *VedioName;
@property (weak, nonatomic) IBOutlet UILabel *VedioTime;
@property (weak, nonatomic) IBOutlet UIImageView *vedioStatusImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthOfStatusImage;

@end

@implementation TFStocksVedioListCollectionViewCell

- (void)setup {
    [super setup];
    [self initUserInterface];
}

#pragma mark – Initialization & Memory management methods
- (void)initUserInterface {

    
}


#pragma mark – Public methods
//股票预告图片尺寸300*200
+ (CGFloat)widthOfPremonitoryStocksCollectionViewCell {
    return (SCREENWIDTH) * (300 / 375.0);
}
+ (CGFloat)heightOfPremonitoryStocksCollectionViewCell {
    return (SCREENHEIGHT) * (187 / 667.0);
}

//股票讲堂图片尺寸330*220
+ (CGFloat)widthOfStocksVedioCollectionViewCell {
    return (SCREENWIDTH) * (330 / 375.0);
}
+ (CGFloat)heightOfStocksVedioCollectionViewCell {
    return (SCREENHEIGHT) * (202 / 667.0);
}
@end

