//
//  VRNETBLL.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL.h"


@implementation VRNETBLL

+(NSURLSessionDataTask *)returnCommonResultMOdelHttpRequestWithParameters:(NSDictionary *)parameters POST:(NSString *)url resultBlock:(void (^)(CommonReturnModel *, NSError *))block {
    return [[AFAppDotNetApIClient shareClient] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
