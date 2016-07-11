//
//  XPCornerImageView.m
//  CornerImageView
//
//  Created by 徐攀 on 16/7/11.
//  Copyright © 2016年 cn.xupan.www. All rights reserved.
//

#import "XPCornerImageView.h"

@interface XPCornerImageView ()

@property (nonatomic, copy) NSString *imgName;

@property (nonatomic, assign) CGFloat cornerRadiu;

@property (nonatomic, assign) UIRectCorner corners;

@end

@implementation XPCornerImageView


- (void)drawRect:(CGRect)rect {
    
    [self drawCornerImage];
}

+ (XPCornerImageView *)cornorImage:(NSString *)name
        corneRadius:(CGFloat)radius
  byRoundingCorners:(UIRectCorner)corners
{
    XPCornerImageView *view = [[self alloc] init];
    view.imgName = name;
    view.cornerRadiu = radius;
    view.corners = corners;
    //  视图是否不透明， 如果不设置该属性，会有黑边；
    view.opaque = NO;
    // 重绘
    [view setNeedsDisplay];
    return view ;
}

- (void)drawCornerImage
{
    /**
     *  利用BeezierPath绘制圆角图片区域
     *
     *  参数一： 图片位置大小范围
     *  参数二： 圆角位置
     *  参数三： 圆角半径
     */
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:self.corners
                                                     cornerRadii:CGSizeMake(self.cornerRadiu, self.cornerRadiu)];
    //  因为这里是从边上裁剪的，所以设置的边框宽度要成2，因为会截去一半边框。
    path.lineWidth = self.borderWidth * 2;
    // 如果有边框，才设置颜色
    if (self.borderWidth != 0) {
        [self.borderColor setStroke];
    }
    // 截取上下文区域
    [path addClip];
    
    UIImage *image = [UIImage imageNamed:self.imgName];
    [image drawInRect:CGRectMake(self.borderWidth * 0.5, self.borderWidth * 0.5, path.bounds.size.width - self.borderWidth, path.bounds.size.height - self.borderWidth)];
    // 先重绘图片，最后渲染边框，否则图片会覆盖边框
    [path stroke];
    
}

- (UIColor *)borderColor
{
    if (!_borderColor) {
        _borderColor = [UIColor blackColor];
    }
    return _borderColor;
}
@end
