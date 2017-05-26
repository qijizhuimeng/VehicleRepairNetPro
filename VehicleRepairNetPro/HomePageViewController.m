//
//  HomePageViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import "HomePageViewController.h"
#import <MJRefresh.h>
#import <SDCycleScrollView.h>
#import <UIImageView+WebCache.h>
#import "AccessoriesCollectionViewCell.h"
#import "VRNETBLL+HomePage.h"
#import "CarouselDetailViewController.h"

#define collectionViewCellId @"collectionViewCellID"
#define collectionViewHeaderId @"collectionViewHeaderId"

// 将button和label 上下整合到一起
@interface CustomButton : UIButton

@property(nonatomic, strong)UILabel *textLabel;
@property(nonatomic, strong)UIImageView *imageView1;

@end
@implementation CustomButton

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (!_imageView1) {
            _imageView1 = [[UIImageView alloc] init];
            [self addSubview:_imageView1];
            
            [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.centerX.equalTo(self);
                make.width.equalTo(self);
                make.height.mas_equalTo(self.mas_width);
            }];
        }
        
        if (!_textLabel) {
            _textLabel = [[UILabel alloc] init];
            _textLabel.font = [UIFont systemFontOfSize:11.0];
            [self addSubview:_textLabel];
            
            [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imageView1.mas_bottom).offset(8);
                make.centerX.equalTo(self);
                make.width.equalTo(self);
            }];
        }
    }
    return self;
}

@end

@interface HomePageViewController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong)UIScrollView *scrollView;
@property (nonatomic, strong) UIView *backgroundTopView;  //上部背景
@property (nonatomic, strong) UIView *backgroundCenterView;  //中部背景
@property (nonatomic, strong) UIView *backgroundBottomView;  //下部背景
@property (nonatomic, strong) SDCycleScrollView *sdcScrollView; //轮播图
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) HomePageModel *dataModel;
@property (nonatomic, strong) NSMutableArray *carouselMarr;// 轮播图数组
@property (nonatomic, strong) NSMutableArray *enterpriseMarr; // 企业数组
@property (nonatomic, strong) NSMutableArray *brandMarr; // 配件数组

@end

@implementation HomePageViewController

-(void)requestGetHomePage {
    [self showProgressHUD];
    [VRNETBLL getHomePageModelBlock:^(HomePageModel *model, NSError *error) {
        if (!error) {
            self.dataModel = model;
            if ([model.status isEqualToString:@"0"]) {
                _carouselMarr = [NSMutableArray arrayWithArray:model.model.carouselInfolist];
                _enterpriseMarr = [NSMutableArray arrayWithArray:model.model.entepriseInfoList];
                _brandMarr = [NSMutableArray arrayWithArray:model.model.brandInfoList];
                [_collectionView reloadData];
            }else {
                [self showMessage:model.msg];
            }
        }else {
            [self showError:error];
        }
        [_collectionView.mj_header endRefreshing];
    }];
    [self hideProgressHUD];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestGetHomePage];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    
    [self onlyCollectionView];
    [self createRefresh];
}

-(void)onlyCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WHIDTH, 500);
    flowLayout.itemSize =CGSizeMake((SCREEN_WHIDTH - 16) / 2, (SCREEN_WHIDTH - 16) / 2);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64 - 49) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = getColor(@"f2f2f2"); //[UIColor orangeColor];
    
    [_collectionView registerClass:[AccessoriesCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellId];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeaderId"];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
}

-(void)createRefresh {
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestGetHomePage];
    }];
}

-(void)makeBackgroundView {
    _backgroundTopView = [[UIView alloc] init];
    _backgroundTopView.backgroundColor = [UIColor whiteColor]; //getColor(@"f2f2f2");
    [_scrollView addSubview:_backgroundTopView];
    
    _backgroundCenterView = [[UIView alloc] init];
    _backgroundCenterView.backgroundColor = getColor(@"f2f2f2");
    [_scrollView addSubview:_backgroundCenterView];
    
    _backgroundBottomView = [[UIView alloc] init];
    _backgroundBottomView.backgroundColor = getColor(@"f2f2f2");
    [_scrollView addSubview:_backgroundBottomView];
}


// scrollView
-(void)makeScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64 -49)];
    _scrollView.backgroundColor = getColor(@"f2f2f2");
    _scrollView.contentSize = CGSizeMake(SCREEN_WHIDTH, SCREEN_HEIGHT);
    _scrollView.bounces = YES;
    
    [self.view addSubview:_scrollView];
}

//SDScrollCycleView and ItemBtn 轮播图和专栏按钮
-(void)makeSDCyleScrollAndItemBtn {
    self.sdcScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake1(0, 0, 375, 160) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    NSMutableArray *imageMarr = [[NSMutableArray alloc] init];
    
    for (GetCarouselInfoListModel *carouselModel in _carouselMarr) {
        [imageMarr addObject:carouselModel.imgPath];
    }
    
    [_backgroundTopView addSubview:_sdcScrollView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _sdcScrollView.imageURLStringsGroup = imageMarr;
    });
    
    __weak typeof (self) weakSelf = self;
    _sdcScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        GetCarouselInfoListModel *carouselModel = weakSelf.carouselMarr[currentIndex];
        NSLog(@"轮播图index %ld",currentIndex);
        CarouselDetailViewController *detailVC = [[CarouselDetailViewController alloc] init];
        [detailVC getAppLinkWithUrl:carouselModel.applink];
        
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
        detailVC.hidesBottomBarWhenPushed = YES;
    };
    
    // itemBtn
    NSArray *titleArr = @[@"车大夫专栏",@"预约维修",@"最新资讯",@"曝光台"];
    NSArray *backImgArr = @[@"home_btn_icon0",@"home_btn_icon1",@"home_btn_icon2",@"home_btn_icon3"];
    for (int i = 0; i < 4 ; i ++) {
        CustomButton *cutomBtn = [[CustomButton alloc] initWithFrame:CGRectMake1(20 + ((320 - 100) / 4 + 20) * i , 160 + 10,(320 - 100) / 4 , (320 - 100) / 4 + 10)];
        cutomBtn.tag = BASE_HOMEPAGE_TAG + i;
        cutomBtn.imageView1.image = [UIImage imageNamed:backImgArr[i]];
        cutomBtn.textLabel.text = titleArr[i];
        cutomBtn.textLabel.textAlignment = NSTextAlignmentCenter;
        [cutomBtn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
         [_backgroundTopView addSubview:cutomBtn];
    }
}

