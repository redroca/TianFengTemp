//
//  ApplyForLiveTableViewCell.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/11.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "ApplyForLiveTableViewCell.h"

@interface ApplyForLiveTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ApplyForLiveTableViewCell

- (void)setup {
    [super setup];
}

- (void)configureCellWithModel:(NSDictionary *)model {
    self.contentLabel.text = model[@"content"];
}

@end
