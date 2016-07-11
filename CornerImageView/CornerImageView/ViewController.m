//
//  ViewController.m
//  CornerImageView
//
//  Created by 徐攀 on 16/7/11.
//  Copyright © 2016年 cn.xupan.www. All rights reserved.
//

#import "ViewController.h"
#import "XPCornerImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XPCornerImageView *imageView = [XPCornerImageView cornorImage:@"me" corneRadius:20 byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopRight)];
    imageView.borderWidth = 2;
    imageView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:imageView];
    
}



@end
