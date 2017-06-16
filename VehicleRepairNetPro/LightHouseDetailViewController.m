//
//  LightHouseDetailViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/14.
//  Copyright © 2017年 me. All rights reserved.
//

#import "LightHouseDetailViewController.h"
#import "VRNETBLL+CarDoctor.h"

@interface LightHouseDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong)UIView *topView; // top 背景视图
@property (nonatomic, strong)UILabel *titleLabel; // 标题
@property (nonatomic, strong)UILabel *promulgatorLabel; // 发布者
@property (nonatomic, strong)UILabel *timeLabel; // 发布时间
@property (nonatomic, strong)UIView *lineView; // 线
@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, strong)CarDoctorDetailDataModel *dataModel;

@end

@implementation LightHouseDetailViewController

-(void)loadRequest:(NSString *)Id {
    [self showProgressHUD];
    [VRNETBLL getCarDoctorDetailWithId:Id Block:^(CarDoctorDetailModel *model, NSError *err) {
        if (!err) {
            if ([model.status isEqualToString:@"0"]) {
                self.dataModel = model.dataModel;
                self.navigationItem.title = self.dataModel.columnName;
                [self makeTopView];
                [self makeWebView];
            }else {
                [self showMessage:model.msg];
            }
        }else {
            [self showError:err];
        }
        [self hideProgressHUD];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = getColor(@"ffffff");
    [self loadRequest:self.Id];
}

-(void)makeWebView {
    _webView = [[UIWebView alloc] init];
    _webView.delegate = self;
    _webView.backgroundColor = getColor(@"ffffff");
    _webView.scalesPageToFit = YES;
    [_webView loadHTMLString:self.dataModel.artContent baseURL:nil];
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view);
    }];
}

-(void)makeTopView {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = self.dataModel.artTitle;//@"标题";
    [self.view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(20);
    }];
    
    _promulgatorLabel = [[UILabel alloc] init];
    _promulgatorLabel.text = [NSString stringWithFormat:@"发布者：%@",self.dataModel.realName];//@"发布者";
//    _promulgatorLabel.backgroundColor = [UIColor orangeColor];
    _promulgatorLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_promulgatorLabel];
    [_promulgatorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.width.mas_equalTo((SCREEN_WHIDTH - 20) / 2);
        make.height.mas_equalTo(20);
    }];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.text = self.dataModel.createTime; //@"发布时间";
    _timeLabel.font = [UIFont systemFontOfSize:13];
//    _timeLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(20);
    }];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = getColor(@"f2f2f2");
    [self.view addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(1);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    //修改服务器页面的meta的值
    NSString *meta = [NSString stringWithFormat:@"document.getElementsByName(\"viewport\")[0].content = \"width=%f, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\"", webView.frame.size.width];
    [webView stringByEvaluatingJavaScriptFromString:meta];
    
    //    //给网页增加utf-8编码
    [webView stringByEvaluatingJavaScriptFromString:
     @"var tagHead =document.documentElement.firstChild;"
     "var tagMeta = document.createElement(\"meta\");"
     "tagMeta.setAttribute(\"http-equiv\", \"Content-Type\");"
     "tagMeta.setAttribute(\"content\", \"text/html; charset=utf-8\");"
     "var tagHeadAdd = tagHead.appendChild(tagMeta);"];
    
        //给网页增加css样式
        [webView stringByEvaluatingJavaScriptFromString:
         @"var tagHead =document.documentElement.firstChild;"
         "var tagStyle = document.createElement(\"style\");"
         "tagStyle.setAttribute(\"type\", \"text/css\");"
         "tagStyle.appendChild(document.createTextNode(\"BODY{padding: 20pt 15pt}\"));"
         "var tagHeadAdd = tagHead.appendChild(tagStyle);"];
    
    CGFloat width = SCREEN_WHIDTH;
    
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:
                                                      @"var script = document.createElement('script');"
                                                      "script.type = 'text/javascript';"
                                                      "script.text = \"function ResizeImages() { "
                                                      "var myimg,oldwidth;"
                                                      "var maxwidth=%f;" //缩放系数
                                                      "for(i=0;i <document.images.length;i++){"
                                                      "myimg = document.images[i];"
                                                      "if(myimg.width > maxwidth){"
                                                      "oldwidth = myimg.width;"
                                                      "myimg.height = myimg.height * (maxwidth/oldwidth);"
                                                      "myimg.width = maxwidth;"
                                                      "}"
                                                      "}"
                                                      "}\";"
                                            "document.getElementsByTagName('head')[0].appendChild(script);",width - 16]];
    //
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
    
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
