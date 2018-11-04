//
//  XMKeyBoardHeader.h
//  chexiaoxi
//
//  Created by 风吹裤衩 on 2018/6/29.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
/*
               键盘的内部配置
*/

#ifndef XMKeyBoardHeader_h
#define XMKeyBoardHeader_h

typedef void(^XMEmptyBlock)(void);
typedef void(^XMCallBackBlock)(id userInfo);

#import "UIView+XMFrame.h"



//数组键盘 一页中最多4行
#define XM_EmotionMaxRows 4
//数组键盘 一行中最多7列
#define XM_EmotionMaxCols 4
// 键盘的默认高度
#define keyBoardHeight 219 
// 键盘的默认颜色
#define keyBoardBackviewcolor [UIColor colorWithRed:211/255.0f green:213/255.0f blue:210/255.0f alpha:1]

// 默认键盘按钮颜色
#define keyBoardBtnColor Color(224, 224, 244, 1)

#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define Kwidth [UIScreen mainScreen].bounds.size.width
#define Kheight [UIScreen mainScreen].bounds.size.height

/**  自定义打印打印   */
#ifdef DEBUG
#define XMLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define XMLog(format, ...)
#endif


#endif /* XMKeyBoardHeader_h */
