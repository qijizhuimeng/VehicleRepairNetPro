//
//  UserModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/16.
//  Copyright © 2017年 me. All rights reserved.
//

#import "UserModel.h"

#define KEY_ROLE @"role"
#define KEY_USERNSME @"userName"
#define KEY_PASSWORD @"password"

@implementation UserModel

// 严格的单利
static UserModel *userModel = nil;
+(instancetype)shareInstanced {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userModel = [[UserModel alloc] init];
    });
    return userModel;
}

// 确保实例唯一
-(instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

-(NSString *)role {
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{KEY_ROLE:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_ROLE];
}
-(void)setRole:(NSString *)role {
    if (!role) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:KEY_ROLE];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:role forKey:KEY_ROLE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{KEY_USERNSME:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_USERNSME];
}
-(void)setUserName:(NSString *)userName {
    if (!userName) {
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:KEY_USERNSME];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:KEY_USERNSME];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)password {
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{KEY_PASSWORD:@""}];
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_PASSWORD];
}
-(void)setPassword:(NSString *)password {
    if (!password) {
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:KEY_PASSWORD];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:KEY_PASSWORD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
