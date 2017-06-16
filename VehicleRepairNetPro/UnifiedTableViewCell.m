//
//  UnifiedTableViewCell.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/6/13.
//  Copyright © 2017年 me. All rights reserved.
//

#import "UnifiedTableViewCell.h"

@implementation UnifiedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = getColor(@"ffffff");
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.image = [UIImage imageNamed:@"LighthouseCell_imageView_image"];
        [self.contentView addSubview:self.imageView1];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"信息标题";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLabel];
        
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.backgroundColor = getColor(@"f2f2f2");
        [self.contentView addSubview:_lineImageView];
    }
    return self;
}

-(void)layoutSubviews {
    [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.width.mas_equalTo(6);
        make.centerY.equalTo(self).offset(-8);
        make.height.mas_equalTo(6);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageView1);
        make.left.equalTo(self.imageView1.mas_right).offset(8);
        make.right.equalTo(self).offset(-8);
        make.height.mas_equalTo(20);
    }];
    
    [_lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-8);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(8);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
