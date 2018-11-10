//
//  XMNumberkeyBoard.m
//  chexiaoxi
//
//  Created by 链派社区 on 2018/6/29.
//  Copyright © 2018年 链派社区. All rights reserved.
//

#import "XMNumberkeyBoard.h"



@interface XMNumberkeyBoard()

@property (nonatomic,strong)NSArray *dataSource;

//注释:- 身份证
@property (nonatomic,strong)NSArray *cardDataSource;

@property (nonatomic,strong)NSArray *onlyNumberSopurce ; ///<纯数字键盘

@end


@implementation XMNumberkeyBoard

-(instancetype)init
{
    if (self = [super init]) {
        [self setUI];
    }
    return self;
}

/**   初始化普通键盘   */
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

/**   初始化普通键盘   */
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

/**  随机键盘。暂时不支持xib创建  */
-(instancetype)initWithFrameRandom:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setRandomUI];
    }
    return self;
}

-(instancetype)initWithOnlyKeyBoard:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setOnlyNumberUI];

    }
    return self;
}


-(instancetype)initWithIDCard:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setIDcardUI];
    }
    return self;
}

//**  纯数字键盘  */
-(void)setOnlyNumberUI
{
    int i = 0;
    UIButton *numBtn;
    self.backgroundColor = keyBoardBackviewcolor;
    for (NSString *string in self.onlyNumberSopurce) {
        if (i == 3) {  //退格
            numBtn = [self creatDeleteBtn];
        }else if(i == 7){ //清空
            numBtn = [self creatClearBtn];
        }else if(i == 11){ //隐藏
            numBtn = [self creatHiddenBtn];
        }else if(i == 15){ // 确定
            numBtn = [self creatDetermineBtnBtn];
        }else{
            numBtn = [self creatNormalBtn]; //普通按钮
        }
        [numBtn setTitle:string forState:UIControlStateNormal];
        numBtn.tag = 1000 + i;
        i++;
        numBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        numBtn.layer.borderWidth = 0.25;
        numBtn.layer.borderColor = keyBoardBtnColor.CGColor;
        [self addSubview:numBtn];
    }

}

/**   设置身份证键盘   */
-(void)setIDcardUI
{
    int i = 0;
    UIButton *numBtn;
    self.backgroundColor = keyBoardBackviewcolor;
    for (NSString *string in self.cardDataSource) {
        if (i == 3) {  //退格
            numBtn = [self creatDeleteBtn];
        }else if(i == 7){ //清空
            numBtn = [self creatClearBtn];
        }else if(i == 11){ //隐藏
            numBtn = [self creatHiddenBtn];
        }else if(i == 15){ // 确定
            numBtn = [self creatDetermineBtnBtn];
        }else{
            numBtn = [self creatNormalBtn]; //普通按钮
        }
        [numBtn setTitle:string forState:UIControlStateNormal];
        numBtn.tag = 1000 + i;
        i++;
        numBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        numBtn.layer.borderWidth = 0.25;
        numBtn.layer.borderColor = keyBoardBtnColor.CGColor;
        [self addSubview:numBtn];
    }
}

/**   随机键盘   */
-(void)setRandomUI
{
    int i = 0;
    UIButton *numBtn;
    self.backgroundColor = keyBoardBackviewcolor;
    for (NSString *string in self.randomArr) {
        if (i == 3) {  //退格
            numBtn = [self creatDeleteBtn];
        }else if(i == 7){ //清空
            numBtn = [self creatClearBtn];
        }else if(i == 11){ //隐藏
            numBtn = [self creatHiddenBtn];
        }else if(i == 12){ //切换abc
            numBtn = [self creatSwitchBtn];
        }else if(i == 15){ // 确定
            numBtn = [self creatDetermineBtnBtn];
        }else{
            numBtn = [self creatNormalBtn]; //普通按钮
        }
        [numBtn setTitle:string forState:UIControlStateNormal];
        numBtn.tag = 1000 + i;
        i++;
        numBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        numBtn.layer.borderWidth = 0.25;
        numBtn.layer.borderColor = keyBoardBtnColor.CGColor;
        [self addSubview:numBtn];
    }
}

