//
//  ConfigUnivasal.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Tag BASE
#define BASE_KEFU_TAG 10000
#define BASE_ENTERPRISE_TAG 20000
#define BASE_HOMEPAGE_TAG 30000
#define BASE_WEIQUAN_TAG 40000
#define BASE_MY_TAG 50000

// 屏幕
#define SCREEN_WHIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ConfigUnivasal : NSObject

// 浅蓝色
extern NSString *blueColor;
// 红色
extern NSString *redColor;

// 获取颜色
UIColor *getColor(NSString *hexColor);

@end
