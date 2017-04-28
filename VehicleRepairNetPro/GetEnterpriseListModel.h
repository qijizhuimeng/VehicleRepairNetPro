//
//  GetEnterpriseListModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "GetEnterpriseListDataModel.h"

@interface GetEnterpriseListModel : JSONModel

@property (nonatomic, strong, readonly) NSString *status;
@property (nonatomic, strong, readonly) NSString *msg;
@property (nonatomic, strong) GetEnterpriseListDataModel *dateaModel;


@end
