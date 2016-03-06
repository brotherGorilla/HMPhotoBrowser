//
//  MainViewController.m
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MainViewController.h"
#import "HMPhotoUrls.h"

#define kMaxDemoCount 9
NSString *const DemoCellIdentifier = @"DemoCellIdentifier";

@interface MainViewController () <UITableViewDataSource>

@end

@implementation MainViewController {
    UITableView *_tableView;
    NSArray <HMPhotoUrls *> *_photoUrls;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 准备表格视图
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DemoCellIdentifier];
    
    // 2. 准备数据
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSInteger i = 0; i < kMaxDemoCount; i++) {
        [arrayM addObject:[HMPhotoUrls photoUrlsWithCount:i + 1]];
    }
    _photoUrls = arrayM.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _photoUrls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DemoCellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
}

@end
