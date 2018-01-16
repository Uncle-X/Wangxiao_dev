//
//  CommenAlertView.m
//  popTest
//
//  Created by sevenga1473 on 2018/1/14.
//  Copyright © 2018年 Wangxiao. All rights reserved.
//

#import "CommenAlertView.h"
#import <Masonry/Masonry.h>
#import <pop/POP.h>
@interface CommenAlertView()

@end
@implementation CommenAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLable = [[UILabel alloc]init];
        self.contentLable = [[UILabel alloc]init];
        self.lineView = [[UIView alloc]init];
        self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:self.titleLable];
        [self addSubview:self.contentLable];
        [self addSubview:self.lineView];
        [self addSubview:self.confirmBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //调试颜色
//    self.backgroundColor = [UIColor whiteColor];
//    self.titleLable.backgroundColor = [UIColor greenColor];
//    self.contentLable.backgroundColor = [UIColor redColor];
//    self.lineView.backgroundColor = [UIColor blackColor];
//    self.confirmBtn.backgroundColor = [UIColor yellowColor];
    
        
    //约束
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.titleLable.superview);
        make.height.mas_equalTo(50);
    }];
    
    [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLable.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.mas_left).offset(30);
        make.right.mas_equalTo(self.mas_right).offset(-30);
        make.bottom.mas_equalTo(self.lineView.mas_top).mas_offset(-40);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentLable);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(self.confirmBtn.mas_top).mas_offset(0);

    }];
    
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
    //总view设置位置和宽(不用设置高)
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(250);
        make.centerX.mas_equalTo(self.superview.mas_centerX);
        make.centerY.mas_equalTo(self.superview.mas_centerY);
    }];
    
    
    
}

@end
