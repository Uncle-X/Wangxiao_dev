//
//  HWCommonAlertView.m
//  popTest
//
//  Created by sevenga1473 on 2018/1/11.
//  Copyright © 2018年 Wangxiao. All rights reserved.
//

#import "HWCommonAlertView.h"
#import <Masonry/Masonry.h>
@interface HWCommonAlertView()


@end
@implementation HWCommonAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    return self;
}

+ (HWCommonAlertView *)alertViewWithTitle:(NSString *)title contentString:(NSString *)contentStr buttonStr:(NSString *)confirmBtnStr{
    HWCommonAlertView *firstView = [[HWCommonAlertView alloc]init];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    UILabel *contentLabel = [[UILabel alloc]init];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:confirmBtnStr forState:UIControlStateNormal];
    firstView.button = button;
    
    button.backgroundColor = [UIColor redColor];
    titleLabel.backgroundColor = [UIColor greenColor];
    contentLabel.backgroundColor  = [UIColor purpleColor];
    firstView.backgroundColor = [UIColor grayColor];
    
    //父子关系
    [firstView addSubview:titleLabel];  
    [firstView addSubview:contentLabel];
    [firstView addSubview:button];
    
    
    

    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(titleLabel.superview);
        make.height.mas_equalTo(20);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(button.superview);
        make.height.mas_equalTo(50);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(contentLabel.superview);
        make.top.mas_equalTo(titleLabel.mas_bottom);
        make.bottom.mas_equalTo(button.mas_top).mas_offset(-40);
    }];
    
    contentLabel.text = contentStr;
    contentLabel.numberOfLines = 0;
    
    
//    CGFloat height;
//    UIFont * font = [UIFont systemFontOfSize:17];
//    CGRect rect = [contentStr boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX)
//                                                   options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
//                                                attributes:@{NSFontAttributeName:font} context:nil];
//    height = rect.size.height;
    
    [firstView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(300);
    }];
    
    return firstView;
    
}


@end
