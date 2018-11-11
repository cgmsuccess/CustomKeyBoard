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
#import "XMNumberKeyBoardStyleOne.h" //数字键盘风格1
#import "XMKeyBoardHeader.h"
@interface XMKeyBoardView : XMBasekeyBoardView<XMkeyBoardViewDelegate>


@property (nonatomic,assign)XMkeyBoardType XMKeyBoardType; ///键盘属性



@end
