//
//  HomePageViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import "HomePageViewController.h"
#import <MJRefresh.h>

@interface HomePageViewController ()

@property (nonatomic ,strong)UIScrollView *scrollView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    [self createScrollView];
//    _scrollView.mj_header 
}



-(void)createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WHIDTH, 100);
    
    
    [self.view addSubview:_scrollView];
    
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
