//
//  VRNETBLL+CarDoctor.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/2.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL.h"

@interface VRNETBLL (CarDoctor)

//Block:(void (^)(GetEnterpriseListModel *listModel,NSError *error))block;

+(NSURLSessionTask *)getCarDoctorModleWithParameter:(NSDictionary *)parameter Block:(void(^)(CarDoctorModel *model, NSError *error))block;

@end
