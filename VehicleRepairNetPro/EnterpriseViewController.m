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
#import "EnterpriseDetailViewController.h"
#import "CompanyQueryView.h"

@interface EnterpriseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)GetEnterpriseListModel *listModel;
@property (nonatomic, strong)GetEnterpriseListDataInfoModel *infoModel;
@property (nonatomic, strong)NSMutableArray *mArr; // 一页的数据
@property (nonatomic, strong)MJRefreshHeader *headerRefresh; // 下拉刷新
@property (nonatomic, strong)MJRefreshFooter *footerRefresh; // 加载更多
@property (nonatomic, strong)NSString *currentPage;// 当前页
@property (nonatomic, strong)CompanyQueryView *companyQueryView; // 侧边栏视图

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
                [self.tableView reloadData];
                
                self.currentPage = [NSString stringWithFormat:@"%ld",[currentPage integerValue] + 1];
                
                if ([listModel.dataModel.totalpage integerValue] ==  [self.currentPage integerValue]) {//([listModel.dataModel.currentpage integerValue] + 1)
                    [self.tableView.mj_footer endRefreshingWithNoMoreData]; // 加载完成状态
                }else {
                    [self.tableView.mj_footer resetNoMoreData]; // 普通闲置状态
                }
                
            }else {
                [self showMessage:self.listModel.msg];
            }
            
        }else {
            [self showError:error];
        }
        [self hideProgressHUD];
        [self.tableView.mj_header endRefreshing];
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"view将要出现");
    [self requestLoadData];
}

-(CompanyQueryView *)companyQueryView {
    if (!_companyQueryView) {
        _companyQueryView = [_companyQueryView initWithView:self.view];
//        _companyQueryView.frame = CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT);
    }
    return _companyQueryView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"企业查询";
    self.currentPage = @"0";
    [self createRightButtonItem];
    [self.view addSubview:self.companyQueryView];
    [self createTableView];
    [self createRefresh];
    
}

-(void)customTableFooterView {
//    self.tableView.mj_footer
    
}

#pragma mark 下拉刷新、上拉加载
-(void)createRefresh {
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestLoadData];
    }];
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getEnterpriseListWithCurrentPage:self.currentPage isCredible:@"false" isJiangsuFastRepair:@"false" isGreenMechanics:@"false" isRescue:@"false" differential:@"" level:@"" scope:@""];
    }];
}


#pragma  mark 企业查询列表网络请求
-(void)requestLoadData{
    [self getEnterpriseListWithCurrentPage:@"0" isCredible:@"false" isJiangsuFastRepair:@"false" isGreenMechanics:@"false" isRescue:@"false" differential:@"" level:@"" scope:@""];
}

#pragma mark 创建TableView
-(void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64 - 54) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark 搜索的buttonItem
-(void)createRightButtonItem {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(0, 0, 20, 20);                                
    [rightButton setImage:[UIImage imageNamed:@"searchImage"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)searchClick:(UIButton *)sender {

    if (self.companyQueryView.hidden) {
        [self.companyQueryView showSearchView];
        NSLog(@"企业查询按钮");
    }
    
}

#pragma mark 返回UITableViewCell 的代理方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"本地数据，第%ld行",indexPath.row];
    GetEnterpriseListDataInfoModel *infoModel = self.mArr[indexPath.row];
    cell.textLabel.text = infoModel.name;
    return cell;
}

#pragma mark 返回UITableViewCell 行数 的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mArr.count;
}

#pragma mark 选中UITableViewCell 的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了第%ld行",indexPath.row);
    GetEnterpriseListDataInfoModel *infoModel = self.mArr[indexPath.row];
    EnterpriseDetailViewController *detailVC = [[EnterpriseDetailViewController alloc] init];
    detailVC.enterpriseId = infoModel.id;
    detailVC.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark 返回UITableViewCell 高度的代理方法
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
