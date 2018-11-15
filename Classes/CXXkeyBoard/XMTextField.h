//
//  XMTextField.h
//  XMTXCustomKeyBoard
//
//  Created by 风吹裤衩 on 2018/11/8.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMKeyBoardHeader.h"
@interface XMTextField : UITextField

@property (nonatomic,assign)XMkeyBoardType xmKeyBoardType; ///键盘属性 (数字，字母，随机密码键盘 等)

@property (nonatomic,assign)NSInteger maxInpuptLenth; ///限制键盘的输入长度 

@property (nonatomic,copy)XMCallBackBlock inputTextBlock; ///< 文字改变时候的回调

@end
