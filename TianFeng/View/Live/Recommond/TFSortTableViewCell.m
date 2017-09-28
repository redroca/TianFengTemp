//
//  TFSortTableViewCell.m
//  TianFeng
//
//  Created by hades on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFSortTableViewCell.h"

@interface TFSortTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImg;
@property (weak, nonatomic) IBOutlet UILabel *sortName;

@end

@implementation TFSortTableViewCell
- (void)setup {
    [super setup];
}

- (void)configureCellWithModel:(NSDictionary *)model {
    [self.coverImg img:[NSURL URLWithString:model[@"coverImg"]] withPlaceholder:nil completion:nil];
    self.sortName.text = model[@"sortName"];
}
@end
