//
//  GetEnterpriseListModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import "GetEnterpriseListModel.h"

@implementation GetEnterpriseListModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

-(GetEnterpriseListModel *)getListModelWithDictionary:(NSDictionary *)dictionary error:(NSError *)error {
    self.status = [dictionary objectForKey:@"status"];
    self.msg = [dictionary objectForKey:@"msg"];
    self.dataModel = [[GetEnterpriseListDataModel alloc] getListDataModelWithDictionary:dictionary];
    return self;//[[GetEnterpriseListModel alloc] initWithDictionary:dictionary error:&error];
}

@end
