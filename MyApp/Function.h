//
//  Function.h
//  MyApp
//
//  Created by leii on 2019/8/18.
//  Copyright © 2019 com.cn.login. All rights reserved.
//

#ifndef Function_h
#define Function_h
#import <Foundation/Foundation.h>
#endif /* DefineFile_h */
//定义屏幕的宽
#define ScreenW  [UIScreen mainScreen].bounds.size.width
//定义屏幕的高
#define ScreenH  [UIScreen mainScreen].bounds.size.height
//375设计的布局标准,
#define FitScaleX(args) ScreenW/375.0*(args)*100/100.0

//16进制RGB 设置颜色
#define RGB(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])

