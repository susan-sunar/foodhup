import 'package:flutter/material.dart';
import 'package:foodhup/Food%20model/class.dart';
import 'package:foodhup/Food%20model/hotel_class.dart';
import 'package:foodhup/State_class/Statemanage_class.dart';
import 'package:foodhup/data/data_add.dart';
import 'package:foodhup/import/google.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class DetailFood extends StatelessWidget {
  final HotelClass hotelclass;
  final AddModel addModel;
  final ManageState ms = Get.find<ManageState>();

  DetailFood({super.key, required this.hotelclass, required this.addModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageState>(builder: (_) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(tag: '${hotelclass.name}',
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(hotelclass.imgurl),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            height: 200,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              bool added = ms.addtoFav(hotelclass);
                              if (added) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Book has been added'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Book has already been added'),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                              ),
                              child: Icon(Icons.favorite,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                    Gap(20),
                    Text(
                      hotelclass.name,
                      style: mystyle(25, null, FontWeight.bold),
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Text(
                          '⭐  ${hotelclass.review}',
                          style: mystyle(15, null, FontWeight.bold),
                        ),
                        Text('  (30+)'),
                        Text(
                          '  See Review',
                          style: mystyle(13, primaryColor),
                        ),
                      ],
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Text(
                          '\$',
                          style: mystyle(15, primaryColor),
                        ),
                        Text(
                          '${hotelclass.price}',
                          style: mystyle(25, primaryColor, FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            ms.decrease(hotelclass);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Text(
                          '  ${hotelclass.quantity}  ',
                          style: mystyle(20, null, FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            ms.increaseQuantity(hotelclass);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    Gap(15),
                    Text(
                      food,
                      style: mystyle(16),
                    ),
                    Gap(15),
                    Text(
                      'Choice of Add On',
                      style: mystyle(17, null, FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Gap(10),
              Expanded(
                child: ListView.builder(
                  itemCount: add.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 45,
                          child: ListTile(
                            leading: Container(
                              height: 20,
                              width: 20,
                              child: Image.asset(add[index].image),
                            ),
                            title: Text(
                              '${add[index].name}                          \$${add[index].price.toStringAsFixed(2)}',
                              style: mystyle(15),
                            ),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: ms.selectedIndex,
                              onChanged: (int? value) {
                                if (value != null) {
                                  ms.selectItem(value);
                                }
                              },
                            ),
                            onTap: () {
                              ms.selectItem(index);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Center(
                child: InkWell(onTap: (){
                  ms.increment();

                },
                  child: InkWell(
                    onTap: () {
                      bool added = ms.addtoCart(hotelclass);
                      if (added) {
                        Get.snackbar('${hotelclass.name}', "Added");
                      } else {Get.snackbar('${hotelclass.name}', "Already Added");
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: primaryColor,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.shopping_bag,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            '   ADD TO CART',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
