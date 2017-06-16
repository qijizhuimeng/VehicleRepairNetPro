//
//  CommonFaultsViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/13.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CommonFaultsViewController.h"
#import "VRNETBLL+CarDoctor.h"
#import <MJRefresh.h>
#import "LightHouseDetailViewController.h"

@interface CommonFaultsViewController ()

@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic ,strong)NSString *currentPage;
@property (nonatomic, strong)CarDoctorModel *model;
@property (nonatomic, strong)NSString *type;

@end

@implementation CommonFaultsViewController

-(void)requestLoadDataWithCurrentPage:(NSString *)currentPage {
    NSDictionary *parameter = @{
                                @"type":self.type,//@"5",
                                @"currentNum":@"10",
                                @"currentPage":currentPage
                                };
    [self showProgressHUD];
    [VRNETBLL getCarDoctorModleWithParameter:parameter Block:^(CarDoctorModel *model, NSError *error) {
        if (!error) {
            if ([model.status isEqualToString:@"0"]) {
                self.model = model;
                if ([currentPage isEqualToString:@"0"]) {
                    [self.dataArr removeAllObjects];
                }
                [self.dataArr addObjectsFromArray:model.dataModel.infoArr];
                
                self.currentPage = [NSString stringWithFormat:@"%ld",[currentPage integerValue] + 1];
                
                if ([self.currentPage integerValue] == [self.model.dataModel.totalpage integerValue]) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }else {
                    [self.tableView.mj_footer resetNoMoreData]; // 普通闲置状态
                }
                
            }else {
                [self showMessage:model.msg];
            }
            [self.tableView reloadData];
        }else {
            [self showError:error];
        }
        [self hideProgressHUD];
        [self.tableView.mj_header endRefreshing];
    }];
}

-(NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    switch (self.columnType) {
        case CommonFaults:
            self.type = @"5";
            break;
        case Commonsense:
            self.type = @"6";
            break;
            
        default:
            break;
    }
    
    [self requestLoadDataWithCurrentPage:@"0"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"常见故障";
    
    [self makeRefresh];
}


-(void)makeRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestLoadDataWithCurrentPage:@"0"];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestLoadDataWithCurrentPage:self.currentPage];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CommonFaultsID";
    UnifiedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UnifiedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CarDoctorInfoModel *infoModel = self.dataArr[indexPath.row];
    cell.titleLabel.text = infoModel.artTitle;  ;
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LightHouseDetailViewController *vc = [[LightHouseDetailViewController alloc] init];
    
    CarDoctorInfoModel *infoModel = self.dataArr[indexPath.row];
    
    vc.Id = infoModel.id;
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
