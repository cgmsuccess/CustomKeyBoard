//
//  XMCharKeyBoardView.m
//  XMTXCustomKeyBoard
//
//  Created by 链派社区 on 2018/11/12.
//  Copyright © 2018年 陈桂民. All rights reserved.
//

#import "XMCharKeyBoardView.h"


@interface XMCharKeyBoardView()
{
    
    CGFloat topMargin ; //上面的距离
    CGFloat bottomMargin ; //下面的距离
    CGFloat leftMargin ; //最左边的距离
    CGFloat colMargin ;//行间距
    CGFloat rowMargin ;//列间距
    CGFloat topBtnW ; //按钮的宽度
    CGFloat topBtnH ; //按钮的高度
}
/**   装载切割好了的字符串   */
@property (nonatomic,strong)NSMutableArray *dataSource;
/**   退格按钮   */
@property (nonatomic,strong)DeleteBtn *deleteBtn;
/**   确定按钮 */
@property (nonatomic,strong)DetermineBtn *determinBtn;
/**   空格按钮 */
@property (nonatomic,strong)SpaceBtn *spaceBtn;
/**   字符和数字的切换按钮 */
@property (nonatomic,strong)SwitchBtn *switchBtn;
/**   数字和拼音的切换按钮 */
@property (nonatomic,strong)SwitchBtn *switchBtnPy;
/**   隐藏按钮 */
@property (nonatomic,strong)HiddenBtn *hiddenBtn;

@end

@implementation XMCharKeyBoardView

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
    
    topMargin = 10; //上面的距离
    bottomMargin = 10; //下面的距离
    leftMargin = 8; //最左边的距离
    colMargin = 2;//行间距
    rowMargin = 10;//列间距
    
    topBtnW = (Kwidth - 2 * leftMargin - 9 * colMargin) / 10; //按钮的宽度
    topBtnH = (keyBoardHeight - 5 * topMargin) * 0.25 ; //按钮的高度
    if (self.dataSource.count > 0)  return ;
    NSString *string = @"1234567890-+*/:;()¥@“”。,、?!.";
  
    for (int i = 0; i < string.length; i++) {
        NSString *str = [string substringWithRange:NSMakeRange(i, 1)];
        [self.dataSource addObject:str];
        UIButton *btn = [self creatNormalBtn];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setBackgroundImage :[self nomImage:YES] forState:UIControlStateNormal];
        [btn setBackgroundImage :[self nomImage:NO] forState:UIControlStateHighlighted];
        btn.tag = i + 1000 ;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor clearColor];
        [self addSubview:btn];
    }
    
    [self addSubview:self.switchBtn];
    [self addSubview:self.deleteBtn];
    [self addSubview:self.switchBtnPy];
    [self addSubview:self.spaceBtn];
    [self addSubview:self.determinBtn];
    [self addSubview:self.hiddenBtn];
}

#pragma mark 布局
/**  布局  */
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self wordlayout];//字母的布局
    [self specialBtnLayout];//特殊按钮的布局 删除，空格，退格，大小写切换等
}


/**  字母的布局  */
-(void)wordlayout
{
    int i = 0 ;
    for (UIView *btn in self.subviews) {
        CGFloat col = i % 10;
        if (i < 10){
            //字母键盘第一排 10 个
            btn.x = leftMargin + col * (topBtnW + colMargin);
            btn.y = topMargin + 0 * (topBtnH + rowMargin);
            
        }else if (10 <= i && i <= 19 ) {
            //字母键盘第二排排 10 个
            btn.x = leftMargin + col * (topBtnW + colMargin);
            btn.y = topMargin + 1 * (topBtnH + rowMargin);
            
        }else if(i > 19){
            //字母第三排
            btn.x = leftMargin + topBtnW + colMargin *2 + col * (topBtnW + colMargin);
            btn.y = topMargin + 2 * (topBtnH + rowMargin);
        }
        btn.width = topBtnW;
        btn.height = topBtnH;
        i++;
    }
}

-(void)specialBtnLayout
{
    //大小写切换按钮位置
    self.switchBtn.x = leftMargin ;
    self.switchBtn.width = topBtnW ;
    self.switchBtn.height = topBtnH;
    self.switchBtn.y = topMargin + 2 * (topBtnH + rowMargin);
    
    UIView *zBtn = [self viewWithTag:1000 + 27];
    //退格按钮位置
    self.deleteBtn.x =  CGRectGetMaxX(zBtn.frame) + colMargin;
    self.deleteBtn.width = topBtnW ;
    self.deleteBtn.height = topBtnH;
    self.deleteBtn.y = topMargin + 2 * (topBtnH + rowMargin);
    
    
    //切换数字和字母键盘
    self.switchBtnPy.x = leftMargin ;
    self.switchBtnPy.y = topMargin + 3 * (topBtnH + rowMargin);
    self.switchBtnPy.width = topBtnW * 1.5;
    self.switchBtnPy.height = topBtnH;
    
    //隐藏按钮布局
    self.hiddenBtn.x = CGRectGetMaxX(self.switchBtnPy.frame) + colMargin;
    self.hiddenBtn.y = topMargin + 3 * (topBtnH + rowMargin);
    self.hiddenBtn.width = topBtnW * 1.5;
    self.hiddenBtn.height = topBtnH;
    
    //空格按钮布局
    self.spaceBtn.x = CGRectGetMaxX(self.hiddenBtn.frame) + colMargin;
    self.spaceBtn.y = topMargin + 3 * (topBtnH + rowMargin);
    self.spaceBtn.width = 4.5 * topBtnW + 4 * colMargin;
    self.spaceBtn.height = topBtnH;
    
    //确定按钮
    self.determinBtn.x = CGRectGetMaxX(self.spaceBtn.frame) + colMargin;
    self.determinBtn.y = topMargin + 3 * (topBtnH + rowMargin);
    self.determinBtn.width = CGRectGetMaxX(self.deleteBtn.frame) - CGRectGetMaxX(self.spaceBtn.frame) + colMargin;
    self.determinBtn.height = topBtnH;
}

