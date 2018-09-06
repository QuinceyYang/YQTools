//
//  YQTools.h
//  Useful methods
//
//  Created by QuinceyYang on 3/9/15.
//  Copyright (c) 2015 QuinceyYang. All rights reserved.
//

#import "YQTools.h"

@implementation YQTools

/**
 *  获取当前时间的时间戳（例子：1464326536）
 *
 *  @return 时间戳字符串型
 */
+ (NSString *)getCurrentTimestamp
{
    //获取系统当前的时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    // 转为字符型
    return timeString;
}

/**
 *  获取当前标准时间（例子：2015-02-03）
 *
 *  @return 标准时间字符串型
 */
+ (NSString *)getCurrentStandarTime
{
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyyMMddHHMMss"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

/**
 *  时间戳转换为时间的方法
 *
 *  @param timestamp 时间戳
 *
 *  @return 标准时间字符串
 */
+ (NSString *)timestampChangesStandarTime:(NSString *)timestamp
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyyMMddHHMMss"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
    
}
+(NSString *)timeToweek:(NSString *)time{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *formatterDate = [inputFormatter dateFromString:time];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    //    [outputFormatter setDateFormat:@"HH:mm 'on' EEEE MMMM d"];
    // For US English, the output is:
    // newDateString 10:30 on Sunday July 11
    [outputFormatter setDateFormat:@"EEEE"];
    NSString *newDateString = [outputFormatter stringFromDate:formatterDate];
    return newDateString;
}

+(NSString *)compareFromDate:(NSDate *)from toDate:(NSDate *)to
{
    
    if (!to || !from) {
        return 0;
    }
    
    // 日历
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    // 时间片段 ：年  月  日  时 分 秒
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents * com = [calendar components:unit fromDate:from toDate:to options:0];
    NSInteger str = com.day*3600*24+com.hour*3600+com.minute*60+com.second;
    NSInteger day = str / (24 * 60 * 60);
    NSInteger hour = (str % (24 * 60 * 60)) / (60 * 60);
    NSInteger minute = ((str % (24 * 60 * 60)) % (60 * 60)) / 60;
    NSInteger second = ((str % (24 * 60 * 60)) % (60 * 60)) % 60;
    NSString *time = [NSString stringWithFormat:@"%ld天%ld时%ld分%ld秒",(long)day,(long)hour, (long)minute,(long)second];
    return time;
}

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}

+(NSInteger )compareDistanceFromDate:(NSDate *)from toDate:(NSDate *)to
{
    
    if (!to || !from) {
        return 0;
    }
    
    // 日历
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    // 时间片段 ：年  月  日  时 分 秒
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents * com = [calendar components:unit fromDate:from toDate:to options:0];
    NSInteger str = com.day*3600*24+com.hour*3600+com.minute*60+com.second;
    
    return str;
}

+(NSString *)compareFromTimeDate:(NSDate *)from toDate:(NSDate *)to
{
    
    if (!to || !from) {
        return 0;
    }
    
    // 日历
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    // 时间片段 ：年  月  日  时 分 秒
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents * com = [calendar components:unit fromDate:from toDate:to options:0];
    NSInteger str = com.day*3600*24+com.hour*3600+com.minute*60+com.second;
    NSInteger day = str / (24 * 60 * 60);
    NSInteger hour = (str % (24 * 60 * 60)) / (60 * 60);
    NSString *time = [NSString stringWithFormat:@"%ld:%ld",(long)day,(long)hour];
    return time;
}



+ (NSString *)compareNewDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSTimeInterval thirdPerDay = 24 * 60 * 60 *2;
    NSDate *today = [[NSDate alloc] init];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:today];
    NSDate *localDate = [today dateByAddingTimeInterval:interval];
    NSDate *tomorrow, *afterTomorrow;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay+interval];
    afterTomorrow = [today dateByAddingTimeInterval: thirdPerDay+interval];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[localDate description] substringToIndex:10];
    NSString * afterTomorrowString = [[afterTomorrow description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return @"今天";
    } else if ([dateString isEqualToString:afterTomorrowString])
    {
        return @"后天";
    }else if ([dateString isEqualToString:tomorrowString])
    {
        return @"明天";
    }
    else
    {
        return dateString;
    }
}

#pragma mark - 限制输入字符数
+ (void)limitChatCount:(NSNotification *)obj length:(NSInteger)count
{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = [textField.text copy];
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (textField.text.length > count)
        {
            NSRange rangeIndex = [textField.text rangeOfComposedCharacterSequenceAtIndex:count];
            if (rangeIndex.length == 1)
            {
                toBeString = [textField.text substringToIndex:count];
            }
            else
            {
                NSRange rangeRange = [textField.text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, count)];
                toBeString = [textField.text substringWithRange:rangeRange];
            }
        }
        else {
            toBeString = [textField.text substringToIndex:textField.text.length];
        }
        
        //转换为大写
        toBeString = toBeString.uppercaseString;
        
        textField.text = toBeString;
    }
    
}

/// 限制特定的字符输入，限制字符串长度
+ (void)limitCharCount:(NSNotification *)obj inString:inString length:(NSInteger)count
{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = [textField.text copy];
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (textField.text.length > count)
        {
            NSRange rangeIndex = [textField.text rangeOfComposedCharacterSequenceAtIndex:count];
            if (rangeIndex.length == 1)
            {
                toBeString = [textField.text substringToIndex:count];
            }
            else
            {
                NSRange rangeRange = [textField.text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, count)];
                toBeString = [textField.text substringWithRange:rangeRange];
            }
        }
        else {
            toBeString = [textField.text substringToIndex:textField.text.length];
        }
        
        //转换为大写
        toBeString = toBeString.uppercaseString;
        
        //过滤特殊字符
        NSRange range = NSMakeRange(0, toBeString.length);
        if (inString) {
            for (NSInteger i=0; i<toBeString.length; i++) {
                NSString *sub = [toBeString substringWithRange:NSMakeRange(i, 1)];
                if (![inString containsString:sub]) {
                    range = NSMakeRange(0, i);
                    break;
                }
            }
        }
        textField.text = [toBeString substringWithRange:range];
    }
    
}

@end

