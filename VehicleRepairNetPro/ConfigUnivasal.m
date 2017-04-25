//
//  ConfigUnivasal.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/21.
//  Copyright © 2017年 me. All rights reserved.
//

#import "ConfigUnivasal.h"

@implementation ConfigUnivasal

/**
 *  文字\按钮 浅浅蓝
 */
NSString *blueColor = @"339dd3";
/**
 *  文字\按钮 红色
 */
NSString *redColor = @"f71f21";

UIColor *getColor(NSString *hexColor) {
    
    unsigned int red, green, blue;
    
    NSRange range = NSMakeRange(0, 2);
//    range.length = 2;
    
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    UIColor *color = [[UIColor alloc] initWithRed:(float)(red / 255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0];
    
    return color;
}


@end
