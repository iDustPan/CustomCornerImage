//
//  XPCornerImageView.h
//  CornerImageView
//
//  Created by 徐攀 on 16/7/11.
//  Copyright © 2016年 cn.xupan.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XPCornerImageView : UIView

/** 边框宽度， 默认为0 */
@property (nonatomic, assign) CGFloat borderWidth;
/** 边框颜色，要先设置边框宽度,否则不起作用，默认为黑色 */
@property (nonatomic, strong) UIColor *borderColor;

/**
 *  设置自定义圆角矩形图片
 *
 *  @param name    图片名
 *  @param radius  圆角半径
 *  @param corners 设置圆角的位置
 */
+ (XPCornerImageView *)cornorImage:(NSString *)name
        corneRadius:(CGFloat)radius
  byRoundingCorners:(UIRectCorner)corners;

@end
