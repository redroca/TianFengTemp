//
//  ApplyForLiveViewController.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/11.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "ApplyForLiveViewController.h"
//Controllers
#import "ConfirmedOrderViewController.h"

//Cells
#import "ApplyForLiveTableViewCell.h"
//Views
#import "ApplyForLiveView.h"
//API

//Models

//Others
#import "TFNavigationBarManager.h"
@interface ApplyForLiveViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIButton *applyButton;

@property (strong, nonatomic) ApplyForLiveView *applyForLiveView;

@end

@implementation ApplyForLiveViewController

#pragma mark - Setup
- (void)setTableviewHeaderView {
    ApplyForLiveView *applyForLiveView = [[ApplyForLiveView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, [ApplyForLiveView heightOfView])];
    self.applyForLiveView = applyForLiveView;
    
    NSDictionary *model = @{@"coverImg" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"title" : @"读要闻瞄准货币基金的一枪打在了同业负债身", @"price":@"500" ,@"time":@"时间:2017.09.10 8:00", @"countOfPeople":@"1234人浏览", @"countOfApply":@"报名人数：1024人", @"headerImg":@"http://otdtbznd1.bkt.clouddn.com/079f1defe90d556d73f7574aae167eac.jpg", @"headerImg2":@"http://otdtbznd1.bkt.clouddn.com/1d6ab3e73c2bcffbb113ddd1f6507121.jpg"};
    [applyForLiveView configureWithModel:model];
    
    self.tableview.tableHeaderView = applyForLiveView;
}
#pragma mark - Setters/Getters

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark - Override super methods

#pragma mark – Request service methods

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableviewHeaderView];
    self.title = @"直播报名";
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark – Target action methods
- (IBAction)applyOrNot:(id)sender {
    ConfirmedOrderViewController *confirmedPayVC = [[ConfirmedOrderViewController alloc] init];
    [self.navigationController pushViewController:confirmedPayVC animated:YES];
}

#pragma mark – Delegate
#pragma mark --- UITableViewDelegate

#pragma mark --- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        case 1:
            return 180;
            break;
        default:
            return 180;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ApplyForLiveTableViewCell *cell = [ApplyForLiveTableViewCell reusableCellDequeueTableView:self.tableview];
    NSDictionary *model = @{@"content":@"如果你不能简述你的想法，那只能说明你还不够了解它如果你不能简述你的想法那只能说明你还不够了解它。如果你不能简述你的想法，那只能说明你还不够了解它如果你不能简述你的想法那只能说明你还不够了解它。如果你不能简述你的想法，那只能说明你还不够了解它如果你不能简述你的想法那只能说明你还不够了解它。如果你不能简述你的想法，那只能说明你还不够了解它如果你不能简述你的想法那只能说明你还不够了解它。"};
    
    [cell configureCellWithModel:model];
    
    cell.selectionStyle = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 45)];
    backView.backgroundColor = [UIColor GlobalBackgroundColr];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 120, 15)];
    if (section == 0) {
        label.text = @"直播简介";
    } else {
        label.text = @"讲师简介";
    }
    label.font = [UIFont boldSystemFontOfSize:14];
    [backView addSubview:label];
    
    return backView;
}


@end
