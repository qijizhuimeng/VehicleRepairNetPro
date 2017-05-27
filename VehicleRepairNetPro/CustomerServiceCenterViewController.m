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
@property(nonatomic, strong)UIButton *carDoctorBtnOne;// 车大夫1
@property(nonatomic, strong)UIButton *carDoctorBtnTwo;// 车大夫2
@property(nonatomic, strong)UILabel *partsQuestionLab; // 我要咨询配件问题
@property(nonatomic, strong)UIButton *customerServiceBtnOne;// 客服1
@property(nonatomic, strong)UIButton *customerServiceBtnTwo;// 客服2
@property(nonatomic, strong)UILabel *callLab;// 拨打电话
@property(nonatomic, strong)UILabel *telephoneLab;// 电话号码
@property(nonatomic, strong)UIImageView *telephoneImg;// 电话图片

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
    _scrollView.contentSize = CGSizeMake(SCREEN_WHIDTH, SCREEN_HEIGHT - 64);
    _scrollView.scrollEnabled = YES;
    
    _topBackGroundView = [[UIView alloc] init];
    _topBackGroundView.backgroundColor = [UIColor whiteColor];
    _vehicleRepairQuestionLab = [[UILabel alloc] init];
    _vehicleRepairQuestionLab.text = @"我要咨询汽修问题：";
    _vehicleRepairQuestionLab.textAlignment = NSTextAlignmentCenter;
    _carDoctorBtnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [_carDoctorBtnOne setTitle:@"车大夫1" forState:UIControlStateNormal];
    _carDoctorBtnOne.titleEdgeInsets = UIEdgeInsetsMake(70, 0, 0, 0);
    _carDoctorBtnOne.tag = BASE_KEFU_TAG + 1;
    [_carDoctorBtnOne addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_carDoctorBtnOne setBackgroundImage:[UIImage imageNamed:@"ServiceCenterVC_icon1"] forState:UIControlStateNormal];
    _carDoctorBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [_carDoctorBtnTwo setTitle:@"车大夫2" forState:UIControlStateNormal];
    _carDoctorBtnTwo.tag = BASE_KEFU_TAG + 2;
    [_carDoctorBtnTwo addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _carDoctorBtnTwo.titleEdgeInsets = UIEdgeInsetsMake(70, 0, 0, 0);
    [_carDoctorBtnTwo setBackgroundImage:[UIImage imageNamed:@"ServiceCenterVC_icon2"] forState:UIControlStateNormal];
//    _carDoctorBtnTwo.backgroundColor = [UIColor orangeColor];
    
    _middleBackGroundView = [[UIView alloc] init];
    _middleBackGroundView.backgroundColor = [UIColor whiteColor];
    _partsQuestionLab = [[UILabel alloc] init];
    _partsQuestionLab.text = @"我要咨询配件问题：";
    _partsQuestionLab.textAlignment = NSTextAlignmentCenter;
    _customerServiceBtnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [_customerServiceBtnOne setTitle:@"客服1" forState:UIControlStateNormal];
    _customerServiceBtnOne.titleEdgeInsets = UIEdgeInsetsMake(70, 0, 0, 0);
    _customerServiceBtnOne.tag = BASE_KEFU_TAG + 3;
    [_customerServiceBtnOne addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    _customerServiceBtnOne.backgroundColor = [UIColor orangeColor];
    [_customerServiceBtnOne setBackgroundImage:[UIImage imageNamed:@"ServiceCenterVC_icon3"] forState:UIControlStateNormal];
    _customerServiceBtnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [_customerServiceBtnTwo setTitle:@"客服2" forState:UIControlStateNormal];
    _customerServiceBtnTwo.titleEdgeInsets = UIEdgeInsetsMake(70, 0, 0, 0);
    _customerServiceBtnTwo.tag = BASE_KEFU_TAG + 4;
    [_customerServiceBtnTwo addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    _customerServiceBtnTwo.backgroundColor = [UIColor orangeColor];
    [_customerServiceBtnTwo setBackgroundImage:[UIImage imageNamed:@"ServiceCenterVC_icon4"] forState:UIControlStateNormal];
    
    // 创建手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClick:)];
    
    _bottomBackGroundView = [[UIView alloc] init];
    _bottomBackGroundView.backgroundColor = [UIColor whiteColor];
    _callLab = [[UILabel alloc] init];
    _callLab.text = @"拨打电话";
    _callLab.textAlignment = NSTextAlignmentCenter;
    _telephoneLab = [[UILabel alloc] init];
    _telephoneLab.userInteractionEnabled = YES;
    _telephoneLab.text = @"400-961-1488";
    _telephoneLab.textAlignment = NSTextAlignmentCenter;
    [_telephoneLab addGestureRecognizer:tapGesture];
    _telephoneImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ServiceCenterVC_tel"]];
//    [_telephoneImg addGestureRecognizer:tapGesture];
    _telephoneImg.userInteractionEnabled = YES;
    
    
    [self.scrollView addSubview:_topBackGroundView];
    [self.topBackGroundView addSubview:_vehicleRepairQuestionLab];
    [self.topBackGroundView addSubview:_carDoctorBtnOne];
    [self.topBackGroundView addSubview:_carDoctorBtnTwo];
    
    [self.scrollView addSubview:_middleBackGroundView];
    [self.middleBackGroundView addSubview:_partsQuestionLab];
    [self.middleBackGroundView addSubview:_customerServiceBtnOne];
    [self.middleBackGroundView addSubview:_customerServiceBtnTwo];
    
    [self.scrollView addSubview:_bottomBackGroundView];
    [self.bottomBackGroundView addSubview:_callLab];
    [self.bottomBackGroundView addSubview:_telephoneLab];
    [self.bottomBackGroundView addSubview:_telephoneImg];
    
    [self.view addSubview:_scrollView];
    
}

-(void)setViewFrame {
    [self masonrySetViewFrame];
    
    //topBackGround‘s subView
    [_vehicleRepairQuestionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topBackGroundView).offset(10);
        make.left.equalTo(_topBackGroundView).offset(50);
        make.right.equalTo(_topBackGroundView).offset(-50);
        make.height.mas_equalTo(20);
    }];
    [_carDoctorBtnOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_vehicleRepairQuestionLab.mas_bottom).offset(10);
        make.left.equalTo(_topBackGroundView).offset(10);
        make.width.mas_equalTo((SCREEN_WHIDTH - 30) / 2);
        make.height.mas_equalTo(140);
    }];
    [_carDoctorBtnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_vehicleRepairQuestionLab.mas_bottom).offset(10);
        make.left.equalTo(_carDoctorBtnOne.mas_right).offset(10);
        make.width.equalTo(_carDoctorBtnOne);
        make.height.equalTo(_carDoctorBtnOne);
    }];
    
    //middleBackGroundView‘s subView
    [_partsQuestionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_middleBackGroundView).offset(10);
        make.left.equalTo(_middleBackGroundView).offset(50);
        make.right.equalTo(_middleBackGroundView).offset(-50);
        make.height.mas_equalTo(20);
    }];
    [_customerServiceBtnOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_partsQuestionLab.mas_bottom).offset(10);
        make.left.equalTo(_middleBackGroundView).offset(10);
        make.width.mas_equalTo((SCREEN_WHIDTH - 30) / 2);
        make.height.mas_equalTo(140);
    }];
    [_customerServiceBtnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_partsQuestionLab.mas_bottom).offset(10);
        make.left.equalTo(_customerServiceBtnOne.mas_right).offset(10);
        make.width.equalTo(_customerServiceBtnOne);
        make.height.equalTo(_customerServiceBtnOne);
    }];
    
    //bottomBackGroundView
    [_callLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bottomBackGroundView).offset(10);
        make.left.equalTo(_bottomBackGroundView).offset(50);
        make.right.equalTo(_bottomBackGroundView).offset(-50);
        make.height.mas_equalTo(20);
    }];
    [_telephoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bottomBackGroundView);
        make.top.equalTo(_callLab.mas_bottom).offset(10);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    [_telephoneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_telephoneLab);
        make.right.equalTo(_telephoneLab.mas_left).offset(10);
        make.height.equalTo(_telephoneLab);
        make.width.mas_equalTo(18);
    }];
    
}
//使用masonry 自动布局
-(void)masonrySetViewFrame {
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.width.mas_equalTo(SCREEN_WHIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT - 64 - 49);
    }];
    
    [_topBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollView).offset(0);
        make.left.equalTo(_scrollView).offset(0);
        make.width.equalTo(_scrollView);
        make.height.mas_equalTo((SCREEN_HEIGHT) / 3);
    }];
    
    [_middleBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topBackGroundView.mas_bottom).offset(10);
        make.left.equalTo(_topBackGroundView);
        make.width.equalTo(_topBackGroundView);
        make.height.equalTo(_topBackGroundView.mas_height);
        
    }];
    
    [_bottomBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_middleBackGroundView.mas_bottom).offset(10);
        make.left.equalTo(_middleBackGroundView);
        make.width.equalTo(_topBackGroundView);
        make.height.mas_equalTo((SCREEN_HEIGHT) / 6);
    }];
}

