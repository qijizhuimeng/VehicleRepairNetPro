//
//  ConfigUnivasal.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
