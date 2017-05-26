//
//  GetHomePageCenterModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import "GetHomePageCenterModel.h"

@implementation GetHomePageCenterModel

+(BOOL)propertyIsIgnored:(NSString *)propertyName {
    return YES;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    self = [super initWithDictionary:dict error:err];
    if (self) {
        _carouselInfolist = [GetCarouselInfoListModel arrayOfModelsFromDictionaries:dict[@"carouselInfoList"] error:err];
        _brandInfoList = [GetBrandInfoListModel arrayOfModelsFromDictionaries:dict[@"brandInfoList"] error:err];
        _entepriseInfoList = [GetEnterpriseInfoList arrayOfModelsFromDictionaries:dict[@"enterpriseInfoList"] error:err];
    }
    return self;
}

@end
