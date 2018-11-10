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
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick:(UIButton *)cilckBtn
{
    if (self.cilckBlock) {
        self.cilckBlock(cilckBtn);
    }
    if ([[cilckBtn class] isEqual:[CapsLockBtn class]]) {
        [self.delegate xmClicklowExchangeAcapital:(CapsLockBtn *)cilckBtn];  //大小写切换
    }
    else if([[cilckBtn class] isEqual:[DeleteBtn class]]){
        [self.delegate xmClickDelete:(DeleteBtn *)cilckBtn]; //退格
    }
    else if([[cilckBtn class] isEqual:[SwitchBtn class]]){
        [self.delegate xmClickswitch:(SwitchBtn *)cilckBtn];//切换word和数字键盘
    }
    else if([[cilckBtn class] isEqual:[HiddenBtn class]]){ // 隐藏
        [self.delegate xmClickHidden:(HiddenBtn *)cilckBtn];
    }
    else if([[cilckBtn class] isEqual:[SpaceBtn class]]){// 空格
        [self.delegate xmClickspace:(SpaceBtn *)cilckBtn];
    }
    else if([[cilckBtn class] isEqual:[DetermineBtn class]]){ //确定
        [self.delegate xmClickdetermine:(DetermineBtn *)cilckBtn];
    }
    else if([[cilckBtn class] isEqual:[ClearBtn class]]){ //请客
        [self.delegate xmClickClear:(ClearBtn *)cilckBtn];
    }
    else{
        [self.delegate xmClickConten:cilckBtn]; //字母按钮
    }
}

/**  点击了字母  */
-(UIButton *)xmClickConten:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(xmClickConten:)]) {
        [self.delegate xmClickConten:btn];
    }
    return btn;
}

/** 大小写切换事件处理 ，不作处理子类实现此方法  */
-(UIButton *)xmClicklowExchangeAcapital:(UIButton *)btn
{

    return btn;
}

/** 退格   */
-(DeleteBtn *)xmClickDelete:(DeleteBtn *)btn
{
    if ([self.delegate respondsToSelector:@selector(xmClickDelete:)]) {
        [self.delegate xmClickDelete:btn];
    }
    return btn;
}

/**  数字字母切换  */
-(SwitchBtn *)xmClickswitch:(SwitchBtn *)btn
{
    if ([self.delegate respondsToSelector:@selector(xmClickswitch:)]) {
        [self.delegate xmClickswitch:btn];
    }
    return btn;
}

/**  隐藏键盘  */
-(HiddenBtn *)xmClickHidden:(HiddenBtn *)btn
{
    if ([self.delegate respondsToSelector:@selector(xmClickHidden:)]) {
        [self.delegate xmClickHidden:btn];
    }
    return btn;
}

/**  点击了空格  */
-(SpaceBtn *)xmClickspace:(SpaceBtn *)btn
{
    if ([self.delegate respondsToSelector:@selector(xmClickspace:)]) {
        [self.delegate xmClickspace:btn];
    }
    return btn;
}

/**  点击了确定  */
-(DetermineBtn *)xmClickdetermine:(DetermineBtn *)btn
{
    if ([self.delegate respondsToSelector:@selector(xmClickdetermine:)]) {
        [self.delegate xmClickdetermine:btn];
    }
    return btn;
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

