//
//  GetEnterpriseListDataModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "GetEnterpriseListDataInfoModel.h"

@interface GetEnterpriseListDataModel : JSONModel

//totalnum
//totalpage
//currentpage
//pageTime

@property (nonatomic, strong)NSString *totalnum;
@property (nonatomic, strong)NSString *totalpage;
@property (nonatomic, strong)NSString *currentpage;
@property (nonatomic, strong)NSString *pageTime;
@property (nonatomic, strong)NSArray *info;

-(GetEnterpriseListDataModel *)getListDataModelWithDictionary:(NSDictionary *)dictionary;

@end
