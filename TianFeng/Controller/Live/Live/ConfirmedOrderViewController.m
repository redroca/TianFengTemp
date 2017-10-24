//
//  ConfirmedOrderViewController.m
//  TianFeng
//
//  Created by 周恒 on 2017/10/12.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "ConfirmedOrderViewController.h"
#import "TFNavigationBarManager.h"

@interface ConfirmedOrderViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *alipayButton;
@property (weak, nonatomic) IBOutlet UIButton *wechatButton;
@property (weak, nonatomic) IBOutlet UIButton *payButton;

@end

@implementation ConfirmedOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单确认";
}

- (IBAction)alipayAction:(id)sender {
}

- (IBAction)wechatPayAction:(id)sender {
}

- (IBAction)confirmPayAction:(id)sender {
}





@end
