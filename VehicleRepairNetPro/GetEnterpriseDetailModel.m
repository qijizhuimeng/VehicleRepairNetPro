//
//  GetEnterpriseDetailModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/3.
//  Copyright © 2017年 me. All rights reserved.
//

#import "GetEnterpriseDetailModel.h"

@implementation GetEnterpriseDetailModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

-(GetEnterpriseDetailModel *)GetEnterpriseDetailModelWithDictonary:(NSDictionary *)dictonary {
    
    self.status = dictonary[@"status"];
    self.msg = dictonary[@"msg"];
    self.role = dictonary[@"role"];
    
    self.infoModel = [[GetEnterpriseListDataInfoModel alloc] initWithDictionary:dictonary[@"data"] error:nil];
    
    
    return self;
}

@end
