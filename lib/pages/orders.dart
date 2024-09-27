import 'package:flutter/material.dart';
import 'package:foodhup/import/google.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
class orders extends StatefulWidget {
  const orders({super.key});

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0.2, 0.5),
                        blurRadius: 1,
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
              Text(
                'Orders',
                style: mystyle(20, null, FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, top: 10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/profiles.png'),fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.orangeAccent],
                  ),
                ),
              ),
            ],
          ),
          Gap(30),

          // Stack inside Container
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 0.2),
            ),
            child: Stack(
              children: [
                Container(
                  height: 48,
                  width: 200,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Food Items",
                      style: mystyle(15, Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  left: 153,
                  child: Container(
                    height: 48,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("Restaurants", style: mystyle(15, primaryColor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],),
      ),
    );
  }
}