-(void)itemBtnClick:(UIButton *)sender {
    switch (sender.tag) {
        case BASE_HOMEPAGE_TAG:
            NSLog(@"车大夫专栏");
            break;
        case BASE_HOMEPAGE_TAG + 1:
            NSLog(@"预约维修");
            break;
        case BASE_HOMEPAGE_TAG + 2:
            NSLog(@"最新资讯");
            break;
        case BASE_HOMEPAGE_TAG + 3:
            NSLog(@"曝光台");
            break;
        default:
            break;
    }
}

// 企业之窗
-(void)makeEnterpriseWindow {
    UILabel *enterpriseWindowLab = [[UILabel alloc] init];
    enterpriseWindowLab.text = @"企业之窗";
    enterpriseWindowLab.font = [UIFont systemFontOfSize:15];
    [_backgroundCenterView addSubview:enterpriseWindowLab];
    [enterpriseWindowLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backgroundCenterView).offset(8);
        make.top.equalTo(_backgroundCenterView).offset(10);
        make.height.mas_equalTo(20);
    }];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [_backgroundCenterView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backgroundCenterView);
        make.top.equalTo(enterpriseWindowLab.mas_bottom).offset(10);
        make.width.equalTo(_backgroundCenterView);
        make.bottom.equalTo(_backgroundCenterView);
    }];
    
    for (int i = 0; i < _enterpriseMarr.count; i ++) {
        GetEnterpriseInfoList *enterpriseModel = _enterpriseMarr[i];
        CustomButton *enterpriseCBtn = [[CustomButton alloc] initWithFrame:CGRectMake(10 + ((SCREEN_WHIDTH -  50) / 4 + 10) * i , 10, (SCREEN_WHIDTH -  50) / 4, (SCREEN_WHIDTH -  50) / 4)];
        [enterpriseCBtn.imageView1 sd_setImageWithURL:[NSURL URLWithString:enterpriseModel.img]];
        enterpriseCBtn.textLabel.text = enterpriseModel.name;
        enterpriseCBtn.textLabel.font = [UIFont systemFontOfSize:13];
        [view addSubview:enterpriseCBtn];
    }
}

//配件购买
-(void)makeAccessoriesBuy {
    UILabel *accessoriesLab = [[UILabel alloc] init];
    accessoriesLab.text = @"配件购买";
    accessoriesLab.font = [UIFont systemFontOfSize:15];
    [_backgroundBottomView addSubview:accessoriesLab];
    [accessoriesLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backgroundBottomView).offset(10);
        make.left.equalTo(_backgroundBottomView).offset(8);
        make.height.mas_equalTo(20);
    }];
    
    UIButton *moreBtn = [[UIButton alloc] init];
    [moreBtn setTitle:@"查看更多>>" forState:UIControlStateNormal];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [moreBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    moreBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_backgroundBottomView addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backgroundBottomView).offset(10);
        make.right.equalTo(_backgroundBottomView).offset(-8);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
}
-(void)moreBtnClick:(id)sender {
    NSLog(@"查看更多");
}

// 设置Frame
-(void)setFrameWithView {
    [_backgroundTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WHIDTH);
        make.height.mas_equalTo(160 + 140);
    }];
    
    [_backgroundCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundTopView.mas_bottom);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WHIDTH);
        make.height.mas_equalTo(160);
    }];
    
    [_backgroundBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundCenterView.mas_bottom);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(SCREEN_WHIDTH);
        make.height.mas_equalTo(36);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// -------------------------------------------------------uicolleview 的相关协议方法
// 返回的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _brandMarr.count;
}

//item垂直之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

//item 水平之前的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AccessoriesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
    
    GetBrandInfoListModel *brandModel = _brandMarr[indexPath.row];
    
    [cell.carIcon sd_setImageWithURL:[NSURL URLWithString:brandModel.imgPath]];
    cell.carName.text = brandModel.name;
    
    return cell;
}

// collectionView 的头视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionViewHeaderId forIndexPath:indexPath];
    reusableView.backgroundColor = getColor(@"f2f2f2");//[UIColor redColor];
    
    _backgroundTopView = [[UIView alloc] init];
    _backgroundTopView.backgroundColor = [UIColor whiteColor];
    [reusableView addSubview:_backgroundTopView];

    _backgroundCenterView = [[UIView alloc] init];
    _backgroundCenterView.backgroundColor = getColor(@"f2f2f2");
    [reusableView addSubview:_backgroundCenterView];
    
    _backgroundBottomView = [[UIView alloc] init];
    _backgroundBottomView.backgroundColor = getColor(@"f2f2f2");
    [reusableView addSubview:_backgroundBottomView];
    [self setFrameWithView];

    [self makeSDCyleScrollAndItemBtn];
    [self makeEnterpriseWindow];
    [self makeAccessoriesBuy];
    return reusableView;
}

// 点击方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"currentIndexPath:%ld",indexPath.row);
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
