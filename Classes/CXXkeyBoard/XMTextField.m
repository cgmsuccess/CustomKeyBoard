//
//  XMTextField.m
//  XMTXCustomKeyBoard
//
//  Created by 风吹裤衩 on 2018/11/8.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMTextField.h"
#import "XMKeyBoardView.h"
@interface XMTextField()<XMkeyBoardViewDelegate>

@property (nonatomic,strong)XMKeyBoardView *xmKeyBoardView;

@end

@implementation XMTextField

-(instancetype)init
{
    if (self = [super init]) {
        
        [self setUI];
    }
    return self;
}

//**  支持xib  */
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    ///限制长度
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exhcnaghe) name:UITextFieldTextDidChangeNotification object:nil];
}

-(void)exhcnaghe
{
    if (self.inpuptLenth) {
        if (self.text.length > self.inpuptLenth - 1){
            self.text = [self.text substringToIndex: self.inpuptLenth];
        }
    }
    
    if (self.inputTextBlock) {
        self.inputTextBlock(self);
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]  removeObserver:self];
}

#pragma mark 键盘属性在这里设置
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.xmKeyBoardType != XMkeyBoardType_Default) { //当不是默认键盘的时候
        self.inputView = self.xmKeyBoardView;
        _xmKeyBoardView.XMKeyBoardType = self.xmKeyBoardType;
    }
}

-(XMKeyBoardView *)xmKeyBoardView
{
    if (!_xmKeyBoardView) {
        _xmKeyBoardView = [[XMKeyBoardView alloc] init];
        _xmKeyBoardView.height = keyBoardHeight + kBottomSafeHeight;
        _xmKeyBoardView.width = Kwidth;
        _xmKeyBoardView.delegate = self;
        _xmKeyBoardView.backgroundColor = keyBoardBackviewcolor;
    }
    return _xmKeyBoardView;
}
#pragma mark XMkeyBoardViewDelegate
/**  点击了内容  */
-(UIButton *)xmClickConten:(UIButton *)contenBtn
{
    if (contenBtn.titleLabel.text.length == 0) {
        return nil;
    }
    [self insertText:contenBtn.titleLabel.text];
    return contenBtn;
}

/**  点击了确定  */
-(UIButton *)xmClickdetermine:(DetermineBtn *)determineBtn
{
    [self resignFirstResponder];
    return determineBtn;
}

/**  点击了清空  */
-(UIButton *)xmClickClear:(ClearBtn *)clearBtn
{
    self.text = @"";
    
    if (self.inputTextBlock) {
        self.inputTextBlock(self);
    }
    
    return  clearBtn;
}

/**  点击了退格  */
-(UIButton *)xmClickDelete:(DeleteBtn *)deleteBtn
{
    [self deleteBackward];
    return deleteBtn;
}

/**  隐藏键盘  */
-(UIButton *)xmClickHidden:(HiddenBtn *)hiddenBtn
{
    [self endEditing:YES];
    return hiddenBtn;
}

/**  点击了空格  */
-(UIButton *)xmClickspace:(SpaceBtn *)spaceBtn
{
    [self insertText:@" "];
    return spaceBtn;
}

/**  点击了固定内容的按钮。点击此按钮，输入此按钮显示内容，清空输入框    */
-(UIButton *)xmClickfixedBtn:(fixedBtn *)fixedBtn
{
    self.text = @"";
    [self insertText:fixedBtn.titleLabel.text];
    return fixedBtn;
}


@end
