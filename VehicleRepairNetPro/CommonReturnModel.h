//
//  CommonReturnModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CommonReturnModel : JSONModel

@property (nonatomic, strong, readonly) NSString *status;

@property (nonatomic, strong, readonly) NSString *msg;

-(instancetype)initWithAttribute:(NSDictionary *)attribute;

@end
