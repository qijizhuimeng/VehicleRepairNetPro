//
//  CarouselDetailViewController.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/25.
//  Copyright © 2017年 me. All rights reserved.
//

#import "BaseViewController.h"

@interface CarouselDetailViewController : BaseViewController

@property (nonatomic, strong) NSString *carouselId;
@property (nonatomic, strong) NSString *appLinkUrl;

-(void)getAppLinkWithUrl:(NSString *)url;

@end
