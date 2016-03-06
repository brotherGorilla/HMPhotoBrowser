//
//  HMPhotoCell.m
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMPhotoCell.h"
@import Masonry;

/// 图片 Cell 布局
typedef struct HMPhotoCellLayout {
    CGFloat viewWidth;
    
    CGSize itemSize;
    CGFloat margin;
    CGFloat itemMargin;
    NSInteger count;
} HMPhotoCellLayout;

@implementation HMPhotoCell {
    UIView *_pictureView;
    HMPhotoCellLayout _layout;
}

#pragma mark - 设置数据
- (void)setUrls:(HMPhotoUrls *)urls {
    _urls = urls;
    
    NSLog(@"%@", _urls);
}

#pragma mark - 构造函数
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareUI];
    }
    return self;
}

#pragma mark - 设置界面
- (void)prepareUI {
    // 0. 背景颜色
    self.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1.0];
    
    // 1. 准备布局
    [self prepareLayout];
    
    // 2. 添加控件
    _pictureView = [[UIView alloc] init];
    [self.contentView addSubview:_pictureView];
    
    // 3. 自动布局
    [_pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_layout.margin);
        make.leading.mas_equalTo(_layout.margin);
        make.trailing.mas_equalTo(-_layout.margin);
        
        make.height.mas_equalTo(_layout.viewWidth);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        
        make.bottom.equalTo(_pictureView).offset(_layout.margin);
    }];
    
    _pictureView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}

- (void)prepareLayout {
    _layout.itemSize = CGSizeMake(90, 90);
    _layout.margin = 12;
    _layout.itemMargin = 2;
    _layout.count = 3;
    
    _layout.viewWidth = [UIScreen mainScreen].bounds.size.width - (_layout.count - 1) * _layout.margin;
}

@end
