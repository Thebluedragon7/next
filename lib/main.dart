import 'package:flutter/material.dart';
import 'package:next/providers/schedulesProvider.dart';
import 'package:next/screens/forms/createSchedule.dart';
import 'package:next/screens/homePage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:next/screens/splashScreens/nextSplashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('app_icon');
//
//   const InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: selectNotification);
//
//   void selectNotification(String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     await Navigator.push(
//       context,
//       MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
//     );
//   }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ScheduleProvider(),
      )
    ],
    child: MaterialApp(
      title: 'Next',
      debugShowCheckedModeBanner: false,
      home: NextSplashScreen(),
      // home: CreateSchedule(),
    ),
  ));
}
