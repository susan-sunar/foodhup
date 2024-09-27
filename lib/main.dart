import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodhup/1signup_log_page/Otp.dart';
import 'package:foodhup/State_class/binding_class.dart';
import 'package:foodhup/pages/splash.dart';
import 'package:get/get.dart';
import 'firebase_options.dart'; // make sure this is generated

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        initialRoute: '/splash',
        getPages: [
          GetPage(name: '/splash', page: () => Splash()),
          GetPage(name: '/signup', page: () => Signup(), binding: BindingClass()),
          GetPage(name: '/otp', page: () => Otp()),
          GetPage(name: '/register', page: () => Register()),
          GetPage(name: '/login', page: () => Login()),
          GetPage(name: '/phone', page: () => Phone()),
          GetPage(name: '/buttom', page: () => Bottom(), binding: BindingClass()), // renamed
          GetPage(name: '/detail_food', page: () => DetailFood(addModel: Get.arguments['addModel'], hotelclass: Get.arguments['hotelclass']), binding: BindingClass()),
          GetPage(name: '/cart', page: () => Cart()),
          GetPage(name: '/rating', page: () => Rating()),
          GetPage(name: '/order', page: () => Orders())
        ],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
