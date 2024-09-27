import 'package:flutter/material.dart';
import 'package:foodhup/State_class/Statemanage_class.dart';
import 'package:foodhup/data/data_add.dart';
import 'package:foodhup/import/google.dart';
import 'package:foodhup/pages/feature_detai;s.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../Food model/Food_catogory.dart';

class abtfood extends StatelessWidget {
  List difhot;
  FoodCatogory foodCatogry;

  abtfood({super.key, required this.foodCatogry, required this.difhot});

  final ManageState ms = Get.find<ManageState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/back.jpg'), fit: BoxFit.fill,repeat: ImageRepeat.repeatX)
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(0.2, 0.5),
                      blurRadius: 1,
                      spreadRadius: 0.1,
                      blurStyle: BlurStyle.normal)
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 280,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(70),
                Text(
                  'Fast',
                  style: mystyle(42, Colors.black, FontWeight.bold),
                ),
                Container(
                    child: Text(
                  'Foods',
                  style: mystyle(60, primaryColor, FontWeight.bold),
                )),
                Text(
                  '80 types of foods',
                  style: mystyle(17, Colors.grey),
                ),
                Gap(19),
                Row(
                  children: [
                    Text('Sort by:   '),
                    Text(
                      'Popularity',
                      style: mystyle(
                        15,
                        primaryColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: difhot.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(DetailFood(
                      hotelclass: difhot[index],
                      addModel: add[index],
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 300,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.black12.withOpacity(0.09)),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(clipBehavior: Clip.none, children: [
                              Hero(tag: '${difhot[index].name}',
                                child: Container(
                                  margin: EdgeInsets.only(top: 2),
                                  height: 200,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('${difhot[index].imgurl}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$',
                                      style: mystyle(
                                          19, primaryColor, FontWeight.bold),
                                    ),
                                    Text(
                                      '${difhot[index].price}',
                                      style: mystyle(
                                          19, Colors.black, FontWeight.bold),
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
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${difhot[index].review} ',
                                        style:
                                            mystyle(19, null, FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xfffac05e),
                                      ),
                                      Text(
                                        '(25+)',
                                        style: mystyle(
                                            13, Colors.grey, FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 290,
                                  top: 9,
                                  child: InkWell(
                                    onTap: () {
                                      bool added = ms.addtoFav(difhot[index]);
                                      if (added) {
                                        Get.snackbar('Added',
                                            '${difhot[index].name}',
                                            );
                                      } else {
                                        Get.snackbar('Already Added',
                                            '${difhot[index].name}',
                                           );
                                      }
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ])
                          ],
                        ),
                        Gap(25),
                        Row(
                          children: [
                            Text(
                              '  ${difhot[index].name}',
                              style: mystyle(20, Colors.black, FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '  ${difhot[index].des}',
                              style: mystyle(
                                15,
                                Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
                  ]),
                )),
    );
  }
}
