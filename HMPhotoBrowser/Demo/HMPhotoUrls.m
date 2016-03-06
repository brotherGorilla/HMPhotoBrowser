//
//  HMPhotoUrls.m
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMPhotoUrls.h"

@implementation HMPhotoUrls

+ (instancetype)photoUrlsWithCount:(NSInteger)count {
    return [[self alloc] initWithCount:count];
}

- (instancetype)initWithCount:(NSInteger)count {
    self = [super init];
    if (self) {
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSInteger i = 0; i < count; i++) {
            NSString *fileName = [NSString stringWithFormat:@"%zd.jpg", i + 1];
        
            [arrayM addObject:[[NSBundle mainBundle] URLForResource:fileName withExtension:nil]];
        }
        
        _urls = arrayM.copy;
    }
    return self;
}

- (NSString *)description {
    return _urls.description;
}

@end
