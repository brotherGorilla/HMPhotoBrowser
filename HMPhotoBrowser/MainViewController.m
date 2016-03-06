//
//  MainViewController.m
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MainViewController.h"
#import "HMPhotoUrls.h"
#import "HMPhotoCell.h"

NSString *const DemoCellIdentifier = @"DemoCellIdentifier";

@interface MainViewController () <UITableViewDataSource>

@end

@implementation MainViewController {
    UITableView *_tableView;
    NSArray <HMPhotoUrls *> *_photoUrlsList;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 准备表格视图
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    [_tableView registerClass:[HMPhotoCell class] forCellReuseIdentifier:DemoCellIdentifier];
    _tableView.estimatedRowHeight = 200;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    // 2. 准备数据
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        [arrayM addObject:[HMPhotoUrls photoUrlsWithCount:i + 1]];
    }
    _photoUrlsList = arrayM.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _photoUrlsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HMPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:DemoCellIdentifier forIndexPath:indexPath];
    
    cell.photoUrls = _photoUrlsList[indexPath.row];
    
    return cell;
}

@end
