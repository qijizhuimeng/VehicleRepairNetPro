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

-(void)showMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
        [alertView show];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertView dismissWithClickedButtonIndex:alertView.cancelButtonIndex animated:YES];
    });
    
}

-(void)showError:(NSError *)error {
    NSLog(@"%@",error);
    switch (error.code) {
        case NSURLErrorNotConnectedToInternet:
            [self showMessage:@"请检查你的网络"];
            break;
        case NSURLErrorTimedOut:
            [self showMessage:@"网络超时,请查看你的网路"];
            break;
        case NSURLErrorCannotConnectToHost:
            [self showMessage:@"服务器繁忙，请稍后重试"];
            break;
        case NSURLErrorNetworkConnectionLost:
            [self showMessage:@"处理过程中网络中断，请重试"];
            break;
        default:
            [self showMessage:@"未知错误"];
            break;
    }
}

-(CGFloat)getHeightWithDetailText:(NSString *)text width:(CGFloat)width font:(UIFont *)font {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
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
