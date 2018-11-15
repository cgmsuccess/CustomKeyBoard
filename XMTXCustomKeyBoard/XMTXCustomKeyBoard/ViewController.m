//
//  ViewController.m
//  XMTXCustomKeyBoard
//
//  Created by 风吹裤衩 on 2018/11/4.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "ViewController.h"
#import "XMTextField.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet XMTextField *textfileOne;
@property (weak, nonatomic) IBOutlet XMTextField *textfileTwo;
@property (weak, nonatomic) IBOutlet XMTextField *textfileThree;
@property (weak, nonatomic) IBOutlet XMTextField *textfileFour;
@property (weak, nonatomic) IBOutlet XMTextField *textfileFive;
@property (weak, nonatomic) IBOutlet XMTextField *textfileSix;
@property (weak, nonatomic) IBOutlet XMTextField *textfileSeven;
@property (weak, nonatomic) IBOutlet XMTextField *textfileEight;
@property (weak, nonatomic) IBOutlet XMTextField *textfileNine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.textfileOne.xmKeyBoardType = XMkeyBoardType_OnlyNumber;
    self.textfileTwo.xmKeyBoardType = XMkeyBoardType_NumberStyleOne;
    self.textfileThree.xmKeyBoardType = XMkeyBoardType_StrongNumber;
    self.textfileFour.xmKeyBoardType = XMkeyBoardType_IDCardNumber;
    self.textfileFive.xmKeyBoardType = XMkeyBoardType_Word;
    self.textfileSix.xmKeyBoardType = XMkeyBoardType_charAndNumber;
    self.textfileSeven.xmKeyBoardType = XMkeyBoardType_RandomNumber;
    self.textfileEight.xmKeyBoardType = XMkeyBoardType_CarNumHeader;
    self.textfileNine.xmKeyBoardType = XMkeyBoardType_Default;
    
    
    ///第一个输入框限制长度 为5
    self.textfileOne.maxInpuptLenth = 5;
    
    ///输入回调
    self.textfileOne.inputTextBlock = ^(id userInfo) {
        XMTextField *tf = (XMTextField *)userInfo;
        XMLog(@"tf.text = %@",tf.text);
    };
}


@end
