//
//  CreateQRCode.h
//  Demo-QRcode
//
//  Created by Daniel on 16/6/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CreateQRCode : NSObject

/**
 *  根据传来的字符串来生成相应的二维码
 *
 *  @param string         传入的字符串
 *  @param viewController 调用方法时当前的viewController
 *
 *  @return UIImage(二维码 )
 */
+ (UIImage *)createQRCodeWithString:(NSString *)string ViewCibtroller:(UIViewController *)viewController;

@end
