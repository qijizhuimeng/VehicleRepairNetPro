//
//  EnterpriseDetailTableViewCell.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/5.
//  Copyright © 2017年 me. All rights reserved.
//

#import "EnterpriseDetailTableViewCell.h"

@implementation EnterpriseDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:12];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLab];
        
        _titlleText = [[UILabel alloc] init];
        _titlleText.font = [UIFont systemFontOfSize:12];
        _titlleText.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titlleText];
        
        _telephoneIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ServiceCenterVC_tel"]];
        [self.contentView addSubview:_telephoneIcon];
    }
    return self;
}

-(void)layoutSubviews {
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(14);
    }];
    
    [_titlleText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(SCREEN_WHIDTH - 100);
        make.height.mas_equalTo(14);
    }];
    
    [_telephoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-8);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(14);
    }];
}

-(void)addArrows {
    self.ArrowsIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_arrow_right"]];
    [self.contentView addSubview:_ArrowsIcon];
    [_ArrowsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-8);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(5);
        make.height.mas_equalTo(10);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
