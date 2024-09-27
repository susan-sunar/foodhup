import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:foodhup/import/google.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class rating extends StatefulWidget {
  const rating({super.key});

  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
  double rating = 3.5;
  int starCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/neapolitan_pizza.jpg'), fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  height: 200,
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
                        color: Colors.white),
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
                Positioned(
                    left: 140,
                    top: 150,
                    child: Stack(
                        clipBehavior: Clip.none,
                        children:[ Container(
                          height: 95,
                          width: 95,
                          decoration: BoxDecoration(boxShadow:<BoxShadow>[
                            BoxShadow(color: Colors.white,spreadRadius:10)
                          ],
                              image: DecorationImage(
                                  image: AssetImage('assets/image/pizos.png')),
                              shape: BoxShape.circle,
                              color: Colors.yellow),
                        ),
                          Positioned(
                            left: 73,top: 65,
                            child: Container(height: 25,width: 25,decoration:
                            BoxDecoration(boxShadow: <BoxShadow>[
                              BoxShadow(color: Colors.white,spreadRadius: 5)
                            ],shape: BoxShape.circle,color: Color(0xff029094)),
                              child: Icon(Icons.check,color: Colors.white,size: 15,
                              ),
                            ),
                          )
                        ] )),
              ],
            ),
            Gap(55),
            Text('Pizza Hut',style: mystyle(20,null,FontWeight.bold),),
            Text('4102 PrettyView Lanenda',style: TextStyle(color: Colors.grey),),
            Gap(20),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle,size: 7,color: Color(0xff53D776),),
                Text('  Order Delivered ',style: TextStyle(color: Color(0xff53D776)),)
              ],
            ),
            Gap(30),
            Text('Please Rate Delivery Service',style: mystyle(17,null,FontWeight.bold),),
            Gap(20),
            Text('Good',style: mystyle(25,primaryColor,),),
            StarRating(
              size: 40,
              rating: rating,
              color: Color(0xffFFC529),
              borderColor: Colors.grey,
              allowHalfRating: true,
              starCount: starCount,
              onRatingChanged: (rating) => setState(() {
                this.rating = rating;
              }),

            ),
            Gap(170),
            MaterialButton(
              minWidth: 250,
              height: 50,
              color: primaryColor,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: primaryColor)),
              onPressed: (){},child:
            Text('SUBMIT',style: TextStyle(color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}
