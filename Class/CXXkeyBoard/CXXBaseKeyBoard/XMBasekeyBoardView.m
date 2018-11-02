//
//  XMBasekeyBoardView.m
//  chexiaoxi
//
//  Created by 风吹裤衩 on 2018/6/29.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMBasekeyBoardView.h"

@implementation XMBasekeyBoardView

-(instancetype)init
{
    if (self = [super init]) {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    self.backgroundColor = keyBoardBackviewcolor;
}

/**   快速创建退格按钮   */
-(DeleteBtn *)creatDeleteBtn
{
    DeleteBtn *Btn = [DeleteBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

/**   快速创建清空按钮   */
-(ClearBtn *)creatClearBtn
{
    ClearBtn *Btn = [ClearBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

/**   快速创建隐藏按钮   */
-(HiddenBtn *)creatHiddenBtn
{
    HiddenBtn *Btn = [HiddenBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

/**   快速创建确定按钮   */
-(DetermineBtn *)creatDetermineBtnBtn
{
    DetermineBtn *Btn = [DetermineBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

/**   快速创建切换数字和字母的按钮   */
-(SwitchBtn *)creatSwitchBtn
{
    SwitchBtn *Btn = [SwitchBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

/**   快速创建空格按钮   */
-(SpaceBtn *)creatSpaceBtn
{
    SpaceBtn *Btn = [SpaceBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

/**   快速创建大小写切换按钮   */
-(CapsLockBtn *)creatCapsLockBtn
{
    CapsLockBtn *Btn = [CapsLockBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

/**   快速创建普通按钮   */
-(UIButton *)creatNormalBtn
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}
-(fixedBtn *)creatfixedBtn
{
    fixedBtn *Btn = [fixedBtn buttonWithType:UIButtonTypeCustom];
    [self defaultBtnConfiger:Btn];
    return Btn ;
}

-(void)defaultBtnConfiger:(UIButton *)btn
{
    btn.backgroundColor = [UIColor whiteColor];;
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
}


@end

@implementation SwitchBtn

@end

@implementation SpaceBtn

@end

@implementation DetermineBtn

@end

@implementation HiddenBtn

@end

@implementation ClearBtn

@end

@implementation DeleteBtn

@end

@implementation CapsLockBtn

@end

@implementation fixedBtn

@end

