//
//  XMCarNumHeaderKeyBoard.m
//  XMTXCustomKeyBoard
//
//  Created by 风吹裤衩 on 2018/11/13.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMCarNumHeaderKeyBoard.h"

@interface XMCarNumHeaderKeyBoard()
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

/**   字符和数字的切换按钮 */
@property (nonatomic,strong)SwitchBtn *switchBtn;

/**   隐藏按钮 */
@property (nonatomic,strong)HiddenBtn *hiddenBtn;

@end

@implementation XMCarNumHeaderKeyBoard


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
    NSString *string = @"京津晋冀蒙辽吉黑沪苏浙皖闽赣鲁豫鄂湘粤桂琼渝川贵云藏陕甘青宁新港澳学挂警";
    
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
    [self addSubview:self.hiddenBtn];
    [self addSubview:self.deleteBtn];
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
        
        if (i ==36) {
            //// 这里是特殊按钮布局的，在 specialBtnLayout进行布局
            break;
        }
        
        CGFloat col = i % 10;
        if (i < 10){
            //字母键盘第一排 10 个
            btn.x = leftMargin + col * (topBtnW + colMargin);
            btn.y = topMargin + 0 * (topBtnH + rowMargin);
            
        }else if (10 <= i && i <= 19 ) {
            //字母键盘第二排排 10 个
            btn.x = leftMargin + col * (topBtnW + colMargin);
            btn.y = topMargin + 1 * (topBtnH + rowMargin);
            
        }else if(i > 19 && i <= 29){
            //字母第三排
            btn.x = leftMargin + col * (topBtnW + colMargin);
            btn.y = topMargin + 2 * (topBtnH + rowMargin);
        }else{
            //字母第四排
            btn.x = leftMargin + col * (topBtnW + colMargin);
            btn.y = topMargin + 3 * (topBtnH + rowMargin);
        }
        btn.width = topBtnW;
        btn.height = topBtnH;
        i++;
    }
}

//**  特殊字符布局  */
-(void)specialBtnLayout
{
    UIView *lastView = [self viewWithTag:35 + 1000];
    CGFloat specialwidth = 4 * topBtnW / 3 ;
    CGFloat specialY = topMargin + 3 * (topBtnH + rowMargin) ;
    self.hiddenBtn.frame = CGRectMake(CGRectGetMaxX(lastView.frame) + colMargin, specialY, specialwidth, topBtnH);
    self.switchBtn.frame = CGRectMake(CGRectGetMaxX(self.hiddenBtn.frame) + colMargin, specialY, specialwidth, topBtnH);
    self.deleteBtn.frame = CGRectMake(CGRectGetMaxX(self.switchBtn.frame) + colMargin, specialY, specialwidth, topBtnH);
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
        [_switchBtn setTitle:@"更多" forState:UIControlStateNormal];
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


@end
