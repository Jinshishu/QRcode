//
//  CreateQRCode.m
//  Demo-QRcode
//
//  Created by Daniel on 16/6/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "CreateQRCode.h"

@implementation CreateQRCode

+ (UIImage *)createQRCodeWithString:(NSString *)string ViewCibtroller:(UIViewController *)viewController {
    if ([string isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"二维码生成信息不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
        [viewController presentViewController:alertController animated:YES completion:nil];
        return nil;
    }
    //二维码滤镜
    CIFilter *filer = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //回复滤镜的默认属性
    [filer setDefaults];
    //将字符串转化成NSData
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //通过KVO设置滤镜inputmessage数据
    [filer setValue:data forKey:@"inputMessage"];
    //获取滤镜输出的图像
    CIImage *outputImage = [filer outputImage];
    //将CIImage转化成UIImage,并放大显示
    UIImage *image = [UIImage new];
    CreateQRCode *create = [CreateQRCode new];
    image = [create createNonInterpolatedUIImageFormCIImage:outputImage withSize:200];
    return image;
}

/**
 *  改变二维码大小
 *
 *  @param image 传入的image
 *  @param size  设置的大小
 *
 *  @return 返回改变后的image
 */
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    //创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end
