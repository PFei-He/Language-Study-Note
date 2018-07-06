//
//  UIImage+FLImage.m
//  OcO
//
//  Created by Fay on 2018/6/22.
//

#import "UIImage+FLImage.h"

@implementation UIImage (FLImage)

// 添加水印
- (UIImage *)watermarkingWithOriginalImage:(UIImage *)image drawString:(NSString *)string /*waterImage:(UIImage *)waterImage*/ inRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(image.size);
    
    // 原始图片渲染
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //    CGFloat waterX = originalImage.size.width - 200;
    //    CGFloat waterY = originalImage.size.height - 200;
    //    CGFloat waterW = 200;
    //    CGFloat waterH = 200;
    //
    //    // 打入的水印图片 渲染
    //    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 打入的水印的文字渲染
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary * dic = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:50],
                           NSParagraphStyleAttributeName : paragraphStyle,
                           NSForegroundColorAttributeName : [UIColor colorWithRed:1/255.0f green:124/255.0f blue:27/255.0f alpha:1]
                           };
    
    [string drawInRect:rect withAttributes:dic];
    
    UIGraphicsEndPDFContext();
    
    UIImage * imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    return imageNew;
}

// 裁剪图片
- (UIImage *)cutOutImage:(UIImage *)image inRect:(CGRect)rect
{
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [image CGImage];
    
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    
    //将CGImageRef转换成UIImage
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    //返回剪裁后的图片
    return newImage;
}

// 去除图片方向
- (UIImage *)removeRotationForImage:(UIImage *)image
{
    if (image.imageOrientation == UIImageOrientationUp) return image;
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    [image drawInRect:(CGRect){0, 0, image.size}];
    UIImage *normalizedImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

// 将图片裁剪成正方形
- (UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size
{
    //被切图片宽比例比高比例小 或者相等，以图片宽进行放大
    if (image.size.width*size.height <= image.size.height*size.width) {
        
        //以被剪裁图片的宽度为基准，得到剪切范围的大小
        CGFloat width  = image.size.width;
        CGFloat height = image.size.width * size.height / size.width;
        
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [self cutOutImage:image inRect:CGRectMake(0, (image.size.height -height)/2, width, height)];
        
    } else { //被切图片宽比例比高比例大，以图片高进行剪裁
        
        // 以被剪切图片的高度为基准，得到剪切范围的大小
        CGFloat width  = image.size.height * size.width / size.height;
        CGFloat height = image.size.height;
        
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [self cutOutImage:image inRect:CGRectMake((image.size.width -width)/2, 0, width, height)];
    }
    return nil;
}

@end
