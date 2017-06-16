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
#import <UIImageView+WebCache.h>
#import "EnterpriseDetailTableViewCell.h"
#import "EnterpriseAbstractTableViewCell.h"

@interface EnterpriseDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *mArr;
@property (nonatomic, strong)NSMutableArray *mTextArr;
@property (nonatomic, strong)GetEnterpriseDetailModel *detailModel;
@property (nonatomic, strong)UIImageView *headerImageView;// 表头图片
@property (nonatomic, strong)UILabel *enterpriseTitleLab;// 企业名称
@property (nonatomic, strong)UILabel *rescueEnterpriseLab; // 是否是救援企业
@property (nonatomic, strong)UILabel *starLevelLab;// 星级
@property (nonatomic, strong)UILabel *line; // 分割线

@end

@implementation EnterpriseDetailViewController

-(void)getEnterpriseDetailWithEnterpriseId:(NSString *)enterpriseId {
    [VRNETBLL getEnterpriseDetailWithId:enterpriseId Block:^(GetEnterpriseDetailModel *detailModel, NSError *error) {
        if (!error) {
            self.detailModel = detailModel;
            if ([detailModel.status isEqualToString:@"0"]) {
                //                NSLog(@"%@",self.detailModel.infoModel.telephone);
                self.tableView.tableHeaderView = [self tableviewHeader];
                [self loadData];
                [self.tableView reloadData];
            }else {
                [self showMessage:detailModel.msg];
            }
        }else {
            [self showError:error];
        }
    }];
}

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
    [self makeAppointmentFavorableButton];
}

-(void)makeAppointmentFavorableButton {
    
}

-(void)loadData {
    NSArray *arr = @[@"信誉等级:",@"企业电话:",@"救援电话:",@"救援价格:",@"经营范围:",@"经营特色:",@"企业动态"];
    self.mArr = [[NSMutableArray alloc] initWithArray:arr];
    
    NSArray *sList = self.detailModel.infoModel.sList;
    NSMutableString *mScope = [[NSMutableString alloc] init];
    for (NSDictionary *dic in sList) {
//        mScope = dic[@"name"];
        NSString *name = [NSString stringWithFormat:@"%@ ",dic[@"name"]];
        [mScope appendString:name];
    }
    
    NSArray *dList = self.detailModel.infoModel.dList;
    NSMutableString *mFeatures = [[NSMutableString alloc] init];
    for (NSDictionary *dic in dList) {
        NSString *name = [NSString stringWithFormat:@"%@ ",dic[@"name"]];
        [mFeatures appendString:name];
    }
    
    NSArray *arr2 = @[self.detailModel.infoModel.creditLevel,self.detailModel.infoModel.telephone,self.detailModel.infoModel.rescueCall,self.detailModel.infoModel.rescuePrice,mScope,mFeatures];
    self.mTextArr = [[NSMutableArray alloc] initWithArray:arr2]; //[[NSMutableArray alloc] initWithArray:arr];
    
}

-(void)createView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64 - 64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark 自定义头视图
-(UIView *)tableviewHeader {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT / 3)];
    backView.backgroundColor = [UIColor whiteColor]; //getColor(@"f2f2f2");
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, (SCREEN_HEIGHT / 3) - 60)];
//    _headerImageView.backgroundColor = getColor(@"f2f2f2");
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:self.detailModel.infoModel.img] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
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
    if (self.detailModel.infoModel.isRescue) {
        _rescueEnterpriseLab.text = @"救援企业";
    }else {
        _rescueEnterpriseLab.text = @"暂不支持救援";
    }
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
    rightView.backgroundColor = [UIColor whiteColor];
    [backView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImageView.mas_bottom);
        make.right.equalTo(backView.mas_right).offset(-10);
        make.height.mas_equalTo(60.0);
        make.width.mas_equalTo(100);
    }];
    
    _line = [[UILabel alloc] init];
    _line.backgroundColor = getColor(@"f2f2f2");
    [backView addSubview:_line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImageView.mas_bottom).offset(10);
        make.right.equalTo(rightView.mas_left).offset(-10);
        make.bottom.equalTo(backView.mas_bottom).offset(-10);
        make.width.mas_equalTo(1);
    }];
    
    //星级
    for (int i = 0; i < 5; i ++) {
        UIImageView *starlevel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"activity_evaluate_bar_false"]];
        starlevel.tag = BASE_ENTERPRISE_TAG + i;
        starlevel.frame = CGRectMake(10 + (14 + 5)*i, 10, 14, 14);
        starlevel.image = [UIImage imageNamed:@"activity_evaluate_bar_false"];
        [rightView addSubview:starlevel];
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
    static NSString *cellId = @"enterpriseDetailIdOne";
    static NSString *cellIdTwo = @"enterpriseDetailIdOneTwo";
    
    EnterpriseDetailTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellId];
    EnterpriseAbstractTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (indexPath.section == 0) {
        if (!cell1) {
            cell1 = [[EnterpriseDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        
        if (indexPath.row ==0 || indexPath.row == 3 || indexPath.row == 4 || indexPath.row ==5 || indexPath.row ==6) {
            cell1.telephoneIcon.hidden = YES;
        }
        
        if (indexPath.row ==6) {
            [cell1 addArrows];
        }else {
            cell1.titlleText.text = self.mTextArr[indexPath.row];
            
        }
        cell1.titleLab.text = self.mArr[indexPath.row];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    }else {
        if (!cell) {
            cell = [[EnterpriseAbstractTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdTwo];
        }
        //[NSString stringWithFormat:@"%ld",indexPath.row];
//        NSLog(@"%f",[self getHeightWithDetailText:self.detailModel.infoModel.introduction width:SCREEN_WHIDTH font:[UIFont systemFontOfSize:12]]);
        [cell.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo([self getHeightWithDetailText:self.detailModel.infoModel.introduction width:SCREEN_WHIDTH font:[UIFont systemFontOfSize:12]] + 10);
        }];
        cell.titleLab.text = @"企业简介";
        cell.content.text = self.detailModel.infoModel.introduction;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    
}

#pragma mark 各组返回的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.mArr.count;
    }else {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    }else {
        return [self getHeightWithDetailText:self.detailModel.infoModel.introduction width:SCREEN_WHIDTH font:[UIFont systemFontOfSize:12]] + 54;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10.0;
    }else {
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }else {
        return 0;
    }
}

#pragma mark 返回组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        NSLog(@"拨打企业电话：%@",self.mTextArr[indexPath.row]);
    }
    if (indexPath.row == 2) {
        NSLog(@"拨打救援电话：%@",self.mTextArr[indexPath.row]);
    }
    if (indexPath.row == 6) {
        NSLog(@"跳转到另一页");
    }
    
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
