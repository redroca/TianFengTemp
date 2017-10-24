//
//  ApplyForLiveView.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/11.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "ApplyForLiveView.h"

@interface ApplyForLiveView()
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *liveTitle;
@property (weak, nonatomic) IBOutlet UILabel *livePrice;
@property (weak, nonatomic) IBOutlet UILabel *liveTime;
@property (weak, nonatomic) IBOutlet UILabel *countOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *countOfApply;
@property (weak, nonatomic) IBOutlet UIImageView *peopleHeader;
@property (weak, nonatomic) IBOutlet UIImageView *peopleHeader2;
@property (weak, nonatomic) IBOutlet UIImageView *peopleHeader3;


@end

@implementation ApplyForLiveView

#pragma mark – Public methods
+ (CGFloat)heightOfView {
    if (IS_IPHONEX) {
        return 355/667.0 * SCREENHEIGHT;
    }
    return 355;
}

#pragma mark - Setup
- (void)setup{
    [super setup];
}

- (void)configureWithModel:(NSDictionary *)model {
    [self.coverImage img:[NSURL URLWithString:model[@"coverImg"]] withPlaceholder:nil completion:nil];
    self.liveTitle.text = model[@"title"];
    self.livePrice.text = model[@"price"];
    self.liveTime.text = model[@"time"];
    self.countOfPeople.text = model[@"countOfPeople"];
    self.countOfApply.text = model[@"countOfApply"];
    [self.peopleHeader img:[NSURL URLWithString:model[@"headerImg2"]] withPlaceholder:nil completion:nil];
    [self.peopleHeader2 img:[NSURL URLWithString:model[@"headerImg"]] withPlaceholder:nil completion:nil];
    [self.peopleHeader3 img:[NSURL URLWithString:model[@"headerImg2"]] withPlaceholder:nil completion:nil];
}

@end
