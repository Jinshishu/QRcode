//
//  UIFont+MyFont.m
//  Demo-QRcode
//
//  Created by Daniel on 16/6/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "UIFont+MyFont.h"
#import "UIView+Frame.h"

@implementation UIFont (MyFont)

+ (UIFont *)fontWithSize:(CGFloat)size {
    CGFloat realSize = size *ratio;
    return [UIFont systemFontOfSize:realSize];
}

@end
