import 'package:flutter/material.dart';
import 'package:foodhup/State_class/Statemanage_class.dart';
import 'package:foodhup/import/google.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class fav extends StatelessWidget {
  final ManageState ms = Get.find<ManageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
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
                  'Favourite',
                  style: mystyle(20, null, FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/profiles.png'),
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
            Gap(10),

            // Dismissible ListView
            Expanded(
              child: ListView.builder(
                itemCount: ms.favproduct.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(ms.favproduct[index].name),
                    direction: DismissDirection.endToStart, // Swipe from right to left
                    onDismissed: (direction) {
                     ms.counter2--;
                      ms.favproduct.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${ms.favproduct[index].name} removed from favorites"),
                        ),
                      );
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12.withOpacity(0.09)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 2),
                                    height: 200,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(ms.favproduct[index].imgurl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 35,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '\$',
                                          style: mystyle(19, primaryColor, FontWeight.bold),
                                        ),
                                        Text(
                                          '${ms.favproduct[index].price}',
                                          style: mystyle(19, Colors.black, FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 180,
                                    left: 20,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      height: 35,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${ms.favproduct[index].review} ',
                                            style: mystyle(19, null, FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xfffac05e),
                                          ),
                                          Text(
                                            '(25+)',
                                            style: mystyle(13, Colors.grey, FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 290,
                                    top: 9,
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.favorite,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Gap(25),
                          Row(
                            children: [
                              Text(
                                '  ${ms.favproduct[index].name}',
                                style: mystyle(20, Colors.black, FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  ${ms.favproduct[index].des}',
                                style: mystyle(15, Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
