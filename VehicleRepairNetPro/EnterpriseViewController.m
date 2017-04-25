//
//  EnterpriseViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import "EnterpriseViewController.h"

@interface EnterpriseViewController ()

@end

@implementation EnterpriseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"企业查询";
    [self createRightButtonItem];
    
//    [self showProgressHUD];
}

-(void)createRightButtonItem {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 20, 20);                                
    [rightButton setImage:[UIImage imageNamed:@"searchImage"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
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
