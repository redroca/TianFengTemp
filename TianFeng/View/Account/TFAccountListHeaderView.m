//
//  TFAccountListHeaderView.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/17.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAccountListHeaderView.h"
@interface TFAccountListHeaderView()
@property (weak, nonatomic) IBOutlet UIImageView *headerBackImage;
@property (weak, nonatomic) IBOutlet UIImageView *userHeaderImage;
@property (weak, nonatomic) IBOutlet UIImageView *userGenderImage;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation TFAccountListHeaderView

#pragma mark – Public methods
+ (CGFloat)heightOfView {
    if (IS_IPHONEX) {
        return 185/667.0 * SCREENHEIGHT;
    }
    return 185;
}

#pragma mark - Setup
- (void)setup{
    [super setup];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = self.frame;
    effectView.alpha = 0.8;
    [_headerBackImage addSubview:effectView];
    
}

- (void)configureWithModel:(NSDictionary *)model {
    self.userNameLabel.text = model[@"username"];
    [self.headerBackImage img:[NSURL URLWithString:model[@"headerBackImage"]] withPlaceholder:nil completion:nil];
    [self.userHeaderImage img:[NSURL URLWithString:model[@"userHeaderImage"]] withPlaceholder:nil completion:nil];
    [self.userGenderImage setImage:[UIImage imageNamed:@"icon_girl"]];
//    @"https://pic2.zhimg.com/v2-29b923ce754e7d4744b0a7d7a0014b25_r.jpg";
//    @"https://pic1.zhimg.com/v2-9c6c0b581a5a62ba594f9e615cfea14c_r.jpg";
}

@end
