//
//  HMPhotoUrls.h
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 配图 URL 数组模型
@interface HMPhotoUrls : NSObject

/// 配图 URL 数组
@property (nonatomic, nonnull) NSMutableArray <NSString *> *urls;

/// 根据数量返回配图 URL 数组模型
///
/// @param count URL 数量
///
/// @return 配图数组模型
+ (nonnull instancetype)photoUrlsWithCount:(NSInteger)count;

@end
