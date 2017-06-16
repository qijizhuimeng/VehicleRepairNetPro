//
//  VRNETBLL+CarDoctor.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/2.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL.h"

@interface VRNETBLL (CarDoctor)

// 获取常识问题Model 常见故障 车大夫介绍
+(NSURLSessionTask *)getCarDoctorModleWithParameter:(NSDictionary *)parameter Block:(void(^)(CarDoctorModel *model, NSError *error))block;

// 获取常识问题Model 常见故障 车大夫介绍
+(NSURLSessionTask *)getCommonFaultsModelWithType:(NSString *)type currentNum:(NSString *)currentNum currentPage:(NSString *)currentPage Block:(void(^)(CommonFaultsModel *model,NSError *error))block;

// 列表选中一行详情
+(NSURLSessionTask *)getCarDoctorDetailWithId:(NSString *)Id Block:(void(^)(CarDoctorDetailModel *model,NSError *err))block;

@end
