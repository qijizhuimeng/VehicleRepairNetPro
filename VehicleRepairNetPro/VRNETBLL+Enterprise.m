//
//  VRNETBLL+Enterprise.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL+Enterprise.h"

@implementation VRNETBLL (Enterprise)

+(NSURLSessionTask *)getEnterpriseListWithCurrentPage:(NSString *)currentPage isCredible:(NSString *)isCredible isJiangsuFastRepair:(NSString *)isJiangsuFastRepair isGreenMechanics:(NSString *)isGreenMechanics isRescue:(NSString *)isRescue differential:(NSString *)differential level:(NSString *)level scope:(NSString *)scope Block:(void (^)(GetEnterpriseListModel *listModel,NSError *error))block {
    
    NSDictionary *parameters = @{
                                 @"currentPage":currentPage,
                                 @"differential":differential,
                                 @"scope":scope,
                                 @"isJiangsuFastRepair":isJiangsuFastRepair,
                                 @"isCredible":isCredible,
                                 @"isGreenMechanics":isGreenMechanics,
                                 @"isRescue":isRescue,
                                 @"level":level
                                 };
    
    NSString *postUrl = getEnterpriseList_URL;
    
    return [[AFAppDotNetApIClient shareClient] POST:postUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        GetEnterpriseListModel *model = [[GetEnterpriseListModel alloc] getListModelWithDictionary:responseObject error:nil];
        if (block) {
            block(model,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil,error);
        }
        
    }];
}

+(NSURLSessionDataTask *)getEnterpriseDetailWithId:(NSString *)enterpriseId Block:(void (^)(GetEnterpriseDetailModel *detailModel, NSError *error))block {
    NSDictionary *paramer = @{@"enterpriseId":enterpriseId};
    NSString *post = getEnterpriseDetail_URL;
    return [[AFAppDotNetApIClient shareClient] POST:post parameters:paramer progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        GetEnterpriseDetailModel *model = [[GetEnterpriseDetailModel alloc] GetEnterpriseDetailModelWithDictonary:responseObject];
        block(model,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
}

@end
