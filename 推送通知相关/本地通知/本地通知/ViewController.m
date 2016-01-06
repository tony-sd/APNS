//
//  ViewController.m
//  本地通知
//
//  Created by Mac on 15/7/20.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

}


- (void)creatLocalNotification
{
    // 取消上一次通知
    
    UILocalNotification *local = [[UILocalNotification alloc] init];
    
    // 设置通知的标题(操作名称)
    local.alertAction = @"托福听听";
    // 设置通知的正文
    local.alertBody = @"马上开始托福听力学习吧";
    // 设置通知的时间
 
    // 触发通知时间
    
    local.fireDate = [[NSDate date] dateByAddingTimeInterval:5.0];
    
    // 设置重复通知的时间为每日提醒
    local.repeatInterval = NSCalendarUnitMinute;
    
    // 通知触发时播放的声音
    local.soundName = UILocalNotificationDefaultSoundName;
    
    // 利用Application添加通知
    [[UIApplication sharedApplication] scheduleLocalNotification:local];
}

@end


////
////  ViewController.m
////  本地通知
////
////  Created by Mac on 15/7/20.
////  Copyright (c) 2015年 Mac. All rights reserved.
////
//
//#import "ViewController.h"
//
//@interface ViewController ()
//
//@property (nonatomic , strong) UILocalNotification * mLocalNotification;
//
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    //    UILocalNotification *loca = [[UILocalNotification alloc] init];
//    //    self.mLocalNotification = loca;
//    //
//    //    [self setLocalNotificationWithTime:@"16:21"];
//    
//}
//
//
//- (void)setLocalNotificationWithTime:(NSString *)notificationTime
//{
//    // 取消上一次通知
//    [[UIApplication sharedApplication] cancelLocalNotification:self.mLocalNotification];
//    
//    UILocalNotification *loca = [[UILocalNotification alloc] init];
//    
//    // 设置通知的标题(操作名称)
//    self.mLocalNotification.alertAction = @"托福听听";
//    // 设置通知的正文
//    self.mLocalNotification.alertBody = @"马上开始托福听力学习吧";
//    // 设置通知的时间
//    NSDateFormatter *formattr = [[NSDateFormatter alloc] init];
//    // 格式化时间
//    [formattr setDateFormat:@"HH:mm"];
//    // 触发通知时间
//    //    NSDate *now = [formattr dateFromString:notificationTime];
//    
//    self.mLocalNotification.fireDate = [[NSDate date] dateByAddingTimeInterval:10.0];
//    
//    // 设置重复通知的时间为每日提醒
//    self.mLocalNotification.repeatInterval = NSCalendarUnitMinute;
//    
//    // 通知触发时播放的声音
//    self.mLocalNotification.soundName = UILocalNotificationDefaultSoundName;
//    
//    // 利用Application添加通知
//    [[UIApplication sharedApplication] scheduleLocalNotification:self.mLocalNotification];
//}
//
//@end
