//
//  CommonFaultsViewController.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/13.
//  Copyright © 2017年 me. All rights reserved.
//

#import "BaseTableViewController.h"

typedef NS_ENUM(NSInteger,ColumnType){
    CommonFaults,
    Commonsense
};

@interface CommonFaultsViewController : BaseTableViewController

@property (nonatomic,assign)ColumnType columnType;

@end
