//
//  CarouselDetailViewController.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import "BaseViewController.h"
#import "GetCarouselInfoListModel.h"

@interface CarouselDetailViewController : BaseViewController

@property (nonatomic, strong) NSString *carouselId;
@property (nonatomic, strong) NSString *appLinkUrl;

-(void)getPassCarouselInfoListModel:(GetCarouselInfoListModel *)model;

@end
