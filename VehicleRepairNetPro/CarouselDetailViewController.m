//
//  CarouselDetailViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CarouselDetailViewController.h"

@interface CarouselDetailViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation CarouselDetailViewController

-(UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64)];
        _webView.backgroundColor = getColor(@"f2f2f2");
        _webView.scalesPageToFit = YES;
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.appLinkUrl]]];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createWebView];
}

-(void)getPassCarouselInfoListModel:(GetCarouselInfoListModel *)model {
    NSMutableString *mApplinkUrl = [[NSMutableString alloc] init];
    NSString *appLinkUrl = model.applink;
    for (int i = 0; i < appLinkUrl.length; i ++) {
        NSString *temp = [appLinkUrl substringWithRange:NSMakeRange(i, 1)];
        if (![temp isEqualToString:@" "]) {
            [mApplinkUrl appendFormat:@"%@",temp];
        }
    }
    self.appLinkUrl = mApplinkUrl;
    self.navigationItem.title = model.title;
}

-(void)createWebView {
    [self.view addSubview:self.webView];
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
