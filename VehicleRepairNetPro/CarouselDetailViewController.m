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
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createWebView];
}

-(void)getAppLinkWithUrl:(NSString *)url {
    self.appLinkUrl = url;
}

-(void)createWebView {
    [self.view addSubview:self.webView];
    _webView.backgroundColor = [UIColor orangeColor];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.appLinkUrl]]];
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
