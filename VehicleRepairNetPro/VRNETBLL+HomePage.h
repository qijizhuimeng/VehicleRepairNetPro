//
//  VRNETBLL+HomePage.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import "VRNETBLL.h"

@interface VRNETBLL (HomePage)

+(NSURLSessionTask *)getHomePageModelBlock:(void (^)(HomePageModel *model, NSError *error))block;

@end
