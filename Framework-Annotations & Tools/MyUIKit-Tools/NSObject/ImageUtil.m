/*
 * ImageUtil.m
 * 白开水ln（https://github.com/CustomPBWaters）
 *
 * Created by 【WechatPublic-Codeidea】 on Elegant programming16.
 * Copyright © Reprinted（https://githubidea.github.io）Please indicate the source.Mustbe.
 *
 * http://www.jianshu.com/u/fd745d76c816
 *
 * @HEADER_WELCOME YOU TO JOIN_GitHub & Codeidea_END@
 */

#import "ImageUtil.h"

@implementation ImageUtil

//添加文字水印
+ (UIImage *)ln_addText:(UIImage *)useImage text:(NSString *)text
{
    float width = useImage.size.width;
    float height = useImage.size.height;
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    [text drawAtPoint:CGPointMake(width/2, height-20) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Georgia" size:15],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

//图片
+ (UIImage *)ln_waterMark:(UIImage *)useImage andImage:(UIImage *)newImage
{
    float width = useImage.size.width;
    float height = useImage.size.height;
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    [newImage drawInRect:CGRectMake(width/2, height-20, 18, 18)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

//图片和文字
+ (UIImage *)ln_waterMark:(UIImage *)useImage andImage:(UIImage *)newImage text:(NSString *)text
{
    float width = useImage.size.width;
    float height = useImage.size.height;
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    [newImage drawInRect:CGRectMake(width/2, height-20, 18, 18)];
    [text drawAtPoint:CGPointMake(width/2 + 25, height-20) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Georgia" size:15],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

//截屏
+ (UIImage *)ln_screenShot:(UIView *)view
{
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    
    UIGraphicsBeginImageContext(mainRect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillRect(context, mainRect);
    [view.layer renderInContext:context];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
#START_COPYRIGHT__JIANSHU_BAIKAISHUILN__WechatPublic_Codeidea__END