/**   普通的数字键盘   */
-(void)setUI
{
    [super setUI];
    if (self.subviews.count > 0) return;
    
    int i = 0;
    UIButton *numBtn;

    for (NSString *string in self.dataSource) {
        if (i == 3) {  //退格
            numBtn = [self creatDeleteBtn];
        }else if(i == 7){ //清空
            numBtn = [self creatClearBtn];
        }else if(i == 11){ //隐藏
            numBtn = [self creatHiddenBtn];
        }else if(i == 12){ //切换abc
            numBtn = [self creatSwitchBtn];
        }else if(i == 15){ // 确定
            numBtn = [self creatDetermineBtnBtn];
        }else{
            numBtn = [self creatNormalBtn]; //普通按钮
        }
        [numBtn setTitle:string forState:UIControlStateNormal];
        numBtn.tag = 1000 + i;
        i++;
        
        numBtn.layer.borderWidth = 0.25;
        numBtn.layer.borderColor = keyBoardBackviewcolor.CGColor;
        [self addSubview:numBtn];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnW = self.width  / XM_EmotionMaxCols;
    CGFloat btnH = keyBoardHeight / XM_EmotionMaxRows;
    int i = 0 ;
    for (UIView *subView in self.subviews) {
        subView.width = btnW;
        subView.height = btnH;
        subView.x = (i%XM_EmotionMaxCols) * btnW;
        subView.y = (i/XM_EmotionMaxCols) * btnH;
        i++;
    }
}

#pragma mark Lazy

//** 数字键盘  */
-(NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = @[@"1",@"2",@"3",@"退格",@"4",@"5",@"6",@"清空",@"7",@"8",@"9",@"隐藏",@"ABC",@"0",@".",@"确定"];
    }
    return _dataSource;
}

//**  身份证键盘  */
-(NSArray *)cardDataSource
{
    if (!_cardDataSource) {
        _cardDataSource = @[@"1",@"2",@"3",@"退格",@"4",@"5",@"6",@"清空",@"7",@"8",@"9",@"隐藏",@"X",@"0",@".",@"确定"];
    }
    return _cardDataSource;
}

//**  纯数字键盘   */
-(NSArray *)onlyNumberSopurce{
    if (!_onlyNumberSopurce) {
        _onlyNumberSopurce = @[@"1",@"2",@"3",@"退格",@"4",@"5",@"6",@"清空",@"7",@"8",@"9",@"隐藏",@"",@"0",@".",@"确定"];
    }
    return _onlyNumberSopurce;
}

//插入特殊文字
-(NSMutableArray *)randomArr
{
    NSMutableArray *randomarr = [NSMutableArray array];
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [arr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    NSMutableArray *customRandomArr = [self getRandomArrFrome:arr];
    [customRandomArr insertObject:@"退格" atIndex:3];
    [customRandomArr insertObject:@"清空" atIndex:7];
    [customRandomArr insertObject:@"隐藏" atIndex:11];
    [customRandomArr insertObject:@"ABC" atIndex:12];
    [customRandomArr insertObject:@"." atIndex:14];
    [customRandomArr insertObject:@"确定" atIndex:15];
    
    XMLog(@"customRandomArr = %@" ,customRandomArr);
    
    for (int i = 0; i < 16; i ++) {
        [randomarr addObject:customRandomArr[i]];
    }
    return randomarr;
}
//数组随机
-(NSMutableArray*)getRandomArrFrome:(NSArray*)arr
{
    NSMutableArray *newArr = [NSMutableArray new];
    while (newArr.count != arr.count) {
        //生成随机数
        int x =arc4random() % arr.count;
        id obj = arr[x];
        if (![newArr containsObject:obj]) {
            [newArr addObject:obj];
        }
    }
    return newArr;
}

@end
