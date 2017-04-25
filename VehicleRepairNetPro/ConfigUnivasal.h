//
//  ConfigUnivasal.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConfigUnivasal : NSObject

// 浅蓝色
extern NSString *blueColor;
// 红色
extern NSString *redColor;

// 获取颜色
UIColor *getColor(NSString *hexColor);

@end
