//
//  GetEnterpriseListDataInfoModel.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/3.
//  Copyright © 2017年 me. All rights reserved.
//

#import "GetEnterpriseListDataInfoModel.h"

@implementation GetEnterpriseListDataInfoModel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

//        _status = model.status;
//        _emList = model.emList;
//        _isRescue = model.isRescue;
//        _telephone = model.telephone;
//        _sList = model.sList;
//        _img = model.img;
//        _latitude = model.latitude;
//        _rescueCall = model.rescueCall;
//        _name = model.name;
//        _isGreenMechanics = model.isGreenMechanics;
//        _id = model.id;
//        _level = model.level;
//        _longitude = model.longitude;
//        _isCredible = model.isCredible;
//        _introduction = model.introduction;
//        _isJiangsuFastRepair = model.isJiangsuFastRepair;
//        _createTime = model.createTime;
//        _optTime = model.optTime;
//        _dList = model.dList;
//        _review = model.review;
//    }
    
  
+(NSMutableArray *)arrayInfoModelWithInfoArr:(NSArray *)infoArr {
    return [GetEnterpriseListDataInfoModel arrayOfModelsFromDictionaries:infoArr error:nil];
}

@end
