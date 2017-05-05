//
//  EnterpriseDetailTableViewCell.h
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/5.
//  Copyright © 2017年 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterpriseDetailTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *titleLab;  // 
@property (nonatomic, strong)UILabel *titlleText; //
@property (nonatomic, strong)UIImageView *telephoneIcon; //

@property (nonatomic, strong)UIImageView *ArrowsIcon; //箭头

-(void)addArrows;

@end
