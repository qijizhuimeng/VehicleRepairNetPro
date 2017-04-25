//
//  BaseViewController.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/20.
//  Copyright © 2017年 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

// 这个类里边要统一做的事情
/**
 1、 风格保持一致的navigationBar ，及相关的属性
 2、 要显示大菊花，隐藏大菊花
 3、 检测一下网络是否正常
 4、 要设置统一的弹出框
 */

// 显示大菊花
-(void)showProgressHUD;
// 隐藏大菊花
-(void)hideProgressHUD;

@end
