//
//  GetEnterpriseDetailModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/3.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "GetEnterpriseListDataInfoModel.h"

@interface GetEnterpriseDetailModel : JSONModel

@property (nonatomic, strong)NSString *status;
@property (nonatomic, strong)NSString *msg;
@property (nonatomic, strong)NSString *role;

@property (nonatomic, strong)GetEnterpriseListDataInfoModel *infoModel;

-(GetEnterpriseDetailModel *)GetEnterpriseDetailModelWithDictonary:(NSDictionary *)dictonary;

@end
