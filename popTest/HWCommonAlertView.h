//
//  HWCommonAlertView.h
//  popTest
//
//  Created by sevenga1473 on 2018/1/11.
//  Copyright © 2018年 Wangxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWCommonAlertView : UIView
@property (nonatomic, strong) UIView * firstView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * detailLabel;
@property (nonatomic, strong) UIButton * button;
+ (HWCommonAlertView *)alertViewWithTitle:(NSString *)title contentString:(NSString *)contentStr buttonStr:(NSString *)confirmBtnStr;
@end
