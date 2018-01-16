//
//  FirstViewController.m
//  popTest
//
//  Created by sevenga1473 on 2018/1/16.
//  Copyright © 2018年 Wangxiao. All rights reserved.
//

#import "FirstViewController.h"
#import "AlertCommonViewController.h"
#import "ButtonSelectedChangeController.h"
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArry;


@end

@implementation FirstViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configData];
}


#pragma mark - configUI
- (void)configUI{
    self.title = @"first";
    self.view.backgroundColor = [UIColor brownColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)configData{
    [self.dataArry addObject:@"通用弹窗动画"];
    [self.dataArry addObject:@"多按钮选中状态切换"];
}


#pragma mark - datasource & delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataArry[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:{
            AlertCommonViewController *testAlertVc = [[AlertCommonViewController alloc]init];
            [self.navigationController pushViewController:testAlertVc animated:YES];
            
        }
            break;
            
        case 1:{
            ButtonSelectedChangeController *btnSelectedChangeView = [[ButtonSelectedChangeController alloc]init];
            [self.navigationController pushViewController:btnSelectedChangeView animated:YES];
        }
            
        default:
            break;
    }
}
#pragma mark - lazy
- (NSMutableArray *)dataArry{
    if (!_dataArry) {
        _dataArry= [NSMutableArray array];
    }
    return _dataArry;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
