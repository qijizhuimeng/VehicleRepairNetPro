//
//  CarDoctorViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/27.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CarDoctorViewController.h"
#import "CallQQAndTelephone.h"
#import "CarDoctorDetailViewController.h"
#import "CommonFaultsViewController.h"

#define btnWitdtHeight (SCREEN_WHIDTH - 50 - 60)/3
#define btnBaseWidth (SCREEN_WHIDTH - 24) / 5

@interface CarDoctorViewController ()

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIView *bottomView;
//@property (nonatomic, strong)CarDoctorModel *model;

@end

@implementation CarDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"车大夫专栏";
    
    [self judgmentIdentity];
    
    [self makeScrollView];
    [self makeTopView];
    [self makeBottomView];
    
}

-(void)judgmentIdentity {
    NSString *role = [UserModel shareInstanced].role;
    if ([role isEqualToString:@"1"]) {
        NSLog(@"车大夫身份登录");
    }else {
        NSLog(@"普通用户身份登录");
    }
    
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
    
    // 车大夫介绍
    UIButton *introduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [introduceBtn setBackgroundImage:[UIImage imageNamed:@"carDoctorColumn_jieshao"] forState:UIControlStateNormal];
    introduceBtn.tag = BASE_CARDOCTOR_TAG + 2; // 车大夫介绍的tag
    [introduceBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:introduceBtn];
    [introduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bottomView).offset(8);
        make.left.equalTo(_bottomView).offset(8);
        make.width.mas_equalTo(btnBaseWidth * 2);
        make.height.mas_equalTo(208);
    }];
    
    UILabel *introduceLab = [[UILabel alloc] init];
    introduceLab.text = @"车大夫介绍";
    introduceLab.textAlignment = NSTextAlignmentCenter;
    introduceLab.font = [UIFont systemFontOfSize:20];
    introduceLab.textColor = [UIColor whiteColor];
    [introduceBtn addSubview:introduceLab];
    [introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100 + 20);
        make.centerX.equalTo(introduceBtn);
        make.width.equalTo(introduceBtn);
        make.height.mas_equalTo(20);
    }];
    UILabel *introduceLabEnglish= [[UILabel alloc] init];
    introduceLabEnglish.text = @"Activities this week";
    introduceLabEnglish.textAlignment = NSTextAlignmentCenter;
    introduceLabEnglish.font = [UIFont systemFontOfSize:12];
    introduceLabEnglish.textColor = [UIColor whiteColor];
    [introduceBtn addSubview:introduceLabEnglish];
    [introduceLabEnglish mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(introduceLab.mas_bottom).offset(8);
        make.centerX.equalTo(introduceBtn);
        make.width.equalTo(introduceBtn);
        make.height.mas_equalTo(15);
    }];
    
    // 常见故障
    UIButton *malfunctionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [malfunctionBtn setBackgroundImage:[UIImage imageNamed:@"carDoctorColumn_changj"] forState:UIControlStateNormal];
    malfunctionBtn.tag = BASE_CARDOCTOR_TAG + 3;// 常见故障
    [malfunctionBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:malfunctionBtn];
    [malfunctionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bottomView).offset(8);
        make.left.equalTo(introduceBtn.mas_right).offset(8);
        make.height.mas_equalTo(100);
        make.right.equalTo(_bottomView.mas_right).offset(-8);
    }];
    
    UILabel *malfunctionLab = [[UILabel alloc] init];
    malfunctionLab.text = @"常见故障";
    malfunctionLab.textAlignment = NSTextAlignmentCenter;
    malfunctionLab.font = [UIFont systemFontOfSize:20];
    malfunctionLab.textColor = [UIColor whiteColor];
    [malfunctionBtn addSubview:malfunctionLab];
    [malfunctionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerY.equalTo(malfunctionBtn);
        make.left.equalTo(malfunctionBtn).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    // 用车常识
    UIButton *commonSenseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commonSenseBtn setBackgroundImage:[UIImage imageNamed:@"carDoctorColumn_car"] forState:UIControlStateNormal];
    commonSenseBtn.tag = BASE_CARDOCTOR_TAG + 4; // 用车常识
    [commonSenseBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_bottomView addSubview:commonSenseBtn];
    [commonSenseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(malfunctionBtn.mas_bottom).offset(8);
        make.left.equalTo(introduceBtn.mas_right).offset(8);
        make.height.mas_equalTo(100);
        make.right.equalTo(_bottomView.mas_right).offset(-8);
    }];
    
    UILabel *commonSenseLab = [[UILabel alloc] init];
    commonSenseLab.text = @"用车常识";
    commonSenseLab.textAlignment = NSTextAlignmentCenter;
    commonSenseLab.font = [UIFont systemFontOfSize:20];
    commonSenseLab.textColor = [UIColor whiteColor];
    [commonSenseBtn addSubview:commonSenseLab];
    [commonSenseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerY.equalTo(commonSenseBtn);
        make.right.equalTo(malfunctionBtn).offset(-20);
        make.height.mas_equalTo(20);
    }];
    
    
    // 问题板
    UIButton *questionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    questionBtn.backgroundColor = [UIColor orangeColor];
    [questionBtn setBackgroundImage:[UIImage imageNamed:@"carDoctorColumn_wenti"] forState:UIControlStateNormal];
    questionBtn.tag = BASE_CARDOCTOR_TAG + 5; // 问题板
    [questionBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:questionBtn];
    [questionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(introduceBtn.mas_bottom).offset(8);
        make.left.equalTo(_bottomView).offset(8);
        make.height.mas_equalTo(100);
        make.right.equalTo(_bottomView.mas_right).offset(-8);
    }];
    
    UILabel *questionLab = [[UILabel alloc] init];
    questionLab.text = @"问题板";
    questionLab.textAlignment = NSTextAlignmentCenter;
    questionLab.font = [UIFont systemFontOfSize:20];
    questionLab.textColor = [UIColor whiteColor];
    [questionBtn addSubview:questionLab];
    [questionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerY.equalTo(questionBtn);
        make.right.mas_equalTo( - SCREEN_WHIDTH / 2);
        make.height.mas_equalTo(20);
    }];
    
}

-(void)bottomBtnClick:(UIButton *)sender {
    switch (sender.tag) {
        case BASE_CARDOCTOR_TAG + 2:
        {
            NSLog(@"车大夫介绍");
            CarDoctorDetailViewController *vc = [[CarDoctorDetailViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case BASE_CARDOCTOR_TAG + 3:
        {
            NSLog(@"常见故障");
            CommonFaultsViewController *vc = [[CommonFaultsViewController alloc] initWithStyle:UITableViewStylePlain];
            vc.columnType = CommonFaults;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case BASE_CARDOCTOR_TAG + 4:
        {
            NSLog(@"用车常识");
            CommonFaultsViewController *vc = [[CommonFaultsViewController alloc] initWithStyle:UITableViewStylePlain];
            vc.columnType = Commonsense;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case BASE_CARDOCTOR_TAG + 5:
        {
            NSLog(@"问题板");
            break;
        }
        default:
            break;
    }
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
