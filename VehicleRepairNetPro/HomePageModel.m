//
//  HomePageModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel

+(BOOL)propertyIsIgnored:(NSString *)propertyName {
    return YES;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    self = [super initWithDictionary:dict error:err];
    if (self) {
        _msg = dict[@"msg"];
        _status = dict[@"status"];
        _model = [[GetHomePageCenterModel alloc] initWithDictionary:dict[@"data"] error:err];
    }
    return self;
}

@end
