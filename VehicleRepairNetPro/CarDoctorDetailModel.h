//
//  CarDoctorDetailModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/14.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CarDoctorDetailDataModel : JSONModel

@property (nonatomic, strong)NSString *artContent;
@property (nonatomic, strong)NSString *beginTime;
@property (nonatomic, strong)NSString *id;
@property (nonatomic, strong)NSString *actTag;
@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong)NSString *endTime;
@property (nonatomic, strong)NSString *optTime;
@property (nonatomic, strong)NSString *columnName;
@property (nonatomic, strong)NSString *appraiseNum;
@property (nonatomic, strong)NSString *realName;
@property (nonatomic, strong)NSString *status;
@property (nonatomic, strong)NSString *artTitle;
@property (nonatomic, strong)NSString *praiseNum;
@property (nonatomic, strong)NSString *createTime;

@end

@interface CarDoctorDetailModel : JSONModel

@property (nonatomic, strong)NSString *status;
@property (nonatomic, strong)NSString *msg;
@property (nonatomic, strong)NSString *role;

@property (nonatomic, strong) CarDoctorDetailDataModel *dataModel;

@end
