//
//  GetEnterpriseListDataModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import "GetEnterpriseListDataModel.h"

@implementation GetEnterpriseListDataModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

-(GetEnterpriseListDataModel *)getListDataModelWithDictionary:(NSDictionary *)dictionary {
    self.totalnum = [[dictionary objectForKey:@"data"] objectForKey:@"totalnum"];
    self.totalpage = [[dictionary objectForKey:@"data"] objectForKey:@"totalpage"];
    self.currentpage = [[dictionary objectForKey:@"data"] objectForKey:@"currentpage"];
    self.pageTime = [[dictionary objectForKey:@"data"] objectForKey:@"pageTime"];
    self.info = [[dictionary objectForKey:@"data"] objectForKey:@"info"];
    
    return self;
}

@end
