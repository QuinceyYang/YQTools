//
//  YQTools.h
//  Useful methods
//
//  Created by QuinceyYang on 3/9/15.
//  Copyright (c) 2015 QuinceyYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YQTools : NSObject


/**
 *  获取当前时间的时间戳（例子：1464326536）
 *
 *  @return 时间戳字符串型
 */
+ (NSString *)getCurrentTimestamp;

/**
 *  获取当前标准时间（例子：2015-02-03）
 *
 *  @return 标准时间字符串型
 */
+ (NSString *)getCurrentStandarTime;

/**
 *  时间戳转换为时间的方法
 *
 *  @return 标准时间字符串 1464326536 ——》 2015-02-03
 */
+ (NSString *)timestampChangesStandarTime:(NSString *)timestam;
//时间转换星期
+(NSString *)timeToweek:(NSString *)time;
+(NSString *)compareFromDate:(NSDate *)from toDate:(NSDate *)to;
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+(NSInteger )compareDistanceFromDate:(NSDate *)from toDate:(NSDate *)to;
+(NSString *)compareFromTimeDate:(NSDate *)from toDate:(NSDate *)to;
+(NSString *)compareNewDate:(NSDate *)date;



+ (void)limitChatCount:(NSNotification *)obj length:(NSInteger)cout;

/**
 * 限制特定的字符输入，限制字符串长度
 */
+ (void)limitCharCount:(NSNotification *)obj inString:inString length:(NSInteger)count;
@end

