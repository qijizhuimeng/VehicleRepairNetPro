//
//  ConfigUnivasal.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
//#import "CGRectMakeCustom.h"

// Tag BASE
#define BASE_KEFU_TAG 10000 //客服
#define BASE_ENTERPRISE_TAG 20000 //企业查询
#define BASE_HOMEPAGE_TAG 30000 //主页
#define BASE_WEIQUAN_TAG 40000 //维权
#define BASE_MY_TAG 50000 //我的
#define BASE_CARDOCTOR_TAG 31000 // 车大夫
#define BASE_CARDOCTORDETAIL_TAG 31100 //车大夫二级页面

// 屏幕
#define SCREEN_WHIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SCREENHEIGHT (IS_IOS7 ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.height - 20)

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)

@interface ConfigUnivasal : NSObject

// 浅蓝色
extern NSString *blueColor;
// 红色
extern NSString *redColor;

// 获取颜色
UIColor *getColor(NSString *hexColor);

// 自定义 cgrect
CG_INLINE CGRect
CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    
    CGRect rect;

    rect.origin.x = x * myDelegate.autoSizeScaleX; rect.origin.y = y * myDelegate.autoSizeScaleY;
    
    rect.size.width = width * myDelegate.autoSizeScaleX; rect.size.height = height * myDelegate.autoSizeScaleY;
    
    return rect;
}

@end
