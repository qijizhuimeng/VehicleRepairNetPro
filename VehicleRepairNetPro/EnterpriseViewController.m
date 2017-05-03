//
//  EnterpriseViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import "EnterpriseViewController.h"
#import "VRNETBLL+Enterprise.h"
#import <MJRefresh.h>

@interface EnterpriseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)GetEnterpriseListModel *listModel;
@property (nonatomic, strong)GetEnterpriseListDataInfoModel *infoModel;
@property (nonatomic, strong)NSMutableArray *mArr; // 一页的数据
@property (nonatomic, strong)MJRefreshHeader *headerRefresh; // 下拉刷新
@property (nonatomic, strong)MJRefreshFooter *footerRefresh; // 加载更多
@property (nonatomic, strong)NSString *currentPage;// 当前页

@end

@implementation EnterpriseViewController

-(void)getEnterpriseListWithCurrentPage:(NSString *)currentPage isCredible:(NSString *)isCredible isJiangsuFastRepair:(NSString *)isJiangsuFastRepair isGreenMechanics:(NSString *)isGreenMechanics isRescue:(NSString *)isRescue differential:(NSString *)differential level:(NSString *)level scope:(NSString *)scope {
    [self showProgressHUD];
    [VRNETBLL getEnterpriseListWithCurrentPage:currentPage isCredible:isCredible isJiangsuFastRepair:isJiangsuFastRepair isGreenMechanics:isGreenMechanics isRescue:isRescue differential:differential level:level scope:scope Block:^(GetEnterpriseListModel *listModel, NSError *error) {
        if (!error) {
            self.listModel = listModel;
            if ([self.listModel.status isEqualToString:@"0"]) { // 操作成功
                if ([currentPage integerValue] == 0) {
                    self.mArr = [[NSMutableArray alloc] init];
                    [self.mArr removeAllObjects];
                }
                NSArray *arr = [GetEnterpriseListDataInfoModel arrayInfoModelWithInfoArr:self.listModel.dataModel.info];
                [self.mArr addObjectsFromArray:arr];
                
                self.currentPage = [NSString stringWithFormat:@"%ld",[currentPage integerValue] + 1];
                
                if ([listModel.dataModel.totalpage integerValue] ==  [self.currentPage integerValue]) {//([listModel.dataModel.currentpage integerValue] + 1)
                    [self.tableView.mj_footer endRefreshingWithNoMoreData]; // 加载完成状态
                }else {
                    [self.tableView.mj_footer resetNoMoreData]; // 普通闲置状态
                    
                }
                
            }else {
                [self showMessage:self.listModel.msg];
            }
            [self.tableView reloadData];
        }else {
            [self showError:error];
        }
        [self hideProgressHUD];
        [self.tableView.mj_header endRefreshing];
    }];
}

-(void)viewWillAppear:(BOOL)animated {

    NSLog(@"view将要出现");
    [self requestLoadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"企业查询";
    self.currentPage = @"0";
    [self createRightButtonItem];
    [self createTableView];
    [self createRefresh];
}

-(void)customTableFooterView {
//    self.tableView.mj_footer
}

-(void)createRefresh {
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestLoadData];
    }];
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getEnterpriseListWithCurrentPage:self.currentPage isCredible:@"false" isJiangsuFastRepair:@"false" isGreenMechanics:@"false" isRescue:@"false" differential:@"" level:@"" scope:@""];
    }];

    
}



// 请求数据
-(void)requestLoadData{
    [self getEnterpriseListWithCurrentPage:@"0" isCredible:@"false" isJiangsuFastRepair:@"false" isGreenMechanics:@"false" isRescue:@"false" differential:@"" level:@"" scope:@""];
}

// 创建Table
-(void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64 - 54) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

// 穿件搜索的buttonItem
-(void)createRightButtonItem {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 20, 20);                                
    [rightButton setImage:[UIImage imageNamed:@"searchImage"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark UItableView 的代理方法

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"本地数据，第%ld行",indexPath.row];
    GetEnterpriseListDataInfoModel *infoModel = self.mArr[indexPath.row];
    cell.textLabel.text = infoModel.name;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了第%ld行",indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