#pragma makr 内部方法
/** 图片的拉伸   */
- (UIImage *)nomImage:(BOOL)isNom {
    
    /////获取bundle 里面的图片
    NSBundle *currenBundle = [NSBundle bundleForClass:[self class]];
    if (isNom) {
        NSString *imagePath = [currenBundle pathForResource:@"c_chaKeyboardButton@2x.png" ofType:nil inDirectory:@"KeyBoardSource.Bundle"];
        // 普通图片
        UIImage *image     = [UIImage imageWithContentsOfFile:imagePath];
        //部分拉升图片
        image              = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        return image;
    }else{
        // 高亮图片
        NSString *imagePath = [currenBundle pathForResource:@"c_chaKeyboardButtonSel@2x.png" ofType:nil inDirectory:@"KeyBoardSource.Bundle"];
        UIImage *highImage     = [UIImage imageWithContentsOfFile:imagePath];
        //部分拉升图片
        highImage          = [highImage stretchableImageWithLeftCapWidth:highImage.size.width * 0.5 topCapHeight:highImage.size.height * 0.5];
        return highImage;
    }
}

#pragma mark Lazy  -----懒加载--------
-(SwitchBtn *)switchBtn
{
    if (!_switchBtn) {
        _switchBtn = [self creatSwitchBtn];
        _switchBtn.backgroundColor = [UIColor clearColor];
        [_switchBtn setBackgroundImage:[self nomImage:NO] forState:UIControlStateNormal];
        [_switchBtn setTitle:@"#+-" forState:UIControlStateNormal];
        _switchBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _switchBtn.contentMode = UIViewContentModeCenter;
    }
    return _switchBtn;
}
-(DeleteBtn *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn = [self creatDeleteBtn];
        _deleteBtn.backgroundColor = [UIColor clearColor];
        
        NSBundle *currenBundle = [NSBundle bundleForClass:[self class]];
        NSString *deleteImagePath = [currenBundle pathForResource:@"c_character_keyboardDeleteButton@2x.png" ofType:nil inDirectory:@"KeyBoardSource.Bundle"];
        NSString *deleteSelectmagePath = [currenBundle pathForResource:@"c_character_keyboardDeleteButtonSel@2x.png" ofType:nil inDirectory:@"KeyBoardSource.Bundle"];
        
        UIImage *deleteImage     = [UIImage imageWithContentsOfFile:deleteImagePath];
        UIImage *deleteSelectxmImage     = [UIImage imageWithContentsOfFile:deleteSelectmagePath];
        
        [_deleteBtn setImage:deleteImage forState:UIControlStateNormal];
        [_deleteBtn setImage:deleteSelectxmImage forState:UIControlStateHighlighted];
        
        _deleteBtn.contentMode = UIViewContentModeCenter;
    }
    return _deleteBtn;
}


-(HiddenBtn *)hiddenBtn
{
    if (!_hiddenBtn) {
        _hiddenBtn = [self creatHiddenBtn];
        _hiddenBtn.backgroundColor = [UIColor clearColor];
        [_hiddenBtn setBackgroundImage:[self nomImage:NO] forState:UIControlStateNormal];
        [_hiddenBtn setBackgroundImage:[self nomImage:YES] forState:UIControlStateHighlighted];
        _hiddenBtn.contentMode = UIViewContentModeCenter;
        [_hiddenBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_hiddenBtn setTitle:@"隐藏" forState:UIControlStateNormal];
    }
    return _hiddenBtn;
}

-(SpaceBtn *)spaceBtn
{
    if (!_spaceBtn) {
        _spaceBtn = [self creatSpaceBtn];
        _spaceBtn.backgroundColor = [UIColor clearColor];
        
        [_spaceBtn setBackgroundImage:[self nomImage:NO] forState:UIControlStateNormal];
        [_spaceBtn setBackgroundImage:[self nomImage:YES] forState:UIControlStateHighlighted];
        [_spaceBtn setTitle:@"空格" forState:UIControlStateNormal];
        [_spaceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _spaceBtn.contentMode = UIViewContentModeCenter;
    }
    return _spaceBtn;
}

-(SwitchBtn *)switchBtnPy
{
    if (!_switchBtnPy) {
        _switchBtnPy = [self creatSwitchBtn];
        _switchBtnPy.backgroundColor = [UIColor clearColor];
        
        [_switchBtnPy setBackgroundImage:[self nomImage:NO] forState:UIControlStateNormal];
        [_switchBtnPy setBackgroundImage:[self nomImage:YES] forState:UIControlStateHighlighted];
        [_switchBtnPy setTitle:@"拼音" forState:UIControlStateNormal];
        [_switchBtnPy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _switchBtnPy.contentMode = UIViewContentModeCenter;
    }
    return _switchBtnPy;
}

-(DetermineBtn *)determinBtn
{
    if (!_determinBtn) {
        _determinBtn = [self creatDetermineBtnBtn];
        _determinBtn.backgroundColor = [UIColor clearColor];
        
        [_determinBtn setBackgroundImage:[self nomImage:NO] forState:UIControlStateNormal];
        [_determinBtn setBackgroundImage:[self nomImage:YES] forState:UIControlStateHighlighted];
        [_determinBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_determinBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _determinBtn.contentMode = UIViewContentModeCenter;
    }
    return _determinBtn;
}

@end
