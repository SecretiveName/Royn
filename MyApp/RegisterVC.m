//
//  RegisterVC.m
//  MyApp
//
//  Created by leii on 2019/8/18.
//  Copyright © 2019 com.cn.login. All rights reserved.
//

#import "RegisterVC.h"
#import "Function.h"
#import <Foundation/Foundation.h>
@interface RegisterVC ()
@property (nonatomic ,weak)UITextField *accountTF;
@property (nonatomic ,weak)UITextField *pwdTF;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetUI];
}
-(void)SetUI{
    //1 导航栏标题
    self.title = @"注册";
    //背景颜色设置为白色
    self.view.backgroundColor = UIColor.whiteColor;
    //2账号文本
    UILabel *accontLabel = [[UILabel alloc]init];
    accontLabel.frame = CGRectMake(FitScaleX(50), FitScaleX(150), FitScaleX(50), FitScaleX(30));
    accontLabel.textAlignment = NSTextAlignmentCenter;
    accontLabel.text = @"账号";
    accontLabel.textColor = UIColor.blackColor;
    accontLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:accontLabel];
    //账号输入框
    UITextField *accountTF = [[UITextField alloc]init];
    self.accountTF = accountTF;
    accountTF.frame = CGRectMake(FitScaleX(130), FitScaleX(150), FitScaleX(200), FitScaleX(30));
    accountTF.placeholder = @"请输入账号";
    accountTF.layer.cornerRadius = 4;
    accountTF.layer.borderColor = RGB(0xEBEBEB).CGColor;
    accountTF.layer.borderWidth = 1;
    accountTF.leftViewMode = UITextFieldViewModeAlways;
    accountTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, FitScaleX(10), 30)];
    accountTF.clearButtonMode=UITextFieldViewModeWhileEditing;
    [self.view addSubview:accountTF];
    //3密码文本
    UILabel *pwdLabel = [[UILabel alloc]init];
    pwdLabel.frame = CGRectMake(FitScaleX(50), FitScaleX(210), FitScaleX(50), FitScaleX(30));
    pwdLabel.textAlignment = NSTextAlignmentCenter;
    pwdLabel.text = @"密码";
    pwdLabel.textColor = UIColor.blackColor;
    pwdLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:pwdLabel];
    //密码输入框
    UITextField *pwdTF = [[UITextField alloc]init];
    self.pwdTF = pwdTF;
    pwdTF.frame = CGRectMake(FitScaleX(130), FitScaleX(210), FitScaleX(200), FitScaleX(30));
    pwdTF.placeholder = @"请输入密码";
    pwdTF.layer.cornerRadius = 4;
    pwdTF.layer.borderColor = RGB(0xEBEBEB).CGColor;
    pwdTF.layer.borderWidth = 1;
    pwdTF.leftViewMode = UITextFieldViewModeAlways;
    pwdTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, FitScaleX(10), 30)];
    pwdTF.secureTextEntry = YES;
    pwdTF.clearButtonMode=UITextFieldViewModeWhileEditing;
    [self.view addSubview:pwdTF];
    
    
    //4注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(FitScaleX(187.5 - 25), FitScaleX(300), FitScaleX(50), FitScaleX(30));
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:RGB(0x1C86EE) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(clickRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    
    //禁止整个控件自动向下移动导航栏高度
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
}

-(void)clickRegisterBtn{
    if([self.accountTF.text isEqualToString:@""]){
        NSLog(@"请输入账号");
        [self showAlert:@"请输入账号"];
        return;
    }
    if([self.pwdTF.text isEqualToString:@""]){
        NSLog(@"请输入密码");
         [self showAlert:@"请输入密码"];
        return;
    }
     [self showAlert:@"恭喜您,注册成功"];
}


-(void)showAlert:(NSString *)content{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示"   message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}
@end
