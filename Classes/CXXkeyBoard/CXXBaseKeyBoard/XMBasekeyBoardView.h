//
//  XMBasekeyBoardView.h
//  chexiaoxi
//
//  Created by 风吹裤衩 on 2018/6/29.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
/*
*********************************************************************************
*
* 这里 自定义键盘的公共配置和基类。  考虑以后扩展，暂时做个base 放在这里
*
*
* 里面实现了创建按，删除。退格等 创建方式。子类继承此类，实现对应UI即可
*
*********************************************************************************
*/

#import <UIKit/UIKit.h>
#import "XMKeyBoardHeader.h"


@class SwitchBtn,DeleteBtn,ClearBtn,HiddenBtn,DetermineBtn,CapsLockBtn,SpaceBtn,fixedBtn;

typedef NS_ENUM(NSInteger,XMKeyBoardBtnType)
{
    XMKeyBoardBtnType_Cancle, //取消
    XMKeyBoardBtnType_Clear,//清空
    XMKeyBoardBtnType_Dlelte,//退格
    XMKeyBoardBtnType_Hidden,//隐藏
};

@protocol XMkeyBoardViewDelegate<NSObject>

@optional

/**  点击了键盘上的内容按钮  */
-(UIButton *)xmClickConten:(UIButton *)contenBtn;

/**  点击了键盘上的删除按钮  */
-(DeleteBtn *)xmClickDelete:(DeleteBtn *)deleteBtn;

/**  点击了键盘上的清空按钮  */
-(ClearBtn *)xmClickClear:(ClearBtn *)clearBtn;

/**  点击了键盘上的隐藏按钮  */
-(HiddenBtn *)xmClickHidden:(HiddenBtn *)hiddenBtn;

/**  点击了键盘上的确定按钮  */
-(DetermineBtn *)xmClickdetermine:(DetermineBtn *)determineBtn;

/**  点击了键盘上的切换按钮  */
-(SwitchBtn *)xmClickswitch:(SwitchBtn *)switchBtn;

/**  点击了键盘上的字母大小写的切换按钮  */
-(CapsLockBtn *)xmClickcapsLock:(CapsLockBtn *)switchBtn;

/**  点击了键盘上的空格  */
-(SpaceBtn *)xmClickspace:(SpaceBtn *)spaceBtn;

/**  点击了键盘上的固定按钮  */
-(fixedBtn *)xmClickfixedBtn:(fixedBtn *)fixedBtn;

/** 大小写切换事件处理   */
-(UIButton *)xmClicklowExchangeAcapital:(UIButton *)btn;


@end


@interface DeleteBtn : UIButton

@end

@interface ClearBtn : UIButton

@end

@interface HiddenBtn : UIButton

@end

@interface DetermineBtn : UIButton

@end

@interface SwitchBtn : UIButton

@end

@interface SpaceBtn  : UIButton

@end

@interface CapsLockBtn : UIButton

@end

@interface fixedBtn : UIButton

@end

@interface XMBasekeyBoardView : UIView

/**  配置公共的UI  */
-(void)setUI ;

/**  点击事件传递  */
@property (nonatomic,copy)XMCallBackBlock cilckBlock;

@property (nonatomic,weak) id<XMkeyBoardViewDelegate> delegate;


/**   快速创建退格按钮   */
-(DeleteBtn *)creatDeleteBtn;

/**   快速创建清空按钮   */
-(ClearBtn *)creatClearBtn;

/**   快速创建隐藏按钮   */
-(HiddenBtn *)creatHiddenBtn;

/**   快速创建确定按钮   */
-(DetermineBtn *)creatDetermineBtnBtn;

/**   快速创建切换数字和字母的按钮   */
-(SwitchBtn *)creatSwitchBtn;

/**   快速创建空格按钮   */
-(SpaceBtn *)creatSpaceBtn;

/**   快速创建大小写切换按钮   */
-(CapsLockBtn *)creatCapsLockBtn;

/**   快速创建固定输入数字的按钮   */
-(fixedBtn *)creatfixedBtn;

/**   快速创建普通按钮   */
-(UIButton *)creatNormalBtn;


@end
