//
//  ViewController.m
//  XMTXCustomKeyBoard
//
//  Created by 陈桂民 on 2018/11/4.
//  Copyright © 2018年 陈桂民. All rights reserved.
//

#import "ViewController.h"
#import "XMTextField.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet XMTextField *xmTextfied;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.xmTextfied.xmKeyBoardType = XMkeyBoardType_Word;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
