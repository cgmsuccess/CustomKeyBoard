//
//  XMNumStrongKeyBoard.m
//  XC_SmallTool
//
//  Created by 风吹裤衩 on 2018/7/11.
//  Copyright © 2018年 gao bin. All rights reserved.
//


#import "XMNumStrongKeyBoard.h"

@implementation XMNumStrongKeyBoard

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    [super setUI];
    UIButton *butn ;
    NSArray *arr = @[@"100",@"500",@"1000",@"2000",@"5000"];
    for (int i = 0; i < arr.count; i++) {
        butn = [self creatfixedBtn];
        butn.tag = 200 + i ;
        [butn setTitle:arr[i] forState:UIControlStateNormal];
        butn.layer.borderWidth = 0.25;
        butn.layer.borderColor = keyBoardBtnColor.CGColor;
        [self addSubview:butn];
    }
    
    NSArray *arr1 =  @[@"1",@"2",@"3",@"退格",@"4",@"5",@"6",@"清空",@"7",@"8",@"9",@"隐藏",@"0",@"00",@"000",@"确定"];
    for (int i = 0; i < arr1.count; i++) {
        if (i == 3) {  //退格
            butn = [self creatDeleteBtn];
        }else if(i == 7){ //清空
            butn = [self creatClearBtn];
        }else if(i == 11){ //隐藏
            butn = [self creatHiddenBtn];
        }else if(i == 15){ // 确定
            butn = [self creatDetermineBtnBtn];
        }else{
            butn = [self creatNormalBtn]; //普通按钮
        }
        
        butn.tag = 205 + i ;
        [butn setTitle:arr1[i] forState:UIControlStateNormal];
        butn.layer.borderWidth = 0.25;
        butn.layer.borderColor = keyBoardBtnColor.CGColor;
        [self addSubview:butn];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.width  / 5;

    for (UIView *view in self.subviews) {
        if (view.tag < 205) {
            CGFloat btnH = keyBoardHeight/ 5 + 0.22;
            view.width = btnW;
            view.height = btnH;
            view.x = 0 ;
            view.y =  (view.tag - 200 ) * btnH ;
        }
        // 4 x 4
        if (view.tag >= 205) {
            CGFloat btnH = keyBoardHeight  / XM_EmotionMaxRows;
            
            view.width = btnW;
            view.height = btnH;
            view.x = ((view.tag - 205 )%XM_EmotionMaxCols) * btnW + btnW  ;
            view.y = ((view.tag - 205 )/XM_EmotionMaxCols) * btnH  ;
        }
    }
}

@end
