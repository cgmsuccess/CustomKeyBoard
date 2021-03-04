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
@property (nonatomic,strong)XMNumberKeyBoardStyleOne *numberKeyboardstyleone;///数字键盘风格1
@property (nonatomic,strong)XMCharKeyBoardView *charKeyBoard ; ///< 字符键盘
@property (nonatomic,strong)XMCarNumHeaderKeyBoard *carNumHeaderKeyBoard ; ///< 车牌头键盘
@property (nonatomic,strong)CarContentKeyBoard *carContentNumKeyBoard ; ///< 车牌号码键盘
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
        case XMkeyBoardType_NumberStyleOne:
            [self addSubview:self.numberKeyboardstyleone];
            break;
        case XMkeyBoardType_charAndNumber:
            [self addSubview:self.charKeyBoard];
            break;
        case XMkeyBoardType_CarNumHeader:
            [self addSubview:self.carNumHeaderKeyBoard];
            break;
        case XMkeyBoardType_CarContentNumber:
            [self addSubview:self.carContentNumKeyBoard];
            break;
        default:
            break;
    }
}

#pragma mark XMkeyBoardViewDelegate
/**  点击了内容  */
-(UIButton *)xmClickConten:(UIButton *)contenBtn
{
    if ([self.delegate respondsToSelector:@selector(xmClickConten:)]) {
        switch (self.XMKeyBoardType) {
            case XMkeyBoardType_CarNumHeader:
                [self exhcnageCarContent:nil]; ///切换输入车牌号码的键盘
                break;
                
            default:
                break;
        }
        [self.delegate xmClickConten:contenBtn];
    }
    return contenBtn;
}

/**  点击了确定  */
-(UIButton *)xmClickdetermine:(DetermineBtn *)determineBtn
{
    if ([self.delegate respondsToSelector:@selector(xmClickdetermine:)]) {
        [self.delegate xmClickdetermine:determineBtn];
    }
    return determineBtn;
}


/**  点击了清空  */
-(UIButton *)xmClickClear:(ClearBtn *)clearBtn
{
    if ([self.delegate respondsToSelector:@selector(xmClickClear:)]) {
        [self.delegate xmClickClear:(ClearBtn *)clearBtn];
    }
    return  clearBtn;
}

/**  点击了退格  */
-(UIButton *)xmClickDelete:(DeleteBtn *)deleteBtn
{
    if ([self.delegate respondsToSelector:@selector(xmClickDelete:)]) {
        [self.delegate xmClickDelete:deleteBtn];
    }
    return deleteBtn;
}

/**  隐藏键盘  */
-(UIButton *)xmClickHidden:(HiddenBtn *)hiddenBtn
{
    if ([self.delegate respondsToSelector:@selector(xmClickHidden:)]) {
        [self.delegate xmClickHidden:hiddenBtn];
    }
    return hiddenBtn;
}

/**  点击了空格  */
-(UIButton *)xmClickspace:(SpaceBtn *)spaceBtn
{
    if ([self.delegate respondsToSelector:@selector(xmClickspace:)]) {
        [self.delegate xmClickspace:spaceBtn];
    }
    return spaceBtn;
}

/**  点击了固定输入内容的按钮，点击此按钮会清空以前的输入数据，显示此按钮输入的数据    */
-(UIButton *)xmClickfixedBtn:(fixedBtn *)fixedBtn
{
    if ([self.delegate respondsToSelector:@selector(xmClickfixedBtn:)]) {
        [self.delegate xmClickfixedBtn:fixedBtn];
    }
    return fixedBtn;
}

/**  切换键盘  */
-(UIButton *)xmClickswitch:(SwitchBtn *)switchBtn
{
    if ([switchBtn.titleLabel.text isEqualToString:@"ABC"]) {
        [self exchangePinyin:switchBtn];
    }else if([switchBtn.titleLabel.text isEqualToString: @"123"]){
        [self exchangeNumber:switchBtn];
    }else if([switchBtn.titleLabel.text isEqualToString: @"拼音"]){
        [self exchangePinyin:switchBtn];
    }else if([switchBtn.titleLabel.text isEqualToString: @"字符"]){
        [self exchangeChar:switchBtn];
    }else if([switchBtn.titleLabel.text isEqualToString: @"<-"]){
        [self exhcnageCarheader:switchBtn];
    }else if([switchBtn.titleLabel.text isEqualToString: @"更多"]){
        [self exhcnageCarContent:switchBtn];
    }
    return switchBtn;
}

