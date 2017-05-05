//
//  GetEnterpriseListDataInfoModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/3.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GetEnterpriseListDataInfoModel : JSONModel

@property (nonatomic, strong)NSString * status;
@property (nonatomic, strong)NSArray * emList;
@property (nonatomic, strong)NSString * isRescue;
@property (nonatomic, strong)NSString * telephone;
@property (nonatomic, strong)NSArray * sList;// 换为数组
@property (nonatomic, strong)NSString * img;
@property (nonatomic, strong)NSString * latitude;
@property (nonatomic, strong)NSString * rescueCall;
@property (nonatomic, strong)NSString * name;
@property (nonatomic, strong)NSString * isGreenMechanics;
@property (nonatomic, strong)NSString * id;
@property (nonatomic, strong)NSString * level;
@property (nonatomic, strong)NSString * longitude;
@property (nonatomic, strong)NSString * isCredible;
@property (nonatomic, strong)NSString * introduction;
@property (nonatomic, strong)NSString * isJiangsuFastRepair;
@property (nonatomic, strong)NSString * createTime;
@property (nonatomic, strong)NSString * optTime;
@property (nonatomic, strong)NSArray * dList; // 换为数组
@property (nonatomic, strong)NSString * review;

@property (nonatomic, strong)NSString *creditLevel;
@property (nonatomic, strong)NSString *rescuePrice;



+ (NSMutableArray*)arrayInfoModelWithInfoArr:(NSArray *)infoArr;


@end

