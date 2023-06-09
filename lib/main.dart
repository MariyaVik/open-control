import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'ui/app.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Handling a background message");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getToken();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log('Got a message whilst in the foreground!');
    log('Message data: ${message.data}');

    if (message.notification != null) {
      log('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(const MyApp());
}


// dBf-dzB9T4CDyr7IZwmciJ:APA91bFkWJY10itE55M4Y1i3gofg3RTEBogfpvqoe5fNSnhTcE-bpuyuxkfjKbW_1IcHwxvQrM5fBgN6GdJPDJ87QaEwjp55HeBlM34z8WUQ1msj92DyxHfZJOsOqiXsO4OU1Ljcd6PZ планшет

// eCMUhbDnQiW9LlcBSi38M0:APA91bHPfNnic6uXvJWXT6XNT_0hvohXJTUtMz_kHNPKHHXXZ6o7m54g4vozqFL84VQwisV4O6DAgXY_x4fWhHHLcFYiLo-nLv8ABDaNWb4YLmksV_vm8xjICRQBoprxddFJ95QCm5jx телефон