//**  切换字符键盘  */
-(void)exchangeChar:(SwitchBtn *)switchBtn
{
    self.XMKeyBoardType = XMkeyBoardType_charAndNumber ;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

//**  切换拼音键盘  */
-(void)exchangePinyin:(SwitchBtn *)switchBtn
{
    self.XMKeyBoardType = XMkeyBoardType_Word ;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

//**  切换数字键盘  */
-(void)exchangeNumber:(SwitchBtn *)switchBtn
{
    if(_creatXMKeyBoardType == XMkeyBoardType_RandomNumber){//如果创建的时候是随机数字键盘
        self.XMKeyBoardType = XMkeyBoardType_RandomNumber; //切换随机数组键盘
    }else{
        //切换为数字键盘
        self.XMKeyBoardType = XMkeyBoardType_Number;
    }
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

//**  切换车牌省份键盘  */
-(void)exhcnageCarheader:(SwitchBtn *)switchBtn
{
    self.XMKeyBoardType = XMkeyBoardType_CarNumHeader ;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

//**  切换车牌省份键盘  */
-(void)exhcnageCarContent:(SwitchBtn *)switchBtn
{
    self.XMKeyBoardType = XMkeyBoardType_CarContentNumber ;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark Lazy

/**   身份证键盘   */
-(XMNumberkeyBoard *)cardIDKeyBoard
{
    if (!_cardIDKeyBoard) {
        _cardIDKeyBoard = [[XMNumberkeyBoard alloc] initWithIDCard:CGRectZero];
        _cardIDKeyBoard.delegate = self;
        _cardIDKeyBoard.height = keyBoardHeight;
        _cardIDKeyBoard.width  = Kwidth;
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
        _numKeyBoard.width  = Kwidth;
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
        _randomNumKeyBoard.width  = Kwidth;
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
        _strongNumKeyBoard.width  = Kwidth;
        _strongNumKeyBoard.x = 0 ;
        _strongNumKeyBoard.y = 0 ;
    }
    return _strongNumKeyBoard;
}

//**  车牌省份 键盘  */
-(XMCarNumHeaderKeyBoard *)carNumHeaderKeyBoard
{
    if (!_carNumHeaderKeyBoard) {
        _carNumHeaderKeyBoard = [[XMCarNumHeaderKeyBoard alloc] initWithFrame:CGRectZero];
        _carNumHeaderKeyBoard.delegate = self;
        _carNumHeaderKeyBoard.height = keyBoardHeight;
        _carNumHeaderKeyBoard.width  = Kwidth;
        _carNumHeaderKeyBoard.x = 0 ;
        _carNumHeaderKeyBoard.y = 0 ;
    }
    return _carNumHeaderKeyBoard;
}

//**  车牌号码键盘  */
-(CarContentKeyBoard *)carContentNumKeyBoard
{
    if (!_carContentNumKeyBoard) {
        _carContentNumKeyBoard = [[CarContentKeyBoard alloc] initWithFrame:CGRectZero];
        _carContentNumKeyBoard.delegate = self;
        _carContentNumKeyBoard.width = Kwidth;
        _carContentNumKeyBoard.height = keyBoardHeight;
        _carContentNumKeyBoard.x = 0 ;
        _carContentNumKeyBoard.y = 0 ;
    }
    return _carContentNumKeyBoard;
}

//**  纯数字键盘  */
-(XMNumberkeyBoard *)onlynumberKeyBoard
{
    if (!_onlynumberKeyBoard) {
        _onlynumberKeyBoard = [[XMNumberkeyBoard alloc] initWithOnlyKeyBoard:CGRectZero];
        _onlynumberKeyBoard.delegate = self;
        _onlynumberKeyBoard.height = keyBoardHeight;
        _onlynumberKeyBoard.width  = Kwidth;
        _onlynumberKeyBoard.x = 0 ;
        _onlynumberKeyBoard.y = 0 ;
    }
    return _onlynumberKeyBoard;
}

//**  纯数字键盘  */
-(XMNumberKeyBoardStyleOne *)numberKeyboardstyleone
{
    if (!_numberKeyboardstyleone) {
        _numberKeyboardstyleone = [[XMNumberKeyBoardStyleOne alloc] initWithFrame:CGRectZero];
        _numberKeyboardstyleone.delegate = self;
        _numberKeyboardstyleone.width = Kwidth;
        _numberKeyboardstyleone.height = keyBoardHeight;
        _numberKeyboardstyleone.x = 0 ;
        _numberKeyboardstyleone.y = 0 ;
    }
    return _numberKeyboardstyleone;
}

//**  字符键盘  */
-(XMCharKeyBoardView *)charKeyBoard
{
    if (!_charKeyBoard) {
        _charKeyBoard = [[XMCharKeyBoardView alloc] initWithFrame:CGRectZero];
        _charKeyBoard.delegate = self;
        _charKeyBoard.width = Kwidth;
        _charKeyBoard.height = keyBoardHeight;
        _charKeyBoard.x = 0 ;
        _charKeyBoard.y = 0 ;
    }
    return _charKeyBoard;
}

/**   字母键盘   */
-(XMWordKeyBoardView *)wordKeyBoard
{
    if (!_wordKeyBoard) {
        _wordKeyBoard = [[XMWordKeyBoardView alloc] init];
        _wordKeyBoard.delegate = self;
        _wordKeyBoard.height = keyBoardHeight ;
        _wordKeyBoard.width  = Kwidth;
    }
    return _wordKeyBoard;
}

@end
