//
//  VRNETBLL+Enterprise.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL.h"

@interface VRNETBLL (Enterprise)

// 获取企业查询列表
+(NSURLSessionTask *)getEnterpriseListWithCurrentPage:(NSString *)currentPage isCredible:(NSString *)isCredible isJiangsuFastRepair:(NSString *)isJiangsuFastRepair isGreenMechanics:(NSString *)isGreenMechanics isRescue:(NSString *)isRescue differential:(NSString *)differential level:(NSString *)level scope:(NSString *)scope Block:(void (^)(GetEnterpriseListModel *listModel,NSError *error))block;

// 企业查询详情
+(NSURLSessionDataTask *)getEnterpriseDetailWithId:(NSString *)enterpriseId Block:(void (^)(GetEnterpriseDetailModel *detailModel, NSError *error))block;

@end
