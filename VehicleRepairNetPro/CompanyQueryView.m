//
//  CompanyQueryView.m
//  VehicleRepairNetPro
//
//  Created by me on 2017/5/9.
//  Copyright © 2017年 me. All rights reserved.
//

#import "CompanyQueryView.h"

//自定义一个带勾选图片和文本内容的按钮
@interface customButton : UIButton

@property (nonatomic, strong)UILabel *textLab;
@property (nonatomic, strong)UIImageView *iconImage;

@end

@implementation customButton



@end


static const CGFloat searchBGViewX = 100;
@interface CompanyQueryView ()

@property (nonatomic,strong)UIView *superView; // 父视图
@property (nonatomic, strong)UIScrollView *rightView;
@property (nonatomic, strong)UILabel *enterpriseQualificationLab;

@end

@implementation CompanyQueryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithView:(UIView *)view {
    self = [super init];
    if (self) {

        _superView = view;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        self.frame = CGRectMake(0, 0, SCREEN_WHIDTH, SCREEN_HEIGHT - 64);
        self.hidden = YES;
        
        // 右侧搜索框背景
        self.rightView = [[UIScrollView alloc] initWithFrame:CGRectMake(SCREEN_WHIDTH, 0, SCREEN_WHIDTH - searchBGViewX, SCREEN_HEIGHT)];
        self.rightView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.rightView];
        
        // 暗影部分
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, SCREEN_HEIGHT)];
        leftView.backgroundColor = [UIColor clearColor];
        [self addSubview:leftView];
        UITapGestureRecognizer *blackViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissCompanyQueryView)];
        [leftView addGestureRecognizer:blackViewTap];
    }
    
    
    return self;
    
}

-(void)dismissCompanyQueryView {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
        _rightView.frame = CGRectMake(SCREEN_WHIDTH, 0, SCREEN_WHIDTH - searchBGViewX, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

-(void)showSearchView {
    self.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        
    }];
}

@end
