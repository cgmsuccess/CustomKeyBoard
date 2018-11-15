# CustomKeyBoard  一个简单的自定有键盘轮子
[![](https://img.shields.io/badge/language-Objective--C-f48041.svg?style=flat)](https://www.apple.com/)&nbsp;
[![](http://img.shields.io/cocoapods/p/LEETheme.svg?style=flat)](http://cocoapods.org/?q=LEETheme)&nbsp;

####做的一个键盘的简单小轮子 。欢迎 点  ✨ 👏🏻👏🏻👏🏻👏🏻👏🏻

# 演示

![111.gif](https://upload-images.jianshu.io/upload_images/2018474-ad637ef920422cb0.gif?imageMogr2/auto-orient/strip)
![222.gif](https://upload-images.jianshu.io/upload_images/2018474-be76138faaef271e.gif?imageMogr2/auto-orient/strip)


安装
==============

### CocoaPods

1. 将 cocoapods 更新至最新版本.
pod 'XMTXCustomKeyBoard', '~> 1.1.3'
4. 导入 `<XMTextField.h>`。

### 手动安装
1. 下载demo。
2. 把 demo中的 Classes 文件下的 CXXkeyBoard 文件夹 整体导入工程即可
3. 导入 `XMTextField.h `。



用法
==============

####  pod 导入  
pod 'XMTXCustomKeyBoard', '~> 1.1.3'

不使用pod导入 那么 下载demo。把 demo中的 Classes 文件下的 CXXkeyBoard 文件夹 整体导入工程即可

如果是pod 导入 到入 <XMTextField.h> 创建 XMTextField 输入框，设置对应的枚举即可 ，下面是pod导入的使用方法。 非pod导入可参考demo

```

#import <XMTextField.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XMTextField *xmtextFile;

@end

@implementation ViewController

- (void)viewDidLoad {
[super viewDidLoad];
self.xmtextFile.xmKeyBoardType = XMkeyBoardType_CarNumHeader;
}

```

如何自定义
==============

如何自定义 简单的键盘 。可参考demo 中的 NumKeyBoardStyleOne。

1. 首先继承 XMBasekeyBoardView ,按照demo ，实现对应的ui即可
2. 实现了UI需要在头文件 XMKeyBoardHeader 添加对应的枚举
3. 枚举实现了 导入对应的 键盘类 到 XMKeyBoardView 然后设置成对应的属性，在懒加载实现
4. 在 XMKeyBoardView 的 layoutSubviews 实现对应枚举即可

