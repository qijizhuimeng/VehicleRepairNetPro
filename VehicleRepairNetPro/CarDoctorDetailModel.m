//
//  CarDoctorDetailModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/14.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CarDoctorDetailModel.h"

@implementation CarDoctorDetailDataModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}


@end

@implementation CarDoctorDetailModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    self = [super initWithDictionary:dict error:err];
    if (self) {
        _status  = dict[@"status"];
        _msg = dict[@"msg"];
        _dataModel = [[CarDoctorDetailDataModel alloc] initWithDictionary:dict[@"data"] error:err];
        
    }
    return self;
}

@end
