//
//  CarDoctorModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/2.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CarDoctorModel.h"

@implementation CarDoctorInfoModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation CarDoctorDataModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    self = [super initWithDictionary:dict error:err];
    if (self) {
        _totalnum = dict[@"totalnum"];
        _totalpage = dict[@"totalpage"];
        _currentpage = dict[@"currentpage"];
        _pageTime = dict[@"pageTime"];
        
        _infoArr = [CarDoctorInfoModel arrayOfModelsFromDictionaries:dict[@"info"] error:err];
    }
    return self;
}

@end

@implementation CarDoctorModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    self = [super initWithDictionary:dict error:err];
    if (self) {
        _status = dict[@"status"];
        _msg = dict[@"msg"];
        _dataModel = [[CarDoctorDataModel alloc] initWithDictionary:dict[@"data"] error:err];
    }
    
    return self;
}

@end



