//
//  CommonFaultsModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/13.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CommonFaultsInfoModel : JSONModel

@property (nonatomic, strong) NSString *artContent;

@property (nonatomic, strong) NSString *beginTime;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *endTime;

@property (nonatomic, strong) NSString *optTime;
@property (nonatomic, strong) NSString *columnName;
@property (nonatomic, strong) NSString *appraiseNum;
@property (nonatomic, strong) NSString *realName;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *optTartTitleime;
@property (nonatomic, strong) NSString *praiseNum;
@property (nonatomic, strong) NSString *createTime;

@end

@interface CommonFaultsDataModel : JSONModel

@property (nonatomic, strong) NSString *totalnum;

@property (nonatomic, strong) NSString *totalpage;

@property (nonatomic, strong) NSString *currentpage;

@property (nonatomic, strong) NSString *pageTime;

@property (nonatomic, strong) NSMutableArray *infoArr;

@end

@interface CommonFaultsModel : JSONModel

@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) CommonFaultsDataModel*dataModel;

@end




