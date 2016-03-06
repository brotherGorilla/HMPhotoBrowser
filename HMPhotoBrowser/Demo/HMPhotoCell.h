//
//  HMPhotoCell.h
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMPhotoUrls;

/// 图片 Cell
@interface HMPhotoCell : UITableViewCell

/// 配图视图数组
@property (nullable, nonatomic) HMPhotoUrls *photoUrls;

@end
