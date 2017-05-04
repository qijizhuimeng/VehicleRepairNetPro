//
//  CustomTabBarController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CustomTabBarController.h"
#import "BaseViewController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTabBarController];
}

-(void)createTabBarController {
    NSArray *iconImgArr = @[@"customServiceCenter",@"enterprise",@"homePage",@"maintainRights",@"myCenter"];
    NSArray *selectedIconImgArr = @[@"customServiceCenterSelected",@"enterpriseSelected",@"homePageSelected",@"maintainRightsSelected",@"myCenterSelected"];
    NSArray *classNameArr = @[@"CustomerServiceCenterViewController",@"EnterpriseViewController",@"HomePageViewController",@"MaintainRightsViewController",@"MyCenterViewController"];
    NSArray *titleArr = @[@"客服中心",@"企业查询",@"首页",@"我要维权",@"我的"];
    
    NSMutableArray *viewcontrollersArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < classNameArr.count; i ++) {
        Class classController = NSClassFromString(classNameArr[i]);
        BaseViewController *baseVC = [[classController alloc] init];
        
        baseVC.tabBarItem.image = [UIImage imageNamed:iconImgArr[i]];
        baseVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedIconImgArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 特别注意
        // 在基类里同意设置
        baseVC.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        
        
        baseVC.tabBarItem.title = titleArr[i];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:baseVC];
        
        [viewcontrollersArr addObject:nav];
    }

    self.viewControllers = viewcontrollersArr;
    self.selectedIndex = 2;
//    self.tabBar.tintColor = [UIColor clearColor];
    self.tabBar.translucent = NO;// 线
    
    // 设置tabBarItem 的title的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :getColor(redColor)} forState:UIControlStateSelected];
    
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
