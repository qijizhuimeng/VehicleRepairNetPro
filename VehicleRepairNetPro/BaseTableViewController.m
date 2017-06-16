//
//  BaseTableViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/20.
//  Copyright © 2017年 me. All rights reserved.
//

#import "BaseTableViewController.h"
#import <MBProgressHUD.h>


@interface BaseTableViewController ()

@property (nonatomic, strong)MBProgressHUD *progressHUD;

@end

@implementation BaseTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = getColor(@"f2f2f2"); // 暗灰色调
    
    [self.navigationController.navigationBar setBarTintColor:getColor(@"f71f21")]; //Bar 红色
    [self.navigationController.navigationBar setTintColor:getColor(@"ffffff")];  // 白色
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:19.0f],NSForegroundColorAttributeName:getColor(@"ffffff")};
    self.navigationController.navigationBar.translucent = NO; // Bar 的线是否显示
    //统一设置返回
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    // 还可以给Bar设置一个背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    _progressHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:_progressHUD];
    
}


-(void)showProgressHUD {
    [_progressHUD showAnimated:YES];
}

-(void)hideProgressHUD {
    [_progressHUD hideAnimated:YES];
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
    }
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

-(CGFloat)getHeightWithDetailText:(NSString *)text width:(CGFloat)width font:(UIFont *)font {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}

-(void)failureWithStatus:(NSString *)status message:(NSString *)message {
    NSLog(@"status:%@,msg:%@", status,message);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return @"页脚";
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"页眉";
//}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
////#warning Incomplete implementation, return the number of sections
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
////#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
