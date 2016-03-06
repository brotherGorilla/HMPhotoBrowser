//
//  ViewController.m
//  HMPhotoBrowser
//
//  Created by 刘凡 on 16/3/6.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *str = @"hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello ";
    NSDictionary *attr = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    CGSize labelSize = CGSizeMake(300, MAXFLOAT);
    
    CGRect strRect = [str boundingRectWithSize:labelSize
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:attr
                                       context:nil];
    NSLog(@"%@", NSStringFromCGRect(strRect));
    
    NSAttributedString *strA = [[NSAttributedString alloc] initWithString:str attributes:attr];
    
    CGRect strARect = [strA boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    NSLog(@"%@", NSStringFromCGRect(strARect));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
