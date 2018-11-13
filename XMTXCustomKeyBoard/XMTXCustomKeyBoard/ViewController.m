//
//  ViewController.m
//  XMTXCustomKeyBoard
//
//  Created by 风吹裤衩 on 2018/11/4.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "ViewController.h"
#import "XMTextField.h"
#import "XMWordKeyBoardView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet XMTextField *xmTextfied;

@property (weak, nonatomic) IBOutlet XMTextField *xmtextfield1;

@property (weak, nonatomic) IBOutlet XMTextField *xmTextfied2;

@property (weak, nonatomic) IBOutlet XMTextField *xmTextfied3;

@property (weak, nonatomic) IBOutlet XMTextField *xmTextfied4;

@property (weak, nonatomic) IBOutlet XMTextField *xmTextfied5;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.xmTextfied.xmKeyBoardType = XMkeyBoardType_Word;
    self.xmtextfield1.xmKeyBoardType = XMkeyBoardType_StrongNumber;
    self.xmTextfied2.xmKeyBoardType = XMkeyBoardType_Number;
    self.xmTextfied3.xmKeyBoardType = XMkeyBoardType_RandomNumber;
    self.xmTextfied4.xmKeyBoardType = XMkeyBoardType_IDCardNumber;
    self.xmTextfied5.xmKeyBoardType = XMkeyBoardType_charAndNumber;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
