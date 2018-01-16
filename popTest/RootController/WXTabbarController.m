//
//  WXTabbarController.m
//  popTest
//
//  Created by sevenga1473 on 2018/1/16.
//  Copyright © 2018年 Wangxiao. All rights reserved.
//

#import "WXTabbarController.h"
#import "WXNAVigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface WXTabbarController ()

@end

@implementation WXTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self initChildsControllers:self];
}

- (void)initChildsControllers:(UITabBarController *)tabbarController{
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"itm1" image:nil selectedImage:nil];
    FirstViewController * vc1 = [[FirstViewController alloc]init];
    vc1.tabBarItem = item1;
    WXNAVigationController *nav1 = [[WXNAVigationController alloc]initWithRootViewController:vc1];
    
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"itm2" image:nil selectedImage:nil];
    SecondViewController *vc2 = [[SecondViewController alloc]init];
    vc2.tabBarItem = item2;
    WXNAVigationController *nav2 = [[WXNAVigationController alloc]initWithRootViewController:vc2];
    
    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:@"itm3" image:nil selectedImage:nil];
    ThirdViewController *vc3 = [[ThirdViewController alloc]init];
    vc3.tabBarItem = item3;
    WXNAVigationController *nav3 = [[WXNAVigationController alloc]initWithRootViewController:vc3];
    
    NSMutableArray *controllersArr = [NSMutableArray array];
    [controllersArr addObject:nav1];
    [controllersArr addObject:nav2];
    [controllersArr addObject:nav3];
    [tabbarController setViewControllers:controllersArr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
