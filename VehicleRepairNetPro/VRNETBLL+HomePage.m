//
//  VRNETBLL+HomePage.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL+HomePage.h"

@implementation VRNETBLL (HomePage)

+(NSURLSessionTask *)getHomePageModelBlock:(void (^)(HomePageModel *, NSError *))block {
    NSString *url = getHomePage_URL;
    return [[AFAppDotNetApIClient shareClient] POST:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HomePageModel *model = [[HomePageModel alloc] initWithDictionary:responseObject error:nil];
        block(model,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil, error);
    }];
}

@end
