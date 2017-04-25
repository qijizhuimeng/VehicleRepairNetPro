//
//  ViewController.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/20.
//  Copyright © 2017年 me. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"测试";
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [testBtn setTitle:@"跳转" forState:UIControlStateNormal];
    testBtn.backgroundColor = [UIColor redColor];
    testBtn.frame = CGRectMake(64 + 40, 64 + 40, 50, 30);
    [testBtn addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}

-(void)testClick:(UIButton *)sender {
    BaseViewController *baseVC = [[BaseViewController alloc] init];
//    [self.navigationController pushViewController:baseVC animated:YES];
    [self.navigationController presentViewController:baseVC animated:YES completion:^{
//
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
