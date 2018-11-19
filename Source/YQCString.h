//
//  YQCString.h
//  YQCalculator
//
//  Created by 杨清 on 2018/11/15.
//  Copyright © 2018 QuinceyYang. All rights reserved.
//

#ifndef YQCString_h
#define YQCString_h

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define YQCString_MAXSIZE    0x1000

typedef struct {
    int location;
    int length;
} YQRange;


/**
 * 获得子字符串（从index到末尾），用dst返回其值
 */
bool substringFromIndex(char *src, int index, char *dst);

/**
 * 获得子字符串（从开头到index），用dst返回其值
 */
bool substringToIndex(char *src, int index, char *dst);

/**
 * 获得子字符串（范围为range），用dst返回其值
 */
bool substringWithRange(char *src, YQRange range, char *dst);

/**
 * src字符串是否以str开头
 */
bool hasPrefix(char *src, char *str);

/**
 * src字符串是否以str结尾
 */
bool hasSuffix(char *src, char *str);


//-------------- 可变操作 ---------------------
/**
 * 将src字符串的range范围替换成dst字符串
 */
bool replaceCharsInRange(char *src, YQRange range, char *dst);

/**
 * 将dst字符串插入到src字符串的index位置
 */
bool insertStringAtIndex(char *src, unsigned long index, char *dst);

/**
 * 删除src的range范围的字符串
 */
bool deleteInRange(char *src, YQRange range);



#endif /* YQCString_h */
