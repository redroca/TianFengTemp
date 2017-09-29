//
//  TFSortListTableViewCell.h
//  TianFeng
//
//  Created by hades on 2017/9/28.
//  Copyright © 2017年 hades. All rights reserved.
//

#import <M4CoreFoundation/M4CoreFoundation.h>

@interface TFSortListTableViewCell : CoreXibTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ColumnName;
@property (strong, nonatomic)   NSArray *datasource;
@end
