import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:foodhup/import/google.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 3), ()=>Get.offAllNamed('/signup'));}

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Center(
                child: Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/splash.png'))),
                  height:200,
                  width: 200,

                  margin: EdgeInsets.only(top: 250),

                ).animate().shimmer(duration: Duration(seconds: 3),)
            )

          ],),
      ),
    );
  }
}

