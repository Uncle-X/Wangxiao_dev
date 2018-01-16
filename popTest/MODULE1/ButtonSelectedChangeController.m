//
//  ButtonSelectedChangeController.m
//  popTest
//
//  Created by sevenga1473 on 2018/1/16.
//  Copyright © 2018年 Wangxiao. All rights reserved.
//

#import "ButtonSelectedChangeController.h"
#import <Masonry.h>

@interface ButtonSelectedChangeController ()
@property (nonatomic, strong) UIButton * currentSelectedBtn;

@end

@implementation ButtonSelectedChangeController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

#pragma mark - configUI
- (void)configUI{
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(50);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        
    }];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn1.mas_bottom);
        make.left.right.mas_equalTo(btn2.superview);
        make.height.mas_equalTo(50);
    }];
   
    
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn2.mas_bottom);
        make.left.right.mas_equalTo(btn3.superview);
        make.height.mas_equalTo(50);
        
    }];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn3.mas_bottom);
        make.left.right.mas_equalTo(btn4.superview);
        make.height.mas_equalTo(50);
    }];
    
    
    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
    [btn1 setTitle:@"btn1selected" forState:UIControlStateSelected];
    [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
    [btn2 setTitle:@"btn2selected" forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn3 setTitle:@"btn3" forState:UIControlStateNormal];
    [btn3 setTitle:@"btn3selected" forState:UIControlStateSelected];
    [btn4 setTitle:@"btn4" forState:UIControlStateNormal];
    [btn4 setTitle:@"btn4selected" forState:UIControlStateSelected];
    [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)btnClick:(UIButton *)button{
    button.selected = !button.selected;
    
    if (button.selected) {
        if (self.currentSelectedBtn) {
            self.currentSelectedBtn.selected = NO;
        }
        self.currentSelectedBtn = button;
    }
    else{
        self.currentSelectedBtn = nil;
        return;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
