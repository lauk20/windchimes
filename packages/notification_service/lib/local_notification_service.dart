import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'dart:developer' as developer;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('sunset');
  
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, 
        );
    
    bool? done = await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  
    developer.log(done.toString());
  }
  
  static AndroidNotificationDetails androidPlatformChannelSpecifics = 
    const AndroidNotificationDetails(
        "Notification",   //Required for Android 8.0 or after
        "Weather", //Required for Android 8.0 or after
        channelDescription: "Weather Info", //Required for Android 8.0 or after
    );
  
  static NotificationDetails platformChannelSpecifics = 
    NotificationDetails(android: androidPlatformChannelSpecifics);
  
  static void sendNotif(int id, {String? title, String? body, NotificationDetails? notificationDetails, String? payload}) async {
    developer.log("called");
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
    developer.log("should see notif now");
  }

  static Future<void> scheduleNotif(List<tz.TZDateTime> times, int id, String title, String body,) async {
    for (int i = 0; i < times.length; i++) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id, 
        title, 
        body,
        times[i], 
        const NotificationDetails(
            android: AndroidNotificationDetails('weekly notification channel id',
                'weekly notification channel name',
                channelDescription: 'weekly notificationdescription'),
          ), 
        uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
      );
    }
  }
}