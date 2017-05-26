//
//  GetBrandInfoListModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GetBrandInfoListModel : JSONModel

//"id": "8aba20a6518acfa301518ad0f7b10001",
//"name": "宝马",
//"imgPath": "http://10.58.160.73:8082/FilesServer/servlet/DownloadImgServlet?fileName=c718cac51e934596abb0dcede03f5c9d.jpg",
//"isShow": 1,
//"status": 1,
//"createDate": "2015-12-1410:35:33"

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imgPath;
@property (nonatomic, strong) NSString *isShow;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *createDate;

@end
