//
//  AlertCommonViewController.m
//  popTest
//
//  Created by sevenga1473 on 2018/1/16.
//  Copyright © 2018年 Wangxiao. All rights reserved.
//

#import "AlertCommonViewController.h"
#import <Masonry.h>
#import <POP.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "CommenAlertView.h"


@interface AlertCommonViewController ()

//动画属性
@property (nonatomic, strong) POPSpringAnimation * popInSpringAnim;
@property (nonatomic, strong) POPBasicAnimation * popOut;
@property (nonatomic, strong) POPBasicAnimation * anim;
@property (nonatomic, strong) POPBasicAnimation * animOut;

//弹窗属性
@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, copy) NSString * contentString;
@property (nonatomic, strong)CommenAlertView *commenAlertView;

@end

@implementation AlertCommonViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startBtn];
    [self configPopAnimation];
    [self configUI];
}

#pragma mark - configUI
- (void)startBtn{
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(10, 84, 100, 50);
    startBtn.backgroundColor = [UIColor greenColor];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn.titleLabel setTextColor:[UIColor blackColor]];
    startBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:startBtn];
    [startBtn addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
}


- (void)configUI{
    
    self.commenAlertView = [[CommenAlertView alloc]init];
    self.commenAlertView.layer.cornerRadius = 5.0;
    self.commenAlertView.backgroundColor = [UIColor whiteColor];
    
    
    self.commenAlertView.titleLable.text = @"标题居中";
    self.commenAlertView.titleLable.textAlignment = NSTextAlignmentCenter;
    self.commenAlertView.tintColor = [UIColor blackColor];
    
    self.commenAlertView.contentLable.text = @"1.文字居中\n\r2.lable高度随文字多少高度自动伸缩\n\r3.通过约束控制,未使用计算高度\n\r4.依赖masonry\n\r5.动画效果通过pop框架实现";
    self.commenAlertView.contentLable.font = [UIFont systemFontOfSize:12.0f];
    self.commenAlertView.contentLable.textAlignment = NSTextAlignmentCenter;
    self.commenAlertView.contentLable.numberOfLines = 0;
    
    self.commenAlertView.lineView.backgroundColor = [UIColor grayColor];
    [self.commenAlertView.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.commenAlertView.confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.commenAlertView.confirmBtn addTarget:self action:@selector(popOutView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.commenAlertView];
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
    };
    
    
    self.popOut = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    self.popOut.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    self.popOut.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    self.popOut.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height + 300)];
    self.popOut.beginTime = CACurrentMediaTime() + .5;
    self.popOut.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"----移除popOut动画");
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

#pragma mark - buttonAction
- (void)startAnimation{
    
    [self.bgView pop_addAnimation:self.anim forKey:@"fade"];
    [self.commenAlertView pop_addAnimation:self.popInSpringAnim forKey:@"popIn"];
}

- (void)popOutView{
    [self.bgView pop_addAnimation:self.animOut forKey:@"fadeOut"];
    [self.commenAlertView pop_addAnimation:self.popOut forKey:@"popOut"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
