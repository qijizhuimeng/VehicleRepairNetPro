//
//  GetHomePageCenterModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "GetCarouselInfoListModel.h"
#import "GetBrandInfoListModel.h"
#import "GetEnterpriseInfoList.h"

@interface GetHomePageCenterModel : JSONModel

@property (nonatomic, strong)NSMutableArray *carouselInfolist;
@property (nonatomic, strong)NSMutableArray *brandInfoList;
@property (nonatomic, strong)NSMutableArray *entepriseInfoList;

@end



