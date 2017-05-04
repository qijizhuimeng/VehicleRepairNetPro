//
//  EnterpriseDetailViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/4.
//  Copyright © 2017年 me. All rights reserved.
//

#import "EnterpriseDetailViewController.h"
#import "VRNETBLL+Enterprise.h"
#import "ConfigUnivasal.h"

@interface EnterpriseDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *mArr;
@property (nonatomic, strong)GetEnterpriseDetailModel *detailModel;
@property (nonatomic, strong)UIImageView *headerImageView;// 表头图片
@property (nonatomic, strong)UILabel *enterpriseTitleLab;// 企业名称
@property (nonatomic, strong)UILabel *rescueEnterpriseLab; // 是否是救援企业
@property (nonatomic, strong)UILabel *starLevelLab;// 星级
@property (nonatomic, strong)UILabel *line; // 分割线


@end

@implementation EnterpriseDetailViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self getEnterpriseDetailWithEnterpriseId:self.enterpriseId];
}

-(instancetype)init {
    if (self == [super init]) {
        self.navigationItem.title = @"企业基本信息";
        self.hidesBottomBarWhenPushed = YES;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
}

-(void)getEnterpriseDetailWithEnterpriseId:(NSString *)enterpriseId {
    [VRNETBLL getEnterpriseDetailWithId:enterpriseId Block:^(GetEnterpriseDetailModel *detailModel, NSError *error) {
        if (!error) {
            self.detailModel = detailModel;
            if ([detailModel.status isEqualToString:@"0"]) {
//                NSLog(@"%@",self.detailModel.infoModel.telephone);
                self.tableView.tableHeaderView = [self tableviewHeader];
            }else {
                [self showMessage:detailModel.msg];
            }
        }else {
            [self showError:error];
        }
    }];
}

-(void)createView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64 - 64) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

-(UIView *)tableviewHeader {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT / 3)];
    backView.backgroundColor = [UIColor orangeColor]; //getColor(@"f2f2f2");
//    [self.view addSubview:backView];
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, (SCREEN_HEIGHT / 3) - 60)];
    _headerImageView.backgroundColor = getColor(@"f2f2f2");
    [backView addSubview:_headerImageView];
    
    _enterpriseTitleLab = [[UILabel alloc] init];
//    _enterpriseTitleLab.text = @"企业名称";
    _enterpriseTitleLab.text = self.detailModel.infoModel.name;
    _enterpriseTitleLab.textAlignment = NSTextAlignmentLeft;
    _enterpriseTitleLab.font = [UIFont systemFontOfSize:15.0];
    [backView addSubview:_enterpriseTitleLab];
    [_enterpriseTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImageView.mas_bottom).offset(10);
        make.left.equalTo(_headerImageView).offset(8);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(15);
    }];
    
    _rescueEnterpriseLab = [[UILabel alloc] init];
    _rescueEnterpriseLab.text = @"是否是救援企业";
    _rescueEnterpriseLab.font = [UIFont systemFontOfSize:11.0];
    _rescueEnterpriseLab.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:_rescueEnterpriseLab];
    [_rescueEnterpriseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_enterpriseTitleLab.mas_bottom).offset(10);
        make.left.equalTo(_headerImageView).offset(10);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(15);
    }];
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = [UIColor redColor];
    [backView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImageView.mas_bottom);
        make.right.equalTo(backView.mas_right).offset(-10);
        make.height.mas_equalTo(60.0);
        make.width.mas_equalTo(100);
    }];
    
    _line = [[UILabel alloc] init];
    _line.backgroundColor = [UIColor whiteColor]; //getColor(@"f2f2f2");
    [backView addSubview:_line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImageView.mas_bottom).offset(10);
        make.right.equalTo(rightView.mas_left).offset(-10);
        make.bottom.equalTo(backView.mas_bottom).offset(-10);
        make.width.mas_equalTo(1);
    }];
    
    
    for (int i = 0; i < 5; i ++) {
        UIImageView *starlevel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"activity_evaluate_bar_false"]];
        starlevel.tag = BASE_ENTERPRISE_TAG + i;
//        starlevel.frame = CGRectMake(()*i, 10, 14, 14);
    }
    
    _starLevelLab = [[UILabel alloc] init];
    _starLevelLab.text = @"综合星级";
    _starLevelLab.font = [UIFont systemFontOfSize:11.0];
    [rightView addSubview:_starLevelLab];
    [_starLevelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(rightView);
        make.width.mas_equalTo(60);
        make.bottom.equalTo(rightView.mas_bottom).offset(-10);
    }];
    
    return backView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView 协议方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"enterpriseDetailID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"本地数据第%ld组第%ld行",indexPath.section,indexPath.row];
    }else if(indexPath.section == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"本地数据第%ld组第%ld行",indexPath.section,indexPath.row];
    }
    
    return cell;
}

#pragma mark 各组返回的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }else {
        return 30;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


#pragma mark 返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
