import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detection/authentication/sign_in_button.dart';
import 'package:plant_disease_detection/services/notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
  // final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  // _fcm.subscribeToTopic("susya");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationHandler(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 4),
                  Image.asset(
                    "assets/logo.png",
                    height: 125,
                  ),
                  const Text("Plant Disease Detection",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  const Spacer(flex: 1),
                  // LoginButton(
                  //   title: "Login",
                  //   onTap: () => Get.to(() => CameraPage()),
                  // ),
                  SignInButton(),
                  Spacer(flex: 6)
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
