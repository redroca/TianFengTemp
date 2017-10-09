//
//  TFNavigationBar.m
//  TianFeng
//
//  Created by hades on 2017/9/30.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFNavigationBar.h"
#import "CommonAppHeaders.h"

#define kGlobalStatusBarHeight          20.f
#define kIphoneXNavigationBarHeight     88.f
#define kDefaultNavigationBarHeight     64.f

@interface TFNavigationBar()
@property (nonatomic, strong)   UIImageView *navigationBarImageView;
@property (nonatomic, strong)   UIView      *navigationBarView;
@end

@implementation TFNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupDefault];
        [self setup];
    }
    return self;
}

- (void)setupDefault {
    self.barColor = [UIColor clearColor];
    self.backgroundImage = nil;
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.navigationBarView];
    [self addSubview:self.navigationBarImageView];
    
    self.navigationBarView.backgroundColor = self.barColor;
    self.navigationBarImageView.image = self.backgroundImage;
}

#pragma mark Getter/Setter

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    _backgroundImage = backgroundImage;
    
    self.navigationBarImageView.image = _backgroundImage;
}

- (UIImageView *)navigationBarImageView {
    if (!_navigationBarImageView) {
        _navigationBarImageView = [[UIImageView alloc] init];
        _navigationBarImageView.userInteractionEnabled = YES;
        _navigationBarImageView.backgroundColor = [UIColor clearColor];
        _navigationBarImageView.frame = self.navigationBarView.frame;
    }
    return _navigationBarImageView;
}

- (UIView *)navigationBarView {
    if (!_navigationBarView) {
        _navigationBarView = [[UIView alloc] init];
        _navigationBarView.backgroundColor = [UIColor redColor];
        if (IS_IPHONEX) {
            _navigationBarView.frame = CGRectMake(0, -44, self.frame.size.width, kIphoneXNavigationBarHeight);
        } else {
            _navigationBarView.frame = CGRectMake(0, -20, self.frame.size.width, kDefaultNavigationBarHeight);
        }
    }
    return _navigationBarView;
}

@end
