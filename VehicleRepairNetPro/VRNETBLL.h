//
//  VRNETBLL.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/4/28.
//  Copyright © 2017年 me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonReturnModel.h"
#import <AFNetworking.h>
#import "AFAppDotNetApIClient.h"
#import "GetEnterpriseListModel.h"
#import "EnterPriseEmListModel.h"
#import "GetEnterpriseDetailModel.h"

@interface VRNETBLL : NSObject

+(NSURLSessionDataTask *)returnCommonResultMOdelHttpRequestWithParameters:(NSDictionary *)parameters POST:(NSString *)url resultBlock:(void (^) (CommonReturnModel *,NSError *))block;

@end
