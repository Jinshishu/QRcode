//
//  UIFont+MyFont.h
//  Demo-QRcode
//
//  Created by Daniel on 16/6/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MyFont)

/**
 *  设置字体方法：根据不同的手机型号，改变字体大小
 *
 *  @param size 当前机型下字体大小
 *
 *  @return 适配的字体大小
 */
+ (UIFont *)fontWithSize:(CGFloat)size;

@end
