//
//  UIImage+FLImage.h
//  OcO
//
//  Created by Fay on 2018/6/22.
//

#import <UIKit/UIKit.h>

@interface UIImage (FLImage)

/**
 水印图片
 @params image 原始图片
 @params string 添加的文字
 @params rect 范围
 @return 修改后的图片
 */
- (UIImage *)watermarkingWithOriginalImage:(UIImage *)image drawString:(NSString *)string inRect:(CGRect)rect;

/**
 裁剪图片
 @params image 原始图片
 @params rect 范围
 @return 修改后的图片
 */
- (UIImage *)cutOutImage:(UIImage *)image inRect:(CGRect)rect;

/**
 去除图片方向
 @params image 原始图片
 @return 修改后的图片
 */
- (UIImage *)removeRotationForImage:(UIImage *)image;

/**
 将图片裁剪成正方形
 @params image 原始图片
 @return rect 范围
 */
- (UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size;

@end
