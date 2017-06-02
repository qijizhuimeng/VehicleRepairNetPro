//
//  VRNETBLL+CarDoctor.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/2.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL+CarDoctor.h"

@implementation VRNETBLL (CarDoctor)

+(NSURLSessionTask *)getCarDoctorModleWithParameter:(NSDictionary *)parameter Block:(void (^)(CarDoctorModel *, NSError *))block {
    return [[AFAppDotNetApIClient shareClient] POST:getCarDoctorStructure_URL parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        CarDoctorModel *model = [[CarDoctorModel alloc] initWithDictionary:responseObject error:nil];
        block(model,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil, error);
    }];
}

@end
