//
//  XMNumberkeyBoard.h
//  chexiaoxi
//
//  Created by 风吹裤衩 on 2018/6/29.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMBasekeyBoardView.h"

@interface XMNumberkeyBoard : XMBasekeyBoardView

/**   初始化普通键盘   */
-(instancetype)initWithFrame:(CGRect)frame;

/**   初始化随机键盘   */
-(instancetype)initWithFrameRandom:(CGRect)frame ;

/**   初始化身份证键盘   */
-(instancetype)initWithIDCard:(CGRect)frame ;;

/**   初始化纯数字的键盘   */
-(instancetype)initWithOnlyKeyBoard:(CGRect)frame ;;

@end
