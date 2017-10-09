//
//  TFRoomViewController.m
//  TianFeng
//
//  Created by hades on 2017/9/25.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFRoomViewController.h"

//Cells
#import "TFGoldAnalystsListTableViewCell.h"
#import "TFCommonLiveTableViewCell.h"
#import "TFCommonLiveListTableViewCell.h"

@interface TFRoomViewController ()

@end

@implementation TFRoomViewController

#pragma mark - Setters/Getters

#pragma mark – Override properties

#pragma mark – Class methods

#pragma mark – Public methods

#pragma mark – Private methods

#pragma mark - Override super methods

#pragma mark – Target action methods

#pragma mark – Request service methods

#pragma mark – Initialization & Memory management methods

#pragma mark – View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark – Delegate
#pragma mark --- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark --- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return [TFCommonLiveTableViewCell heightForCell];
            break;
        case 1:
            return [TFCommonLiveListTableViewCell heightForCell];
            break;
        case 2:
            return [TFCommonLiveListTableViewCell heightForCell];
            break;
        default:
            return 44;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TFCommonLiveTableViewCell *cell = [TFCommonLiveTableViewCell reusableCellDequeueTableView:self.tableView];
        NSString *name = @"推荐讲坛";
        
        NSDictionary *model = @{@"name" : name,
                                @"data" : @[@{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}]
                                };
        
        [cell configureWithModel:model];
        return cell;
    } else if (indexPath.section == 1 || indexPath.section == 2) {
        TFCommonLiveListTableViewCell *cell = [TFCommonLiveListTableViewCell reusableCellDequeueTableView:self.tableView];
        NSString *name;
        if (indexPath.section == 1) {
            name = @"热门讲堂";
        } else {
            name = @"讲堂预告";
        }
        
        NSDictionary *model = @{@"name" : name,
                                @"data" : @[@{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}, @{@"VedioCoverImage" : @"http://otdtbznd1.bkt.clouddn.com/3d1cba03f81d8556ce692e4230e422af.jpg", @"VedioTitle" : @"直播都是对的的手段", @"VedioName":@"张三", @"VedioTime" : @"10/1 16:00"}]
                                };
        
        [cell configureWithModel:model];
        return cell;
    }  else {
        //Override
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.backgroundColor = [UIColor grayColor];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 5;
    } else {
    return 0.01;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 5)];
    backView.backgroundColor = [UIColor GlobalBackgroundColr];
    return backView;
}

@end
