//
//  Copyright (c) 2018 faylib.top
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
