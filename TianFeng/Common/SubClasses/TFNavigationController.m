//
//  TFNavigationController.m
//  TianFeng
//
//  Created by hades on 2017/9/21.
//  Copyright © 2017年 hades. All rights reserved.
//

#import "TFNavigationController.h"
#import "CommonAppHeaders.h"

@interface TFNavigationController ()

@end

@implementation TFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setupBarBackgroundColor:[UIColor whiteColor]];
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"Helvetica Neue" size:20.0]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
