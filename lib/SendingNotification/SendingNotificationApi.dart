import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';

///TODO: Here we are making API to send to Firebase.
class SendMessageApi {
  Future<void> sendMessage(String token, String bodye,String title, String type) async {
    print("Sending notification...");

    final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

    ///TODO: we need to set Header as below and paste Authorization key from Firebase.
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=AAAAGTM4of0:APA91bFp2kiS34Ls_tGY4r0B_5KU5u30NOOmwSOjxDJEGccObwz6ApClgcemynaaJ0fZcEkJzmNBvttG8DWnNX_ZuztoqUHMMVPHwS6xJuzUaUH_moZlSwK0JJnWmWAkEoGmVETycSK-',
    };

    ///TODO: This is the body data which will be converted to JSON and then stored in a variable and assigned to below response.

    Map<String, dynamic> body = {
      "to": token.toString(),
      "notification": {
        "body": bodye.toString(),
        "title": title.toString(),
        "android_channel_id": "pushnotificationapp2",
        "sound": true,
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
      },
      "data": {
        "type": type,
        "id": "asif1234",
      },
    };

    ///TODO: Printing all information which is in body.
    print("operator$body");

    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    ///Post API
    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully.----------------------------------->");
    } else {
      print("Failed to send notification. Status code: ${response.statusCode}");
    }
  }
}

///TODO: Custom Notifications Start-------------------------------------------->
class CustomNotification {
  static final _notification = FlutterLocalNotificationsPlugin();

  ///Types of notification

  ///Notification for a New-Order.
  static void alertNotification(RemoteMessage message) async {
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      NotificationDetails notificationDetails =
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp2",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,

          sound: RawResourceAndroidNotificationSound("loud"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }

  ///Notification for a new Message.
  static void newMessageNotification(RemoteMessage message) async {
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      const NotificationDetails notificationDetails =
      NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp7",
          "pushnotificationappchannel7",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound("newsound"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }

  ///Notification for Other things.
  static void otherNotification(RemoteMessage message) async {
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      const NotificationDetails notificationDetails =
      NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp6",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound("sms"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }
}

/// Custom Notifications End--------------------------------------------------->

///Backup

// import 'dart:convert';
//
// import 'package:http/http.dart';
//
// ///TODO: Here we are making API to send to Firebase.
// class SendMessageApi {
//   Future<void> sendMessage(String token, String bodye,String title, String type) async {
//     print("Sending notification...");
//
//     final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');
//
//     ///TODO: we need to set Header as below and paste Authorization key from Firebase.
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'key=AAAAGTM4of0:APA91bFp2kiS34Ls_tGY4r0B_5KU5u30NOOmwSOjxDJEGccObwz6ApClgcemynaaJ0fZcEkJzmNBvttG8DWnNX_ZuztoqUHMMVPHwS6xJuzUaUH_moZlSwK0JJnWmWAkEoGmVETycSK-',
//     };
//
//     ///TODO: This is the body data which will be converted to JSON and then stored in a variable and assigned to below response.
//
//     Map<String, dynamic> body = {
//       "to": token.toString(),
//       "notification": {
//         "body": bodye.toString(),
//         "title": title.toString(),
//         "android_channel_id": "pushnotificationapp2",
//         "sound": true,
//         "click_action": "FLUTTER_NOTIFICATION_CLICK",
//       },
//       "data": {
//         "type": type,
//         "id": "asif1234",
//       },
//     };
//
//     ///TODO: Printing all information which is in body.
//     print("operator$body");
//
//     String jsonBody = json.encode(body);
//     final encoding = Encoding.getByName('utf-8');
//
//     ///Post API
//     Response response = await post(
//       uri,
//       headers: headers,
//       body: jsonBody,
//       encoding: encoding,
//     );
//
//     if (response.statusCode == 200) {
//       print("Notification sent successfully.----------------------------------->");
//     } else {
//       print("Failed to send notification. Status code: ${response.statusCode}");
//     }
//   }
// }