//
//  EPMacro_Function.h
//  MBJ
//
//  Created by tcrj on 15/11/16.
//  Copyright (c) 2015年 Dony. All rights reserved.
//

#ifndef MBJ_EPMacro_Function_h
#define MBJ_EPMacro_Function_h
//账号信息


#define uFont       @"FZLanTingHei-L-GBK-M"
#define uFont_B     @"Helvetica-Bold"
#define uFont_Stheiti @"STHeitiSC-Light" //黑体

//weakself
#define mWEAKSELF __typeof(self) __weak weakSelf = self;

//version 版本号 1.0.0
#define mVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//Bundle version 编译号
#define mBundleVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 *M_PI)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//坐标
#define mCGRect(x,y,width,height) CGRectMake(x, y, width, height)
#define mDeviceWidth [UIScreen mainScreen].bounds.size.width        //屏幕宽
#define mDeviceHeight [UIScreen mainScreen].bounds.size.height      //屏幕高
#define mScreenThree (KDeviceHeight==480?YES:NO)                    //3.5英寸
#define mScreenFour (KDeviceHeight==568?YES:NO)                     //4英寸

#define uSystemAddHeight  (([[[UIDevice currentDevice] systemVersion] doubleValue] <7.0) ? 20 : 0) //如果是小于7.0,增加高度制为20
#define uHeightTabbar       49 //底部bar的高度
//版本
#define mSystem70 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)     //判断系统版本大于7.0
#define mSystem60 ([[[UIDevice currentDevice] systemVersion] doubleValue]<7.0)      //判断系统版本不大于7.0
#define mDeviceSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]   //获得系统版本

#define IOS5 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0f && [[[UIDevice currentDevice] systemVersion] floatValue] < 6.0f)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)
#define IOS6_7_DELTA(V,X,Y,W,H) if(IOS7_OR_LATER) {CGRect f = V.frame;f.origin.x += X;f.origin.y += Y;f.size.width +=W;f.size.height += H;V.frame=f;}
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f)


//wipeNull
#define mWipeNull(object) (((NSNull *)object==[NSNull null])?@"":object)

//color
#define mRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define mHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define mHexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define fontHightColor mHexRGB(0x3c3c3c) //字体深色
#define fontNomalColor mHexRGB(0xa0a0a0) //字体浅色
#define bjBlueColor mHexRGB(0x151f41) //主题蓝色
#define bjColor mHexRGB(0xf7f7f7)  //背景深灰色 mHexRGB(0xe4e4e4):浅灰
#define borderCol mHexRGB(0xe4e4e4)    //border颜色
#define fontHightYelloColor mHexRGB(0xff7800) //字体深黄色

//log扩展
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

//判断网络连接状态
#define isReachability    [[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable


//数据库

#define uTableName_Province              @"uTableName_Province"
#define uTableName_City                  @"uTableName_City"
#define uTableName_Area                  @"uTableName_Area"


#endif
