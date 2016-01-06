import java.util.ArrayList;
import java.util.List;

import javapns.devices.Device;
import javapns.devices.implementations.basic.BasicDevice;
import javapns.notification.AppleNotificationServerBasicImpl;
import javapns.notification.PushNotificationManager;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotification;

/**
 * Apple Push Notification Server
 * @author Awesome Wang
 * @created 2015年11月9日 下午3:17:46
 */
public class Push {
    
    public static void main(String args[]){
        
        String deviceToken = "4a13f012a1f1a35cfc40c2b223216c9991fb5a47ea13f6dd9edb6738a6aeddf4";//token去空格
        String alert = "双11快乐!";//push的内容
        int badge = 1111;//图标小红圈的数值
        String sound = "default";//铃音

        List<String> tokens = new ArrayList<String>();
        tokens.add(deviceToken);
        String certificatePath = "D:/Personal/Desktop/php/php/push.p12";//导出的p12
        String certificatePassword = "awesome";//此处注意导出的证书密码不能为空因为空密码会报错
        boolean sendCount = true; //这里简单处理, 为 true 单个发送, false 批量发送

        try
        {
            PushNotificationPayload payLoad = new PushNotificationPayload();
            payLoad.addAlert(alert); // 消息内容
            payLoad.addBadge(badge); // iphone应用图标上小红圈上的数值
            payLoad.addSound(sound);//铃音
            PushNotificationManager pushManager = new PushNotificationManager();
            //true：表示的是产品发布推送服务 false：表示的是产品测试推送服务
            pushManager.initializeConnection(new AppleNotificationServerBasicImpl(certificatePath, certificatePassword, true));
            List<PushedNotification> notifications = new ArrayList<PushedNotification>();
            // 发送push消息 单个
            if (sendCount)
            {
                Device device = new BasicDevice();
                device.setToken(tokens.get(0));
                PushedNotification notification = pushManager.sendNotification(device, payLoad, true);
                notifications.add(notification);
            }
            //批量
            else
            {
                List<Device> device = new ArrayList<Device>();
                for (String token : tokens)
                {
                    device.add(new BasicDevice(token));
                }
                notifications = pushManager.sendNotifications(payLoad, device);
            }
            List<PushedNotification> failedNotifications = PushedNotification.findFailedNotifications(notifications);
            List<PushedNotification> successfulNotifications = PushedNotification.findSuccessfulNotifications(notifications);
            System.out.println("推送成功数："+successfulNotifications.size());
            System.out.println("推送失败数："+failedNotifications.size());
            pushManager.stopConnection();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
