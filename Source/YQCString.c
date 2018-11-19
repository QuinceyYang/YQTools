//
//  YQCString.c
//  YQCalculator
//
//  Created by 杨清 on 2018/11/15.
//  Copyright © 2018 QuinceyYang. All rights reserved.
//

#include "YQCString.h"


/**
 *
 */
bool substringFromIndex(char *src, int index, char *dst) {
    unsigned long len = strlen(src);
    if (index >= len || index < 0) {
        return false;
    }
    memcpy(dst, src+index, len-index);
    return true;
}

/**
 *
 */
bool substringToIndex(char *src, int index, char *dst) {
    unsigned long len = strlen(src);
    if (index > len || index <= 0) {
        return false;
    }
    memcpy(dst, src, index);
    return true;
}

bool substringWithRange(char *src, YQRange range, char *dst) {
    unsigned long len = strlen(src);
    if (range.location >= len || range.location < 0) {
        return false;
    }
    if (range.location+range.length > len) {
        return false;
    }
    memcpy(dst, src+range.location, range.length);
    return true;
}

bool hasPrefix(char *src, char *str) {
    if (strstr(src, str) == src) {
        return true;
    }
    else {
        return false;
    }
}
bool hasSuffix(char *src, char *str) {
    unsigned long srcLen = strlen(src);
    unsigned long strLen = strlen(str);
    if (strLen > srcLen) {
        return false;
    }
    unsigned long dLen = srcLen-strLen;
    for (unsigned long i=dLen; i<srcLen; i++) {
        if (src[i] != str[i-dLen]) {
            return false;
        }
    }
    
    return true;
}

/***
YQRange rangeOfString(char *src, char *str) {
    YQRange range = {.location=-1, .length=-1};
    
    return range;
}
***/

//-------------- 可变操作 ---------------------
bool replaceCharsInRange(char *src, YQRange range, char *dst) {
    unsigned long srclen = strlen(src);
    if (range.location >= srclen || range.location < 0) {
        return false;
    }
    if (range.location+range.length > srclen) {
        return false;
    }
    char left[YQCString_MAXSIZE] = {0,};
    char right[YQCString_MAXSIZE] = {0,};
    if (range.location > 0) {
        memcpy(left, src, range.location);
    }
    if (range.location+range.length < srclen) {
        memcpy(right, src+range.location+range.length, srclen-(range.location+range.length));
    }
    memset(src, 0, srclen);
    if (strlen(left) > 0) {
        strcat(src, left);
    }
    if (strlen(dst) > 0) {
        strcat(src, dst);
    }
    if (strlen(right) > 0) {
        strcat(src, right);
    }
    return true;
}

bool insertStringAtIndex(char *src, unsigned long index, char *dst) {
    unsigned long srclen = strlen(src);
    if (index < 0 || index >= srclen) {
        return false;
    }
    char left[YQCString_MAXSIZE] = {0,};
    char right[YQCString_MAXSIZE] = {0,};
    if (index > 0) {
        strncpy(left, src, index);
    }
    if (index < srclen) {
        strcpy(right, src+index);
    }
    memset(src, 0, srclen);
    if (strlen(left) > 0) {
        strcat(src, left);
    }
    if (strlen(dst) > 0) {
        strcat(src, dst);
    }
    if (strlen(right) > 0) {
        strcat(src, right);
    }
    return true;
}

bool deleteInRange(char *src, YQRange range) {
    unsigned long srclen = strlen(src);
    if (range.location >= srclen || range.location < 0) {
        return false;
    }
    if (range.location+range.length > srclen) {
        return false;
    }
    char left[YQCString_MAXSIZE] = {0,};
    char right[YQCString_MAXSIZE] = {0,};
    if (range.location > 0) {
        memcpy(left, src, range.location);
    }
    if (range.location+range.length < srclen) {
        memcpy(right, src+range.location+range.length, srclen-(range.location+range.length));
    }
    memset(src, 0, srclen);
    if (strlen(left) > 0) {
        strcat(src, left);
    }
    if (strlen(right) > 0) {
        strcat(src, right);
    }
    return true;
}
