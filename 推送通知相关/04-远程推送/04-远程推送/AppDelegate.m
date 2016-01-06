//
//  AppDelegate.m
//  04-远程推送
//
//  Created by apple on 15/2/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    application.applicationIconBadgeNumber = 0;
    
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)
    {
        // 1.请求授权可以给用户发送通知
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeBadge | UIUserNotificationTypeAlert categories:nil];
        
        [application registerUserNotificationSettings:settings];
        
        
        
    }
    else
    {
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    }
    
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey])
    {
        // 跳转
    }
    
    return YES;
}


/**
 *  远程推送注册成功
 *
 *  @param deviceToken deviceToken
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 25bb75ac 3ffcebd7 90d9f517 1ebca904 154a367a 87781e5d b9ea288e 37fdf487
    NSLog(@"-----deviceToken ---- ---- %@ devDesc ---%@", deviceToken,deviceToken.description);
    
    //tokenStr 得到可用的token。
    NSString *tokenStr = [NSString stringWithFormat:@"%@",deviceToken];
    tokenStr = [tokenStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];//将其中的<>去掉
    tokenStr = [tokenStr stringByReplacingOccurrencesOfString:@" " withString:@""];//将其中的空格去掉
    
    NSLog(@"token--- %@",tokenStr);
    //注册成功，返回token
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"APNS返回的Token:" message:tokenStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
    
//    applicationIconBadgeNumber    
}


/**
 *  注册失败
 *
 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{

    NSLog(@"注册失败 ---- %@",error);
    NSString *tokenStr = [NSString stringWithFormat:@"%@",error];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败!" message:tokenStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    NSLog(@"注册失败%@",error);
    
    
}//NS_AVAILABLE_IOS(3_0);



- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"接收到推送通知 ---- %@", userInfo);
    
//    application.applicationIconBadgeNumber -=1;
    //将推送消息以alert形式呈现
    NSString *message = [[userInfo objectForKey:@"aps"]objectForKey:@"alert"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
}


// This callback will be made upon calling -[UIApplication registerUserNotificationSettings:]. The settings the user has granted to the application will be passed in as the second argument.
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{

    NSLog(@"ls---- %@",notificationSettings);
    
    // 2.注册远程通知
    [application registerForRemoteNotifications];
    
}//NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;


// Called when your app has been activated by the user selecting an action from a remote notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
{

    NSLog(@"ios9新增 --- %@ -- %@ --- %@",identifier,userInfo,responseInfo);
    
    
}//NS_AVAILABLE_IOS(9_0) __TVOS_PROHIBITED;


// Called when your app has been activated by the user selecting an action from a remote notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling the action.
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{

    NSLog(@"ios8新增 --- %@ -- %@ --- %@",identifier,userInfo,application);

    
}//NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;



















@end
