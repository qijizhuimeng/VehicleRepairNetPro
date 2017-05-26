//
//  AccessoriesCollectionViewCell.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/23.
//  Copyright © 2017年 me. All rights reserved.
//

#import "AccessoriesCollectionViewCell.h"

@interface AccessoriesCollectionViewCell ()

@property (nonatomic, strong) UIView *view;

@end

@implementation AccessoriesCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_view];
        
        _carIcon = [[UIImageView alloc] init];
        _carIcon.backgroundColor = [UIColor whiteColor];
        [_view addSubview:_carIcon];
        
        _carName = [[UILabel alloc] init];
        _carName.font = [UIFont systemFontOfSize:14];
        _carName.textAlignment = NSTextAlignmentCenter;
        _carName.text = @"汽车品牌";
        [_view addSubview:_carName];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.bottom.equalTo(self).offset(0);
    }];
    
    [_carIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self).offset(-16);
    }];
    
    [_carName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_carIcon.mas_bottom).offset(3);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.view).offset(-3);
    }];
}

@end
