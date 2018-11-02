//
//  XMKeyBoardView.h
//  chexiaoxi
//
//  Created by 风吹裤衩 on 2018/6/30.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMBasekeyBoardView.h"
#import "XMNumberkeyBoard.h" // 数字键盘 随机键盘 身份证键盘
#import "XMWordKeyBoardView.h" //字母键盘
#import "XMNumStrongKeyBoard.h" //数字加强
typedef NS_ENUM(NSInteger,XMkeyBoardType) {
    XMkeyBoardType_Default = 0 , //系统自带键盘
    XMkeyBoardType_Word , //字母键盘
    XMkeyBoardType_Number, //数字键盘
    XMkeyBoardType_OnlyNumber, //数字键盘
    XMkeyBoardType_RandomNumber, // 随机数字键盘
    XMkeyBoardType_StrongNumber,// 数字加强键盘
    XMkeyBoardType_IDCardNumber,// 身份证键盘
    XMkeyBoardType_Emotion,// emoji 键盘
};

@interface XMKeyBoardView : XMBasekeyBoardView<XMkeyBoardViewDelegate>


@property (nonatomic,assign)XMkeyBoardType XMKeyBoardType; ///键盘属性



@end
