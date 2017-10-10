//
//  AnalystsDetailView.m
//  TianFeng
//
//  Created by 周恒 on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFAnalystsDetailView.h"

@interface TFAnalystsDetailView()
@property (weak, nonatomic) IBOutlet UIImageView *AnalystsHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *AnalystsName;
@property (weak, nonatomic) IBOutlet UILabel *AnalystsPosition;
@property (weak, nonatomic) IBOutlet UILabel *AnalystsDescription;
@property (weak, nonatomic) IBOutlet UIButton *followButton;

@end

@implementation TFAnalystsDetailView

- (void)setup{
    [super setup];
    self.followButton.layer.cornerRadius = 2;
}

#pragma mark – Public methods
+ (CGFloat)heightOfView {
    if (IS_IPHONEX) {
        return 265;
    }
    return 265/667.0 * SCREENHEIGHT;
}

- (void)configureWithModel:(NSDictionary *)model {
    [self.AnalystsHeaderImage img:[NSURL URLWithString:model[@"headerImg"]] withPlaceholder:nil completion:nil];
    self.AnalystsName.text = model[@"name"];
    self.AnalystsPosition.text = model[@"psition"];
    self.AnalystsDescription.text = model[@"description"];
}

- (IBAction)followOrNot:(id)sender {
}



@end