// button按钮事件
- (void)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 10001:
            NSLog(@"车大夫1");
            [self callQQ:@"3217226612"]; 
            break;
        case 10002:
            NSLog(@"车大夫2");
            [self callQQ:@"2426095951"];
            break;
        case 10003:
            NSLog(@"客服1");
            //3297456501
            [self callQQ:@"2728738147"];
            break;
        case 10004:
            NSLog(@"客服2");
            //1129720558
            [self callQQ:@"3150904812"];
            break;
        default:
            break;
    }
}



-(void)tapGestureClick:(UITapGestureRecognizer *)gesture {
    NSLog(@"打电话%@",self.telephoneLab.text);
    [self callWithTelephone:self.telephoneLab.text];
}

// 启用QQ
-(void)callQQ:(NSString *)qq {
    NSString *urlStr = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",qq];
    NSURL *url = [NSURL URLWithString:urlStr];
    if (![[UIApplication sharedApplication]openURL:url]) {
        [self showMessage:@"没有找到QQ"];
    }
}

// 启用系统电话
-(void)callWithTelephone:(NSString*)Telephone {
    NSString *urlStr = [NSString stringWithFormat:@"tel://%@",Telephone];
    NSURL *url = [NSURL URLWithString:urlStr];
    [[UIApplication sharedApplication] openURL:url];
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
