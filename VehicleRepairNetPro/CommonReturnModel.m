//
//  CommonReturnModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CommonReturnModel.h"

@implementation CommonReturnModel

-(instancetype)initWithAttribute:(NSDictionary *)attribute {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:attribute];
    }
    return self;
}

@end
