//
//  SystemFunctions.h
//  Demo-QRcode
//
//  Created by Daniel on 16/6/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SystemFunctions : NSObject

/**
 *  是否打开系统照明灯
 *
 *  @param opened 是否打开
 */
+ (void)openLight:(BOOL)opened;

/**
 *  是否开启系统震动和声音
 *
 *  @param shaked   是否开启震动
 *  @param sounding 是否开启声音
 */
+ (void)openShake:(BOOL)shaked Sound:(BOOL)sounding;

/**
 *  调用系统浏览器打开扫描的信息
 *
 *  @param message 扫描信息
 *  @param success 成功打开后返回的参数
 *  @param failure 打开失败后返回的error参数
 */
+ (void)showInSafariWithURLMessage:(NSString *)message Success:(void (^)(NSString *token))success Failure:(void (^)(NSError *error))failure;

@end
