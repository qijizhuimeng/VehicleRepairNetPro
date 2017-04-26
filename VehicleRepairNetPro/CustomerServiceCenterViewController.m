//
//  CustomerServiceCenterViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CustomerServiceCenterViewController.h"

@interface CustomerServiceCenterViewController ()

@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)UIView *topBackGroundView; // 上
@property(nonatomic, strong)UIView *middleBackGroundView;//中
@property(nonatomic, strong)UIView *bottomBackGroundView;//下
@property(nonatomic, strong)UILabel *vehicleRepairQuestionLab; // 我要咨询汽修问题
@property(nonatomic, strong)UIButton *carDoctorOne;// 车大夫1
@property(nonatomic, strong)UIButton *carDoctorTwo;// 车大夫2
@property(nonatomic, strong)UILabel *partsQuestionLab; // 我要咨询配件问题
@property(nonatomic, strong)UIButton *customerServiceOne;// 客服1
@property(nonatomic, strong)UIButton *customerServiceTwo;// 客服2
@property(nonatomic, strong)UILabel *callLab;// 拨打电话
@property(nonatomic, strong)UILabel *telephoneLab;// 电话号码

@end

@implementation CustomerServiceCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"客服中心";
    
    [self createView];
    [self setViewFrame];
}

-(void)createView {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = getColor(@"f2f2f2");
    
    _topBackGroundView = [[UIView alloc] init];
    _topBackGroundView.backgroundColor = [UIColor whiteColor];
    
    _middleBackGroundView = [[UIView alloc] init];
    _middleBackGroundView.backgroundColor = [UIColor whiteColor];
    
    _bottomBackGroundView = [[UIView alloc] init];
    _bottomBackGroundView.backgroundColor = [UIColor whiteColor];
    
    [self.scrollView addSubview:_topBackGroundView];
    [self.scrollView addSubview:_middleBackGroundView];
    [self.scrollView addSubview:_bottomBackGroundView];
    [self.view addSubview:_scrollView];
    
    
}

-(void)setViewFrame {
//    [UIScreen mainScreen].bounds.size.height
    _topBackGroundView.frame = CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT / 3);
    
    _middleBackGroundView.frame = CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT / 3);
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
