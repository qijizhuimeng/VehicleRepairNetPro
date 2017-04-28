//
//  AFAppDotNetApIClient.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import "AFAppDotNetApIClient.h"

// 服务器地址
static NSString *const AFAppDotNetAPIBaseURLStrig = BASE_URL;

@implementation AFAppDotNetApIClient

+(instancetype)shareClient {
    static AFAppDotNetApIClient *shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareClient = [[AFAppDotNetApIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLStrig]];
        shareClient.requestSerializer = [AFJSONRequestSerializer serializer];
        [shareClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
    });
    return shareClient;
}

@end
