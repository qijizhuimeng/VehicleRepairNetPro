//
//  CarDoctorViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/27.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CarDoctorViewController.h"
#import "CallQQAndTelephone.h"

#define btnWitdtHeight (SCREEN_WHIDTH - 50 - 60)/3

@interface CarDoctorViewController ()

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIView *bottomView;

@end

@implementation CarDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"车大夫专栏";
    [self makeScrollView];
    [self makeTopView];
    [self makeBottomView];
}

-(void)makeScrollView {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64)];
    _scrollView.backgroundColor = getColor(@"f2f2f2");
    _scrollView.contentSize = CGSizeMake(SCREEN_WHIDTH, SCREEN_HEIGHT);
    
    [self.view addSubview:_scrollView];
}

-(void)makeTopView {
    _topView = [[UIView alloc] init];
    _topView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.equalTo(_scrollView);
        make.width.mas_equalTo(SCREEN_WHIDTH);
        make.height.mas_equalTo(150);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.text = @"车大夫";
//    titleLabel.backgroundColor = [UIColor orangeColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [_topView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topView).offset(8);
        make.width.mas_equalTo(btnWitdtHeight);
        make.centerY.equalTo(_topView);
        make.height.mas_equalTo(20);
    }];
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnOne setBackgroundImage:[UIImage imageNamed:@"carDoctorColumn_icon1"] forState:UIControlStateNormal];
    btnOne.tag = BASE_CARDOCTOR_TAG ;
    [btnOne addTarget:self action:@selector(carDoctorTouchClick:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:btnOne];
    [btnOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(30);
        make.centerY.equalTo(_topView);
        make.width.equalTo(titleLabel);
        make.height.mas_equalTo(btnWitdtHeight);
    }];

    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnTwo setBackgroundImage:[UIImage imageNamed:@"carDoctorColumn_icon2"] forState:UIControlStateNormal];
    btnTwo.tag = BASE_CARDOCTOR_TAG + 1;
    [btnTwo addTarget:self action:@selector(carDoctorTouchClick:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:btnTwo];
    [btnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnOne.mas_right).offset(30);
        make.centerY.equalTo(_topView);
        make.width.equalTo(titleLabel);
        make.height.mas_equalTo(btnWitdtHeight);
    }];
    
}
-(void)carDoctorTouchClick:(UIButton *)sender {
    if (sender.tag == BASE_CARDOCTOR_TAG) {
        NSLog(@"车大夫1");
        [CallQQAndTelephone callQQ:@"3217226612"];
    }
    if (sender.tag == (BASE_CARDOCTOR_TAG + 1)) {
        NSLog(@"车大夫2");
        [CallQQAndTelephone callQQ:@"2426095951"];
    }
}

-(void)makeBottomView {
    _bottomView = [[UIView alloc] init];
    _bottomView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_bottomView];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView);
        make.top.equalTo(_topView.mas_bottom).offset(8);
        make.width.mas_equalTo(SCREEN_WHIDTH);
        make.height.mas_equalTo(450);
    }];
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
