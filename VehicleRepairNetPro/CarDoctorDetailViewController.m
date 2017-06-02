//
//  CarDoctorDetailViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/2.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CarDoctorDetailViewController.h"
#import "VRNETBLL+CarDoctor.m"

@interface CarDoctorCustomButton : UIButton

@property (nonatomic, strong) UIImageView *myImageView;
@property (nonatomic, strong) UILabel *myLabel;

@end

@implementation CarDoctorCustomButton

-(instancetype)init {
    self = [super init];
    if (self) {
        if (!_myImageView) {
            _myImageView = [[UIImageView alloc] init];
            [self addSubview:_myImageView];
            [_myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.left.equalTo(self);
                make.right.equalTo(self);
                make.bottom.equalTo(self).offset(-28);
            }];
        }
        
        if (!_myLabel) {
            _myLabel = [[UILabel alloc] init];
            _myLabel.font = [UIFont systemFontOfSize:14];
            _myLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:_myLabel];
            [_myLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_myImageView.mas_bottom).offset(8);
                make.left.equalTo(self);
                make.right.equalTo(self);
                make.bottom.equalTo(self);
            }];
        }
        
    }
    return self;
}

@end

@interface CarDoctorDetailViewController ()

@property (nonatomic, strong)CarDoctorCustomButton *structureBtn; // 组织结构
@property (nonatomic, strong)CarDoctorCustomButton *methodsBtn; // 管理方法
@property (nonatomic, strong)CarDoctorCustomButton *associationBtn; // 服务章程
@property (nonatomic, strong)CarDoctorCustomButton *storeBtn; // 实体店关联

@property (nonatomic, strong)CarDoctorModel *carDoctorModel;

@end

@implementation CarDoctorDetailViewController

// 组织架构网络请求
-(void)requestCarCoctorStructureWithParameter:(NSDictionary *)parameter {
    [VRNETBLL getCarDoctorModleWithParameter:parameter Block:^(CarDoctorModel *model, NSError *error) {
        self.carDoctorModel = model;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = getColor(@"f2f2f2");
    [self makeView];
}

-(void)makeView {
    _structureBtn = [[CarDoctorCustomButton alloc] init];
    _structureBtn.myImageView.image = [UIImage imageNamed:@"introduce_icon1"];
    _structureBtn.myLabel.text  = @"组织结构";
    _structureBtn.tag = BASE_CARDOCTORDETAIL_TAG;
    [_structureBtn addTarget:self action:@selector(carDoctorDetailClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_structureBtn];
    [_structureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.left.equalTo(self.view).offset(30);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(158);
    }];
    
    _methodsBtn = [[CarDoctorCustomButton alloc] init];
    _methodsBtn.myImageView.image = [UIImage imageNamed:@"introduce_icon2"];
    _methodsBtn.myLabel.text  = @"管理方法";
    _methodsBtn.tag = BASE_CARDOCTORDETAIL_TAG + 1;
    [_methodsBtn addTarget:self action:@selector(carDoctorDetailClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_methodsBtn];
    [_methodsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-30);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(158);
    }];
    
    _associationBtn = [[CarDoctorCustomButton alloc] init];
    _associationBtn.myImageView.image = [UIImage imageNamed:@"introduce_icon3"];
    _associationBtn.myLabel.text  = @"服务章程";
    _associationBtn.tag = BASE_CARDOCTORDETAIL_TAG + 2;
    [_associationBtn addTarget:self action:@selector(carDoctorDetailClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_associationBtn];
    [_associationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.structureBtn.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(30);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(158);
    }];
    
    _storeBtn = [[CarDoctorCustomButton alloc] init];
    _storeBtn.myImageView.image = [UIImage imageNamed:@"introduce_icon4"];
    _storeBtn.myLabel.text  = @"实体店关联";
    _storeBtn.tag = BASE_CARDOCTORDETAIL_TAG + 3;
    [_storeBtn addTarget:self action:@selector(carDoctorDetailClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_storeBtn];
    [_storeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.structureBtn.mas_bottom).offset(40);
        make.right.equalTo(self.view).offset(-30);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(158);
    }];
}

-(void)carDoctorDetailClick:(CarDoctorCustomButton *)sender {
    switch (sender.tag) {
        case BASE_CARDOCTORDETAIL_TAG:{
            NSLog(@"组织结构");
            NSDictionary *parameter = @{@"type" : @"23",
              @"currentNum" : @"10",
              @"currentPage" : @"0"
                                        };
            [self requestCarCoctorStructureWithParameter:parameter];
            
            break;
        }
        case BASE_CARDOCTORDETAIL_TAG + 1:{
            NSLog(@"管理方法");
            break;
        }
        case BASE_CARDOCTORDETAIL_TAG + 2:{
            NSLog(@"服务章程");
            break;
        }
        case BASE_CARDOCTORDETAIL_TAG + 3:{
            NSLog(@"实体店关联");
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
