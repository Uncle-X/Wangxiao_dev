//
//  ViewController.m
//  popTest
//
//  Created by Wangxiao on 2017/12/28.
//  Copyright © 2017年 Wangxiao. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <POP.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <SVProgressHUD/SVProgressHUD.h>

#import "HWCommonAlertView.h"

@interface ViewController ()

//动画属性
@property (nonatomic, strong) POPSpringAnimation * popInSpringAnim;
@property (nonatomic, strong) POPBasicAnimation * popOut;
@property (nonatomic, strong) POPBasicAnimation * anim;
@property (nonatomic, strong) POPBasicAnimation * animOut;


//弹窗属性
@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong) HWCommonAlertView * firstView;


@property (nonatomic, copy) NSString * contentString;
@property (nonatomic, strong) UIButton * currentSelectedBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configPopAnimation];
    
    [self configUI];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(0, 0, 100, 100);
    startBtn.backgroundColor = [UIColor greenColor];
    [startBtn.titleLabel setText:@"开始"];
    startBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:startBtn];
    [startBtn addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configPopAnimation{
    __weak typeof(self) weakSelf = self;
    self.popInSpringAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    self.popInSpringAnim.beginTime = CACurrentMediaTime() + 0.5;
    self.popInSpringAnim.springBounciness = 10;
    self.popInSpringAnim.springSpeed = 4;
    self.popInSpringAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2,-300)];
    self.popInSpringAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    self.popInSpringAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"----移除popIn动画");
        [weakSelf.firstView pop_removeAnimationForKey:@"popIn"];
    };
    
    
    self.popOut = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    self.popOut.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    self.popOut.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    self.popOut.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height + 300)];
    self.popOut.beginTime = CACurrentMediaTime() + .5;
    self.popOut.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"----移除popOut动画");
        [weakSelf.firstView pop_removeAnimationForKey:@"popOut"];
    };
    
    self.anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    self.anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    self.anim.fromValue = @(0.0);
    self.anim.toValue = @(0.8);
    self.anim.beginTime = CACurrentMediaTime() + .5;
    self.anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        [weakSelf.bgView pop_removeAnimationForKey:@"fade"];
        NSLog(@"----移除fade动画");
    };
    
    self.animOut = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    self.animOut.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    self.animOut.fromValue = @(0.8);
    self.animOut.toValue = @(0.0);
    self.animOut.beginTime = CACurrentMediaTime() + .5;
    self.animOut.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        [weakSelf.bgView pop_removeAnimationForKey:@"fadeOut"];
        NSLog(@"----移除fadeOut动画");
    };
    
   
}

- (void)configUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.contentString = @"撒不回家和客户看花开很快很快就看会好黑jfajfkdaj交罚款垃圾袋卡卡借加法搭建咖啡机地方撒123...adfaas";
    //初始化
    self.bgView = [[UIView alloc]init];
    //颜色
    self.bgView.backgroundColor = [UIColor blackColor];
    self.bgView.alpha = 0.0;
    self.bgView.userInteractionEnabled = NO;
    [self.view addSubview:self.bgView];
    //约束
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(self.bgView.superview);
    }];
    NSString *contentStr = @"fjdajfdajkfddjdjkafdkjafladsfdklasjfkldajfdakljflsadfdklsaf";
    self.firstView = [HWCommonAlertView alertViewWithTitle:@"购买成功" contentString:contentStr buttonStr:@"领取成功"];
    [self.view addSubview:self.firstView];
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.firstView.superview.mas_centerX);
        make.bottom.mas_equalTo(self.firstView.superview.mas_top).mas_offset(0);

    }];
   [ self.firstView.button addTarget:self action:@selector(popOutView) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)startAnimation{
    
    [self.bgView pop_addAnimation:self.anim forKey:@"fade"];
    [self.firstView pop_addAnimation:self.popInSpringAnim forKey:@"popIn"];
}

- (void)popOutView{
    [self.bgView pop_addAnimation:self.animOut forKey:@"fadeOut"];
    [self.firstView pop_addAnimation:self.popOut forKey:@"popOut"];
}


- (void)configTestBtnUI{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    
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
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];
    
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
