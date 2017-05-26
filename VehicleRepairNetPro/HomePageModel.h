//
//  HomePageModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "GetHomePageCenterModel.h"

@interface HomePageModel : JSONModel

@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) GetHomePageCenterModel *model;


@end
