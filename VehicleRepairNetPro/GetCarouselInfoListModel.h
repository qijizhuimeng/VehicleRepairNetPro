//
//  GetCarouselInfoListModel.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GetCarouselInfoListModel : JSONModel

//"id": "8aba20c95123eb40015123f0951e0007",
//"title": "测试轮播图1",
//"imgPath": "http://10.58.160.73:8082/FilesServer/servlet/DownloadImgServlet?fileName=87212ad1ce7e4b9a8484a7077dfe7cc3.jpg",
//"link": "http://10.58.160.73:8080/VMAR/guideinfo/bsdtindex?type=7",
//"orderNo": 1,
//"createTime": "2015-11-2016:09:08",
//"optTime": "2015-12-0720:52:18",
//"status": 0

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imgPath;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *applink;
@property (nonatomic, strong) NSString *orderNo;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *optTime;
@property (nonatomic, strong) NSString *status;

@end
