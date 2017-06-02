//
//  CarDoctorModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/2.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CarDoctorInfoModel : JSONModel

@property (nonatomic, strong)NSString *artContent;
@property (nonatomic, strong)NSString *beginTime;
@property (nonatomic, strong)NSString *id;
@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong)NSString *endTime;
@property (nonatomic, strong)NSString *optTime;
@property (nonatomic, strong)NSString *appraiseNum;
@property (nonatomic, strong)NSString *status;
@property (nonatomic, strong)NSString *praiseNum;
@property (nonatomic, strong)NSString *createTime;

@end

@interface CarDoctorDataModel : JSONModel

@property (nonatomic, strong)NSMutableArray *infoArr;
@property (nonatomic, strong)NSString *totalnum;
@property (nonatomic, strong)NSString *totalpage;
@property (nonatomic, strong)NSString *currentpage;
@property (nonatomic, strong)NSString *pageTime;

@end

@interface CarDoctorModel : JSONModel

@property (nonatomic, strong)NSString *status;
@property (nonatomic, strong)NSString *msg;
@property (nonatomic, strong)CarDoctorDataModel *dataModel;

@end

