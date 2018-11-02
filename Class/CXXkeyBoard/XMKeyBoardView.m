//
//  XMKeyBoardView.m
//  chexiaoxi
//
//  Created by 风吹裤衩 on 2018/6/30.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMKeyBoardView.h"

@interface XMKeyBoardView()

@property (nonatomic,strong)XMNumberkeyBoard *numKeyBoard; /// 数字键盘
@property (nonatomic,strong)XMNumberkeyBoard *randomNumKeyBoard; /// 数字随机键盘
@property (nonatomic,strong)XMNumberkeyBoard *cardIDKeyBoard; /// 身份证键盘
@property (nonatomic,strong)XMNumberkeyBoard *onlynumberKeyBoard; /// 纯数字键盘
@property (nonatomic,strong)XMWordKeyBoardView *wordKeyBoard;/// 文字键盘
@property (nonatomic,strong)XMNumStrongKeyBoard *strongNumKeyBoard; /// 数字加强键盘
@property (nonatomic,assign)XMkeyBoardType creatXMKeyBoardType; ///记录创建的时候是什么键盘

@end

@implementation XMKeyBoardView

-(instancetype)init
{
    if (self = [super init]) {
        [self setUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    _creatXMKeyBoardType = 0 ; //默认创建时候是 系统默认的键盘
}

-(void)setXMKeyBoardType:(XMkeyBoardType)XMKeyBoardType
{
    _XMKeyBoardType = XMKeyBoardType;
    
    if (_creatXMKeyBoardType == 0) { //确保记录创建时候的键盘。只设置一次。
        _creatXMKeyBoardType = XMKeyBoardType ; //记录创建时候的键盘
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    switch (self.XMKeyBoardType) {
        case XMkeyBoardType_Default:
            break;
        case XMkeyBoardType_Number:
            [self addSubview:self.numKeyBoard];
            break;
        case XMkeyBoardType_Word:
            [self addSubview:self.wordKeyBoard];
            break;
        case XMkeyBoardType_RandomNumber:
            [self addSubview:self.randomNumKeyBoard];
            break;
        case XMkeyBoardType_StrongNumber:
            [self addSubview:self.strongNumKeyBoard];
            break;
        case XMkeyBoardType_IDCardNumber:
            [self addSubview:self.cardIDKeyBoard];
            break;
        case XMkeyBoardType_OnlyNumber:
            [self addSubview:self.onlynumberKeyBoard];
            break;
        default:
            break;
    }
}

#pragma mark XMkeyBoardViewDelegate
/**  点击了内容  */
-(UIButton *)XMcilckConten:(UIButton *)contenBtn
{
    if ([self.delegate respondsToSelector:@selector(XMcilckConten:)]) {
        [self.delegate XMcilckConten:contenBtn];
    }
    return contenBtn;
}

/**  点击了确定  */
-(UIButton *)XMcilckdetermine:(DetermineBtn *)determineBtn
{
    if ([self.delegate respondsToSelector:@selector(XMcilckdetermine:)]) {
        [self.delegate XMcilckdetermine:determineBtn];
    }
    return determineBtn;
}


/**  点击了清空  */
-(UIButton *)XMcilckClear:(ClearBtn *)clearBtn
{
    if ([self.delegate respondsToSelector:@selector(XMcilckClear:)]) {
        [self.delegate XMcilckClear:(ClearBtn *)clearBtn];
    }
    return  clearBtn;
}

/**  点击了退格  */
-(UIButton *)XMcilckDelete:(DeleteBtn *)deleteBtn
{
    if ([self.delegate respondsToSelector:@selector(XMcilckDelete:)]) {
        [self.delegate XMcilckDelete:deleteBtn];
    }
    return deleteBtn;
}

/**  隐藏键盘  */
-(UIButton *)XMcilckHidden:(HiddenBtn *)hiddenBtn
{
    if ([self.delegate respondsToSelector:@selector(XMcilckHidden:)]) {
        [self.delegate XMcilckHidden:hiddenBtn];
    }
    return hiddenBtn;
}

/**  点击了空格  */
-(UIButton *)XMcilckspace:(SpaceBtn *)spaceBtn
{
    if ([self.delegate respondsToSelector:@selector(XMcilckspace:)]) {
        [self.delegate XMcilckspace:spaceBtn];
    }
    return spaceBtn;
}

/**  点击了固定输入内容的按钮，点击此按钮会清空以前的输入数据，显示此按钮输入的数据    */
-(UIButton *)XMcilckfixedBtn:(fixedBtn *)fixedBtn
{
    if ([self.delegate respondsToSelector:@selector(XMcilckfixedBtn:)]) {
        [self.delegate XMcilckfixedBtn:fixedBtn];
    }
    return fixedBtn;
}

/**  切换键盘  */
-(UIButton *)XMcilckswitch:(SwitchBtn *)switchBtn
{
    if ([switchBtn.titleLabel.text isEqualToString:@"ABC"]) {
        self.XMKeyBoardType = XMkeyBoardType_Word ;
        for (UIView *subview in self.subviews) {
            if ([[subview class] isEqual:[XMNumberkeyBoard class]]) {
                [subview removeFromSuperview]; //移除
            }
        }
        [self setNeedsLayout];

    }else if([switchBtn.titleLabel.text isEqualToString: @"123"]){
        if(_creatXMKeyBoardType == XMkeyBoardType_RandomNumber){//如果创建的时候是随机数字键盘
            self.XMKeyBoardType = XMkeyBoardType_RandomNumber; //切换随机数组键盘
        }else{
            //切换为数字键盘
            self.XMKeyBoardType = XMkeyBoardType_Number;
        }
        for (UIView *subview in self.subviews) {
            if ([[subview class] isEqual:[XMWordKeyBoardView class]]) {
                [subview removeFromSuperview]; //移除
            }
        }
        [self setNeedsLayout]; //重绘
    }
    return switchBtn;
}

#pragma mark Lazy

/**   身份证键盘   */
-(XMNumberkeyBoard *)cardIDKeyBoard
{
    if (!_cardIDKeyBoard) {
        _cardIDKeyBoard = [[XMNumberkeyBoard alloc] initWithIDCard:CGRectZero];
        _cardIDKeyBoard.delegate = self;
        _cardIDKeyBoard.height = keyBoardHeight;
        _cardIDKeyBoard.width  = self.width;
        _cardIDKeyBoard.x = 0 ;
        _cardIDKeyBoard.y = 0 ;
    }
    return _cardIDKeyBoard;
}

/**   数字键盘   */
-(XMNumberkeyBoard *)numKeyBoard
{
    if (!_numKeyBoard) {
        _numKeyBoard = [[XMNumberkeyBoard alloc] init];
        _numKeyBoard.delegate = self;
        _numKeyBoard.height = keyBoardHeight;
        _numKeyBoard.width  = self.width;
        _numKeyBoard.x = 0 ;
        _numKeyBoard.y = 0 ;
    }
    return _numKeyBoard;
}

/**   随机键盘没有做成懒加载。确保每次键盘都要改变   */
-(XMNumberkeyBoard *)randomNumKeyBoard
{
        _randomNumKeyBoard = [[XMNumberkeyBoard alloc] initWithFrameRandom:CGRectZero];
        _randomNumKeyBoard.delegate = self;
        _randomNumKeyBoard.height = keyBoardHeight;
        _randomNumKeyBoard.width  = self.width;
        _randomNumKeyBoard.x = 0 ;
        _randomNumKeyBoard.y = 0 ;
    
    return _randomNumKeyBoard;
}

/**   数字加强键盘   */
-(XMNumStrongKeyBoard *)strongNumKeyBoard
{
    if (!_strongNumKeyBoard) {
        _strongNumKeyBoard = [[XMNumStrongKeyBoard alloc] init];
        _strongNumKeyBoard.delegate = self;
        _strongNumKeyBoard.height = keyBoardHeight;
        _strongNumKeyBoard.width  = self.width;
        _strongNumKeyBoard.x = 0 ;
        _strongNumKeyBoard.y = 0 ;
    }
    return _strongNumKeyBoard;
}

//**  存数字键盘  */
-(XMNumberkeyBoard *)onlynumberKeyBoard
{

    if (!_onlynumberKeyBoard) {
        _onlynumberKeyBoard = [[XMNumberkeyBoard alloc] initWithOnlyKeyBoard:CGRectZero];
        _onlynumberKeyBoard.delegate = self;
        _onlynumberKeyBoard.height = keyBoardHeight;
        _onlynumberKeyBoard.width  = self.width;
        _onlynumberKeyBoard.x = 0 ;
        _onlynumberKeyBoard.y = 0 ;
    }
    return _onlynumberKeyBoard;
}


/**   字母键盘   */
-(XMWordKeyBoardView *)wordKeyBoard
{
    if (!_wordKeyBoard) {
        _wordKeyBoard = [[XMWordKeyBoardView alloc] init];
        _wordKeyBoard.delegate = self;
        _wordKeyBoard.height = keyBoardHeight ;
        _wordKeyBoard.width  = self.width;
    }
    return _wordKeyBoard;
}

@end
