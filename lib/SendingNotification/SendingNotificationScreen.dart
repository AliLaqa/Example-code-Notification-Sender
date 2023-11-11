import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SendingNotificationApi.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({super.key});

  @override
  State<SendNotificationScreen> createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
String UserToken = "eOwqmH55QfugW2hI05URSP:APA91bGjRpP48Gsi88d4lLCqau4LTfWAAALv3d1dc2m1G-vmpwBuZhGhjLflb9F3WA3U4ZAsTV4wZfbmzpa76ldb93cEtY8H4zb5bR_Bmej1Yl5Q0kYhBKBoB_G3D2Agh6U14lqJ359P";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sending Notification"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue.shade200.withOpacity(0.8),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// TODO: Alert Notification Button
              FilledButton(
                onPressed: () async {
                  String token = UserToken;
                  String title = "alert";
                  String type = "alert";
                  String bodye = "Hello, this is a test Alert notification"; // Specify the notification body here
                  SendMessageApi().sendMessage(token, bodye, title, type);
                },
                child: Text("Send Alert Notification"),
              ),
              /// TODO: Message Notification Button
              FilledButton(
                onPressed: () async {
                  String token = UserToken;
                  String title = "message";
                  String type = "message";
                  String bodye = "Hello, this is a test Message notification"; // Specify the notification body here
                  SendMessageApi().sendMessage(token, bodye, title, type);
                },
                child: const Text("Send Message Notification"),
              ),
              /// TODO: Other Notification Button
              FilledButton(
                onPressed: () async {
                  String token = await UserToken;
                  String title = "Other Notification";
                  String type = "any other";
                  String bodye = "Hello, this is a test Other notification"; // Specify the notification body here
                  SendMessageApi().sendMessage(token, bodye, title, type);
                },
                child: const Text("Send Other Notification"),
              ),
              // Spacer(),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.pushReplacement(context,
              //           MaterialPageRoute(builder: (context) => HomeScreen()));
              //     },
              //     child: const Text("Go to HomeScreen"))

            ],
          ),
        ),
      ),
    );
  }


}

String token = "";

class GetToken {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String> thisDeviceToken() async {
    token = (await messaging.getToken())!;
    return token;
  }
}

///Back-up

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../ReceivingNotifications/HomeScreen.dart';
// import 'SendingNotificationApi.dart';
//
// class SendNotificationScreen extends StatefulWidget {
//   const SendNotificationScreen({super.key});
//
//   @override
//   State<SendNotificationScreen> createState() => _SendNotificationScreenState();
// }
//
// class _SendNotificationScreenState extends State<SendNotificationScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sending Notification"),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.lightBlue.shade200.withOpacity(0.8),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/bg.jpg"),
//               fit: BoxFit.cover,
//               alignment: Alignment.center,
//             )),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               /// TODO: Alert Notification Button
//               FilledButton(
//                 onPressed: () async {
//                   String token = await GetToken().thisDeviceToken();
//                   String title = "alert";
//                   String type = "alert";
//                   String bodye = "Hello, this is a test Alert notification"; // Specify the notification body here
//                   SendMessageApi().sendMessage(token, bodye, title, type);
//                 },
//                 child: Text("Send Alert Notification"),
//               ),
//               /// TODO: Message Notification Button
//               FilledButton(
//                 onPressed: () async {
//                   String token = await GetToken().thisDeviceToken();
//                   String title = "message";
//                   String type = "message";
//                   String bodye = "Hello, this is a test Message notification"; // Specify the notification body here
//                   SendMessageApi().sendMessage(token, bodye, title, type);
//                 },
//                 child: const Text("Send Message Notification"),
//               ),
//               /// TODO: Other Notification Button
//               FilledButton(
//                 onPressed: () async {
//                   String token = await GetToken().thisDeviceToken();
//                   String title = "Other Notification";
//                   String type = "any other";
//                   String bodye = "Hello, this is a test Other notification"; // Specify the notification body here
//                   SendMessageApi().sendMessage(token, bodye, title, type);
//                 },
//                 child: const Text("Send Other Notification"),
//               ),
//               Spacer(),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => HomeScreen()));
//                   },
//                   child: const Text("Go to HomeScreen"))
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }
//
// String token = "";
//
// class GetToken {
//
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   Future<String> thisDeviceToken() async {
//     token = (await messaging.getToken())!;
//     return token;
//   }
// }
//
