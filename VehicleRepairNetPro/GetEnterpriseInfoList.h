//
//  GetEnterpriseInfoList.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GetEnterpriseInfoList : JSONModel

//"id": "jiade111",
//"name": "冒牌企业",
//"introduction": null,
//"img": "http://10.58.160.73:8082/FilesServer/servlet/DownloadImgServlet?fileName=1bbfc2f2fa27451287a6ba89acecd531.png",
//"telephone": "12333334444",
//"isRescue": 0,
//"isJiangsuFastRepair": 0,
//"isGreenMechanics": 0,
//"isCredible": 0,
//"rescueCall": "",
//"level": null,
//"longitude": 123.319965,
//"latitude": 41.8165,
//"status": 0,
//"createTime": "",
//"optTime": 1450166417000,
//"review": 0

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *telephone;
@property (nonatomic, strong) NSString *isRescue;
@property (nonatomic, strong) NSString *isJiangsuFastRepair;
@property (nonatomic, strong) NSString *isGreenMechanics;
@property (nonatomic, strong) NSString *isCredible;
@property (nonatomic, strong) NSString *rescueCall;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *optTime;
@property (nonatomic, strong) NSString *review;


@end
