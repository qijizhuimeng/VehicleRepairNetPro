//
//  EnterPriseEmListModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/3.
//  Copyright © 2017年 me. All rights reserved.
//

#import "EnterPriseEmListModel.h"

@implementation EnterPriseEmListModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+(NSMutableArray *)arrayEmlistModelWithEmlistArr:(NSArray *)emlistArr {
    return [EnterPriseEmListModel arrayOfModelsFromDictionaries:emlistArr error:nil];
}

@end
