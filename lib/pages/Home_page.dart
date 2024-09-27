import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:foodhup/State_class/Statemanage_class.dart';
import 'package:foodhup/data/catogory.dart';
import 'package:foodhup/data/food.dart';
import 'package:foodhup/data/list.dart';
import 'package:foodhup/import/google.dart';
import 'package:foodhup/pages/Profile.dart';
import 'package:foodhup/pages/abt_food.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class homepage extends StatelessWidget {
  homepage({super.key});

  final ManageState ms = Get.find<ManageState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageState>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          ///Drawer
          drawer: Drawer(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/image/profiles.png'))),
                        )
                      ],
                    ),
                  ),
                  Gap(20),
                  Text(
                    '   Farian Wick',
                    style: mystyle(20, Colors.black, FontWeight.bold),
                  ),
                  Text('    farionWick@gmail.com'),
                  Gap(20),
                  ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Document.png'))),
                    ),
                    title: Text('My Orders'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (builder) => profile()));
                    },
                    child: ListTile(
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/Profile.png'))),
                      ),
                      title: Text('My Profile'),
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Location.png'))),
                    ),
                    title: Text('Delivery Adress'),
                  ),
                  ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Wallet.png'))),
                    ),
                    title: Text('Payment Method'),
                  ),
                  ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Message.png'))),
                    ),
                    title: Text('Contact Us'),
                  ),
                  ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Setting.png'))),
                    ),
                    title: Text('Settings'),
                  ),
                  ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/Helps.png'))),
                    ),
                    title: Text('Helps & FAQs'),
                  ),
                  Gap(60),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.power_settings_new,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          '  Log Out',
                          style: mystyle(16, Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          ///AppBar
          appBar: AppBar(
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Deliver to',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 15,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '4102 Petty View Lane',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent),
                    )
                  ],
                )
              ],
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (builder) => profile()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/profiles.png')),
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: <Color>[Colors.yellow, Colors.orangeAccent])),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///intro body
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What would you like ',
                        style: mystyle(30, Colors.black, FontWeight.bold),
                      ),
                      Text(
                        'to order',
                        style: mystyle(30, Colors.black, FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Gap(5),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 320,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Find food or resturant',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      Gap(15),
                      Icon(
                        Icons.tune,
                        color: Colors.orangeAccent,
                        size: 35,
                      )
                    ],
                  ),
                ),

                ///food catogry
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Stack(children: [
                          InkWell(
                            onTap: () {
                              Get.to(abtfood(
                                foodCatogry: cats[index],
                                difhot: difhot[index],
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.all(20),
                              height: 150,
                              width: 100,
                              decoration: BoxDecoration(
                                color:index == 0 ? primaryColor : Colors.white,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                        child: Text('${cats[index].name}',
                                            style: TextStyle(color: index == 0 ? Colors.white : Colors.black,
                                              fontSize: 17,
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 35,
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('${cats[index].imgurl}'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(70),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 40,
                              top: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/image/shadow.webp'),
                                  fit: BoxFit.cover,
                                  opacity: 0.2,
                                )),
                                height: 10,
                                width: 70,
                              ))
                        ]),
                      );
                    },
                  ),
                ),

                ///featured foods
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text('Featured Restaurants',
                          style: mystyle(
                            20,
                            Colors.black,
                            FontWeight.bold,
                          )),
                      Gap(90),
                      Text(
                        'View All',
                        style: mystyle(15, primaryColor, FontWeight.bold),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: foods.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.all(10),
                        child: InkWell(onTap: (){
                        },
                          child: Container(
                            height: 250,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 135,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('${foods[index].imgurl}'),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    color: Colors.yellow,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        margin:
                                            EdgeInsets.only(top: 10, left: 10),
                                        height: 35,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${foods[index].rating} ',
                                              style: mystyle(15, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffffb703),
                                              size: 20,
                                            ),
                                            Text(
                                              "${foods[index].review}",
                                              style: mystyle(12, Colors.grey,
                                                  FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${foods[index].name}  ',
                                            style: mystyle(17, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff218380)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '✓',
                                                      style: mystyle(
                                                          10, Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Gap(4),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 2),
                                            height: 19,
                                            width: 19,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/image/bike.png'),
                                                    fit: BoxFit.fill)),
                                          ),
                                          Text(
                                            '   Free delivery',
                                            style: mystyle(
                                                15, Colors.grey, FontWeight.bold),
                                          ),
                                          Gap(20),
                                          Icon(
                                            Icons.lock_clock,
                                            color: primaryColor,
                                            size: 19,
                                          ),
                                          Text(
                                            ' 10-15 mins',
                                            style: mystyle(
                                                15, Colors.grey, FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Gap(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color(0xfff2f2f2)),
                                            child: Center(
                                                child: Text('Burger',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 7, left: 7),
                                            height: 20,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color(0xfff2f2f2)),
                                            child: Center(
                                                child: Text(
                                              'Pizza',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color(0xfff2f2f2)),
                                            child: Center(
                                                child: Text('Fast food',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                ///Popular Items
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Popular Items',
                              style: mystyle(
                                20,
                                Colors.black,
                                FontWeight.bold,
                              ))
                        ],
                      ),
                      Gap(20),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: foods.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(children: [
                            Positioned(
                              left: 10,
                              child: Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            '${foods[index].imgurl}'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Positioned(
                              left: 130,
                              top: 10,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
