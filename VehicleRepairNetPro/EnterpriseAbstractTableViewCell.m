//
//  EnterpriseAbstractTableViewCell.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/5.
//  Copyright © 2017年 me. All rights reserved.
//

#import "EnterpriseAbstractTableViewCell.h"

@implementation EnterpriseAbstractTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:15];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLab];
        
        _lineLab = [[UILabel alloc] init];
        _lineLab.font = [UIFont systemFontOfSize:12];
        _lineLab.backgroundColor = getColor(@"f2f2f2");
        [self.contentView addSubview:_lineLab];
        
        _content = [[UILabel alloc] init];
        _content.font = [UIFont systemFontOfSize:12];
        _content.textAlignment = NSTextAlignmentLeft;
        _content.numberOfLines = 0;
        [self.contentView addSubview:_content];
    }
    return self;
}

-(void)layoutSubviews {
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(14);
    }];
    
    [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(SCREEN_WHIDTH - 20);
        make.height.mas_equalTo(1);
    }];
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineLab.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(SCREEN_WHIDTH - 20);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
