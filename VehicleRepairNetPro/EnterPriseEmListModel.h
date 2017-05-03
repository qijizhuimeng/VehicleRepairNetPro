//
//  EnterPriseEmListModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/3.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface EnterPriseEmListModel : JSONModel

//"maintenanceId" : "8aba20f65161181b0151611f5aba000a",
//"id" : "ff80808151e766690151f195a25500ab",
//"companyId" : "ff8080815870ddcf0158be7940dd0676",
//"price" : 0,
//"companyName" : "扬州宏润汽车服务中心",
//"maintenanceName" : "发动机检修"
@property (nonatomic, strong)NSString *maintenanceId;
@property (nonatomic, strong)NSString *id;
@property (nonatomic, strong)NSString *companyId;
@property (nonatomic, strong)NSString *price;
@property (nonatomic, strong)NSString *companyName;
@property (nonatomic, strong)NSString *maintenanceName;

+(NSMutableArray *)arrayEmlistModelWithEmlistArr:(NSArray *)emlistArr;

@end
