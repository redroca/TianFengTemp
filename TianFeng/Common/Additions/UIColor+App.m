//
//  UIColor+App.m
//  Patrol
//
//  Created by Benjamin on 4/6/17.
//  Copyright © 2017 Cloud4Magic. All rights reserved.
//

#import "UIColor+App.h"
#import "ColorMacro.h"

@implementation UIColor (App)
+ (UIColor *)LiveTitleNormalColor {
    return CORE_RGBCOLOR(51, 51, 51);
}

+ (UIColor *)LiveTitleGrayColor {
    return CORE_RGBCOLOR(188, 188, 188);
}

+ (UIColor *)GlobalBackgroundColr {
    return CORE_RGBCOLOR(242, 242, 242);
}

+ (UIColor *)GlobalTabBarItemSelectedColor {
    return CORE_RGBCOLOR(255, 164, 56);
}

@end
