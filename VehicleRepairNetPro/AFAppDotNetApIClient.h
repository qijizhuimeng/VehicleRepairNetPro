//
//  AFAppDotNetApIClient.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFAppDotNetApIClient : AFHTTPSessionManager

+(instancetype)shareClient;

@end
