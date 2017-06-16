//
//  UserModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/16.
//  Copyright © 2017年 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

// 单例模式的UserModel
/*
 * 创建单例
 *
 */
+(instancetype)shareInstanced;

// 身份状态 1 是车大夫 0不是车大夫
/*
 * 是否车大夫身份
 *
 */
@property (nonatomic, strong)NSString *role;

/*
 * 账号
 *
 */
@property (nonatomic, strong)NSString *userName;

/*
 * 密码
 *
 */
@property (nonatomic, strong)NSString *password;


@end
