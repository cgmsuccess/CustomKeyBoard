//
//  XMNumberKeyBoardStyleOne.m
//  XMTXCustomKeyBoard
//
//  Created by 风吹裤衩 on 2018/11/11.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMNumberKeyBoardStyleOne.h"

@interface XMNumberKeyBoardStyleOne()

//注释:- 退格
@property (nonatomic,strong)DeleteBtn  *deleteBtn ;

//注释:- 确定
@property (nonatomic,strong)DetermineBtn *determineBtn ;

@end

@implementation XMNumberKeyBoardStyleOne


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
    NSMutableArray *dataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@"."].mutableCopy;
    for (int i = 0; i < dataSource.count; i++) {
        NSString *str = dataSource[i];
        UIButton *btn;  
        btn = [self creatNormalBtn];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.layer.borderWidth = 0.25;
        btn.layer.borderColor = keyBoardBackviewcolor.CGColor;
        [self addSubview:btn];
    }
    [self addSubview:self.determineBtn];
    [self addSubview:self.deleteBtn];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    ///删除和确定按钮宽度
    CGFloat deleteWidth = Kwidth / 4 * 1.15;
    ///普通按钮的宽度
    CGFloat normalWidth = (Kwidth - deleteWidth) / 3;
    CGFloat normlbtnH = keyBoardHeight / XM_EmotionMaxRows;
    
    int i = 0 ;
    for (UIView *btn in self.subviews) {
        if (i >= self.subviews.count - 2) {
            break;
        }
        
        btn.width = normalWidth;
        btn.height = normlbtnH;
        btn.x = (i % 3) * normalWidth;
        btn.y = i / 3 * normlbtnH;
        i ++ ;
    }
    UIView *btn = self.subviews[2];
    self.deleteBtn.frame = CGRectMake(CGRectGetMaxX(btn.frame), 0, deleteWidth, normlbtnH * 2);
    self.determineBtn.frame = CGRectMake(CGRectGetMaxX(btn.frame), CGRectGetMaxY(self.deleteBtn.frame), deleteWidth, normlbtnH * 2);
}

#pragma mark lazy

-(DeleteBtn *)deleteBtn
{
    if (!_deleteBtn) {
        NSBundle *currenBundle = [NSBundle bundleForClass:[self class]];
        NSString *normalImagePath = [currenBundle pathForResource:@"newdelete@2x.png" ofType:nil inDirectory:@"KeyBoardSource.Bundle"];
        UIImage *image     = [UIImage imageWithContentsOfFile:normalImagePath];
        _deleteBtn = [self creatDeleteBtn];
        [_deleteBtn setImage:image forState:UIControlStateNormal];
        _deleteBtn.layer.borderWidth = 0.25;
        _deleteBtn.layer.borderColor = keyBoardBackviewcolor.CGColor;
    }
    return _deleteBtn;
}

-(DetermineBtn *)determineBtn
{
    if (!_determineBtn) {
        _determineBtn = [self creatDetermineBtnBtn];
        [_determineBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_determineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _determineBtn.backgroundColor = Color(117, 175, 239, 1);
        _determineBtn.layer.borderWidth = 0.25;
        _determineBtn.layer.borderColor = keyBoardBackviewcolor.CGColor;
    }
    return _determineBtn;
}

@end
