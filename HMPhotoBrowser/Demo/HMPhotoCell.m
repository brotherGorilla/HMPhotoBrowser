//
//  HMPhotoCell.m
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMPhotoCell.h"
@import Masonry;
#import "HMPhotoUrls.h"

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
- (void)setPhotoUrls:(HMPhotoUrls *)photoUrls {
    _photoUrls = photoUrls;
    
    CGSize pictureViewSize = [self pictureViewSizeWithCount:photoUrls.urls.count];
    [_pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(pictureViewSize.height);
    }];
}

#pragma mark - 构造函数
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareUI];
    }
    return self;
}

#pragma mark - 私有函数
- (CGSize)pictureViewSizeWithCount:(NSInteger)count {
    if (count == 0) {
        return CGSizeZero;
    }
    
    NSInteger row = (count - 1) / _layout.count + 1;
    CGFloat height = (row - 1) * _layout.itemMargin + row * _layout.itemSize.height;
    
    return CGSizeMake(_layout.itemSize.width, height);
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
        
        make.width.mas_equalTo(_layout.viewWidth);
        make.height.mas_equalTo(_layout.viewWidth);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        
        make.bottom.equalTo(_pictureView).offset(_layout.margin);
    }];
    
    // 4. 准备图像视图
    [self prepareImageViews];
}

- (void)prepareImageViews {
    _pictureView.backgroundColor = self.backgroundColor;
    _pictureView.clipsToBounds = YES;
    
    NSInteger count = _layout.count * _layout.count;
    CGRect rect = CGRectMake(0, 0, _layout.itemSize.width, _layout.itemSize.height);
    CGFloat step = _layout.itemMargin + _layout.itemSize.width;
    
    for (NSInteger i = 0; i < count; i++) {
        
        // 1. 添加图像视图
        UIImageView *iv = [[UIImageView alloc] init];
        iv.backgroundColor = [UIColor lightGrayColor];
        
        [_pictureView addSubview:iv];
        
        // 2. 设置图像视图位置
        NSInteger col = i % _layout.count;
        NSInteger row = i / _layout.count;
        
        iv.frame = CGRectOffset(rect, col * step, row * step);
    }
}

- (void)prepareLayout {
    _layout.margin = 12;
    _layout.itemMargin = 2;
    _layout.count = 3;
    
    _layout.viewWidth = [UIScreen mainScreen].bounds.size.width - (_layout.count - 1) * _layout.margin;
    CGFloat width = (_layout.viewWidth - (_layout.count - 1) * _layout.itemMargin) / _layout.count;
    _layout.itemSize = CGSizeMake(width, width);
}

@end
