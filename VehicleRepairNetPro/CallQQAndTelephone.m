//
//  CallQQAndTelephone.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/27.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CallQQAndTelephone.h"
#import "BaseViewController.h"

@implementation CallQQAndTelephone

+ (void)callQQ:(NSString *)qqNum {
    NSString *urlStr = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",qqNum];
    NSURL *url = [NSURL URLWithString:urlStr];
    if (![[UIApplication sharedApplication] openURL:url]) {
        BaseViewController *baseVC = [[BaseViewController alloc] init];
        [baseVC showMessage:@"没有找到QQ哦！"];
    }
}

@end
