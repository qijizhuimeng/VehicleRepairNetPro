//
//  BaseViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/20.
//  Copyright © 2017年 me. All rights reserved.
//

#import "BaseViewController.h"
#import <MBProgressHUD.h>


@interface BaseViewController ()


@property (nonatomic, strong)MBProgressHUD *progressHUD;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = getColor(@"f2f2f2"); // 底色
    
    // 导航条的相干属性
    self.navigationController.navigationBar.barTintColor = getColor(@"f71f21"); // Bar
    self.navigationController.navigationBar.tintColor = getColor(@"ffffff"); // 白色
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:19.0f], NSForegroundColorAttributeName:getColor(@"ffffff")};
    self.navigationController.navigationBar.translucent = NO ;// Bar 的线是否显示
    //还可以给导航条设置一个背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    _progressHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:_progressHUD];
    
}

-(void)showProgressHUD {
    [_progressHUD showAnimated:YES];
}
-(void)hideProgressHUD {
    [_progressHUD hideAnimated:NO];
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
