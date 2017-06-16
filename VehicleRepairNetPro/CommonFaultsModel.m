//
//  CommonFaultsModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/13.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CommonFaultsModel.h"

@implementation CommonFaultsModel

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    self = [super initWithDictionary:dict error:err];
    if (self) {
        _status = dict[@"status"];
        _msg = dict[@"msg"];
        _dataModel = [[CommonFaultsDataModel alloc] initWithDictionary:dict[@"data"] error:err];
        
    }
    return self;
}

@end

@implementation CommonFaultsDataModel

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    self = [super initWithDictionary:dict error:err];
    if (self) {
        _totalnum = dict[@"_otalnum"];
        _totalpage = dict[@"totalpage"];
        _currentpage = dict[@"currentpage"];
        _pageTime = dict[@"pageTime"];
        _infoArr = [CommonFaultsInfoModel arrayOfModelsFromDictionaries:dict[@"info"] error:err];
    }
    return self;
}

@end

@implementation CommonFaultsInfoModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
