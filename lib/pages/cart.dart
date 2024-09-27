import 'package:flutter/material.dart';
import 'package:foodhup/State_class/Statemanage_class.dart';
import 'package:foodhup/import/google.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class cart extends StatelessWidget {
  cart({super.key});

  final ManageState ms = Get.find<ManageState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageState>(builder: (_) {
      return Scaffold(
        body: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(onTap: (){
                    Get.back();
                  },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0.2, 0.5),
                            blurRadius: 1,
                            spreadRadius: 0.1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Text(
                    '                    Cart',
                    style: mystyle(25, null, FontWeight.bold),
                  )
                ],
              ),
              Gap(20),
              ListView.builder(
                shrinkWrap: true,
                // Allows the ListView to shrink to the content size
                physics: NeverScrollableScrollPhysics(),
                // Disable inner scrolling
                itemCount: ms.cartproduct.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 100,
                        width: 400,
                        child: Row(
                          children: [
                            /// Image container
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    '${ms.cartproduct[index].imgurl}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            /// Word container
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${ms.cartproduct[index].name}',
                                        style:
                                        mystyle(20, null, FontWeight.bold),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ms.delete(ms.cartproduct[index]);
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.cancel_outlined,
                                            color: primaryColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  '${ms.cartproduct[index].des}',
                                  textScaleFactor: 0.8,
                                  style: mystyle(15, Colors.grey),
                                ),
                                Gap(20),
                                Row(
                                  children: [
                                    Text(
                                      '\$${ms.cartproduct[index].price}',
                                      style: mystyle(
                                          20, primaryColor, FontWeight.bold),
                                    ),
                                    Gap(80),
                                    InkWell(
                                      onTap: () {
                                        ms.decrease(ms.cartproduct[index]);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                          Border.all(color: primaryColor),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                    Gap(10),
                                    Text(
                                      '${ms.cartproduct[index].quantity}',
                                      style: mystyle(20, null, FontWeight.bold),
                                    ),
                                    Gap(10),
                                    InkWell(
                                      onTap: () {
                                        ms.increaseQuantity(
                                            ms.cartproduct[index]);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Gap(20),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.grey,width: 0.5)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(2),
                          SizedBox(
                              width: 200,

                              child: TextFormField(
                                decoration: InputDecoration(hintText: 'Promo Code'),
                              )),
                          Container( height: 50,
                            width: 110,
                            decoration: BoxDecoration(color: primaryColor,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.grey)),
                            child: Center(child: Text('Apply',style: mystyle(20,Colors.white,FontWeight.bold),)),
                          ),
                        ],
                      ),
                    ),
                    Gap(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: mystyle(17, null, FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$''${ms.calculate()}',
                              style: mystyle(20, null, FontWeight.bold),
                            ),
                            Text('  USD'),
                          ],
                        ),

                      ],
                    ),
                    Divider(),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax and Fees',
                          style: mystyle(17, null, FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$''5.00',
                              style: mystyle(20, null, FontWeight.bold),
                            ),
                            Text('  USD'),
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: mystyle(17, null, FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$"'1.00',
                              style: mystyle(20, null, FontWeight.bold),
                            ),
                            Text('  USD'),
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: mystyle(17, null, FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$''${ms.Tax()}',
                              style: mystyle(20, null, FontWeight.bold),
                            ),
                            Text('  USD'),
                          ],
                        )
                      ],
                    ),
                    Gap(80),
                    Center(
                      child: MaterialButton(
                        height: 50,
                        minWidth: 250,
                        color: primaryColor,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: primaryColor),
                        ),
                        onPressed: () {
                          Get.toNamed('/rating');
                        },
                        child: Text(
                          'CHECKOUT',
                          style: mystyle(17, Colors.white),
                        ),
                      ),
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
