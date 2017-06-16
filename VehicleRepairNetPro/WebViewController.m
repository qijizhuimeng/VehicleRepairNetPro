//
//  WebViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/5.
//  Copyright © 2017年 me. All rights reserved.
//

#import "WebViewController.h"
#import "VRNETBLL+CarDoctor.m"

@interface WebViewController ()

@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong) CarDoctorModel *carDoctorModel;

@end

@implementation WebViewController

-(void)requestCarCoctorStructureWithParameter:(NSDictionary *)parameter {
    [VRNETBLL getCarDoctorModleWithParameter:parameter Block:^(CarDoctorModel *model, NSError *error) {
        if (!error) {
            if ([model.status isEqualToString:SUCCESS_STATUS]) {
                self.carDoctorModel = model;
                CarDoctorInfoModel *infoModel = self.carDoctorModel.dataModel.infoArr[0];
                [self.webView loadHTMLString:infoModel.artContent baseURL:nil];
//                NSLog(@"%@",infoModel.artContent);
            }else {
                [self showMessage:model.msg];
            }
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64)];
    _webView.scalesPageToFit = YES;
    
    [self.view addSubview:_webView];
    
    switch (_webViewType) {
        case WebViewTypeUserProtocol:
            self.navigationItem.title = @"用户协议";
            break;
        case WebViewTypeManageWay:
            self.navigationItem.title = @"管理方法";
            self.type = @"24";
            break;
        case WebViewTypePrevent:
            self.navigationItem.title = @"组织结构";
            self.type = @"23";
            break;
        case WebViewTypeServeRules:
            self.navigationItem.title = @"服务章程";
            self.type = @"25";
            break;
        case WebViewTypePleasantNotice:
            self.navigationItem.title = @"实体店关联";
//            self.type = @"26";
            
            return;
        default:
            break;
    }
    _webView.backgroundColor = getColor(@"f2f2f2");
    NSDictionary *parameter = @{
                                @"type":self.type,
                                @"currentNum":@"10",
                                @"currentPage":@"0"
                                };
    [self requestCarCoctorStructureWithParameter:parameter];
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
