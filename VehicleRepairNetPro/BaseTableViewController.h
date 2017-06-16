//
//  BaseTableViewController.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/20.
//  Copyright © 2017年 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnifiedTableViewCell.h"

@interface BaseTableViewController : UITableViewController

// TableViewController的基类 跟ViewController基类差不多 统一做的事情
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

//显示弹出提示信息
-(void)showMessage:(NSString *)message;
//网络请求失败的弹出信息
-(void)showError:(NSError *)error;

// 根据文本的内容和视图的宽度及字体来获取可变的高度
-(CGFloat)getHeightWithDetailText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

//如果没有登录，通过这个走登录界面
-(void)failureWithStatus:(NSString *)status message:(NSString *)message;

@end
