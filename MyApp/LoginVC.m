//
//  LoginVC.m
//  MyApp
//
//  Created by leii on 2019/8/18.
//  Copyright © 2019 com.cn.login. All rights reserved.
//

#import "LoginVC.h"
//引入Function.h文件就可以使用Function文件里面的方法
#import "Function.h"
//引入注册控制器, 跳转时用到
#import "RegisterVC.h"

@interface LoginVC ()
//账号输入框
@property (nonatomic ,weak)UITextField *accountTF;
//密码输入框
@property (nonatomic ,weak)UITextField *pwdTF;
@end

@implementation LoginVC


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI
    [self SetUI];
}
-(void)SetUI{
    /*
     FitScaleX(50);
     这种设置适配方式,只要按照屏幕宽度是375,其他414或者320的屏幕宽度会等比放大或者缩小
     */
    //1导航栏标题
    self.title = @"登录";
    //背景颜色
    self.view.backgroundColor = UIColor.whiteColor;
    //2账号
    //创建左边的"账号"UILabel
    UILabel *accontLabel = [[UILabel alloc]init];
    //位置
    accontLabel.frame = CGRectMake(FitScaleX(50), FitScaleX(150), FitScaleX(50), FitScaleX(30));
    //文本中对齐
    accontLabel.textAlignment = NSTextAlignmentCenter;
    accontLabel.text = @"账号";
    //文本颜色
    accontLabel.textColor = UIColor.blackColor;
    //文本字体大小15号
    accontLabel.font = [UIFont systemFontOfSize:15];
    //添加到View上
    [self.view addSubview:accontLabel];
    
    //创建账号输入框
    UITextField *accountTF = [[UITextField alloc]init];
    //全局引用,方便其他方法中使用改对象
    self.accountTF = accountTF;
    //位置
    accountTF.frame = CGRectMake(FitScaleX(130), FitScaleX(150), FitScaleX(200), FitScaleX(30));
    //占位文字
    accountTF.placeholder = @"请输入账号";
    //圆角半径
    accountTF.layer.cornerRadius = 4;
    //边框颜色
    accountTF.layer.borderColor = RGB(0xEBEBEB).CGColor;
    //边框宽度
    accountTF.layer.borderWidth = 1;
    //要想设置的左边viewc显示出来必须要这个属性一起设置
    accountTF.leftViewMode = UITextFieldViewModeAlways;
    //accountTF的左边view ,要设置一段宽度,要不输入时光标直接在最左边,不美观
    accountTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, FitScaleX(10), 30)];
    //当编辑时,后面显示全部删除按钮
    accountTF.clearButtonMode=UITextFieldViewModeWhileEditing;
    //添加到父控件上
    [self.view addSubview:accountTF];
    //3密码
    //创建左边的"密码"UILabel
    UILabel *pwdLabel = [[UILabel alloc]init];
    //位置
    pwdLabel.frame = CGRectMake(FitScaleX(50), FitScaleX(210), FitScaleX(50), FitScaleX(30));
    //文本中对齐
    pwdLabel.textAlignment = NSTextAlignmentCenter;
    pwdLabel.text = @"密码";
    //文本颜色
    pwdLabel.textColor = UIColor.blackColor;
    //文本字体大小15号
    pwdLabel.font = [UIFont systemFontOfSize:15];
    //添加到父控件上
    [self.view addSubview:pwdLabel];
    
    UITextField *pwdTF = [[UITextField alloc]init];
    self.pwdTF = pwdTF;
    //位置
    pwdTF.frame = CGRectMake(FitScaleX(130), FitScaleX(210), FitScaleX(200), FitScaleX(30));
    //占位文字
    pwdTF.placeholder = @"请输入密码";
    //圆角半径
    pwdTF.layer.cornerRadius = 4;
    //边框颜色
    pwdTF.layer.borderColor = RGB(0xEBEBEB).CGColor;
    //边框宽度
    pwdTF.layer.borderWidth = 1;
    //要想设置的左边viewc显示出来必须要这个属性一起设置
    pwdTF.leftViewMode = UITextFieldViewModeAlways;
     //accountTF的左边view ,要设置一段宽度,要不输入时光标直接在最左边,不美观
    pwdTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, FitScaleX(10), 30)];
    //安全文本, 就是输入后密码用点显示
    pwdTF.secureTextEntry = YES;
    //当编辑时,后面显示全部删除按钮
    pwdTF.clearButtonMode=UITextFieldViewModeWhileEditing;
    //添加到父控件上
    [self.view addSubview:pwdTF];
    
    //4登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //位置
    loginBtn.frame = CGRectMake(FitScaleX(50), FitScaleX(300), FitScaleX(50), FitScaleX(30));
    //设置按钮标题
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    //标题颜色
    [loginBtn setTitleColor:RGB(0x1C86EE) forState:UIControlStateNormal];
    //给按钮d添加点击事件,
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //5注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //位置
    registerBtn.frame = CGRectMake(FitScaleX(250), FitScaleX(300), FitScaleX(50), FitScaleX(30));
    //标题
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    //标题颜色
    [registerBtn setTitleColor:RGB(0x1C86EE) forState:UIControlStateNormal];
    //注册按钮添加点击h事件
    [registerBtn addTarget:self action:@selector(clickRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    //添加到父控制器上
    [self.view addSubview:registerBtn];
    
    
    //禁止整个控件自动向下移动(滚动距离=导航栏高度),这样控件的x的都是屏幕顶部为起点,不会是导航控制器底部为起点
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
}
///点击登录按钮, 执行该方法
-(void)clickLoginBtn{
    if([self.accountTF.text isEqualToString:@""]){
        NSLog(@"请输入账号");
        [self showAlert:@"请输入账号"];
        
        //return后后面代码不会执行
        return;
    }
    if([self.pwdTF.text isEqualToString:@""]){
        NSLog(@"请输入密码");
        [self showAlert:@"请输入密码"];
        return;
    }
    [self showAlert:@"恭喜您,登录成功"];
}
//点击注册按钮
-(void)clickRegisterBtn{
    [self.accountTF resignFirstResponder];
    [self.pwdTF resignFirstResponder];
    RegisterVC *registerVC = [[RegisterVC alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
}
//弹窗提示
-(void)showAlert:(NSString *)content{
    //创建一个弹窗控制器
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示"   message:content preferredStyle:UIAlertControllerStyleAlert];
    //创建一个"确定"的动作按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    //确定动作按钮添加到弹窗控制器上
    [alertController addAction:cancelAction];
    //程序主窗口的根控制器,显示模态出来控制器
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}
@end
