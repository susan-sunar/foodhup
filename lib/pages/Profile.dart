import 'package:flutter/material.dart';
import 'package:foodhup/import/google.dart';
import 'package:foodhup/pages/Edit%20profile.dart';
import 'package:gap/gap.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ///design image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///profile pic
                Stack(clipBehavior: Clip.none, children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.99,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/image/profilecontainer.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 125,
                    left: 125,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children:[ Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/image/profiles.png'),
                                fit: BoxFit.fill),
                            boxShadow: <BoxShadow>[
                              BoxShadow(color: Colors.white, spreadRadius: 10)
                            ]),
                      ),
                        Positioned(
                          top: 80,left: 80,
                            child: Container(
                              child: Container(height: 35,width: 35,decoration:
                                  BoxDecoration(border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),shape: BoxShape.circle,color: Colors.white),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Icon(Icons.camera_alt,color: Colors.grey,size: 22,)
                              ],),),
                            )
                        )
                    ]),
                  ),

                ])
              ],
            ),
            Column(
              children: [
                Text('Eljad Eendaz',style: mystyle(20,Colors.black,FontWeight.bold),),
                InkWell(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)
                  =>edit()));
                },
                    child: Text('Edit Profile',style: mystyle(13,Colors.grey,FontWeight.bold),)),


                ///details
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Gap(30),
                      Row(children: [
                        Text('Full name',style: mystyle(16,Colors.grey,FontWeight.bold),),
                      ],),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,width: 370,decoration:
                              BoxDecoration(borderRadius: 
                                  BorderRadius.circular(10),border: Border.all(
                                color: Colors.grey.shade300,
                              )),
                            child: Row(children: [
                              Text('')
                            ],),
                          ),
                        ],
                      ), Gap(30),
                      Row(children: [
                        Text('E-mail',style: mystyle(16,Colors.grey,FontWeight.bold),),
                      ],),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,width: 370,decoration:
                              BoxDecoration(borderRadius:
                                  BorderRadius.circular(10),border: Border.all(
                                color: Colors.grey.shade300,
                              )),
                          ),
                        ],
                      ), Gap(30),
                      Row(children: [
                        Text('Phone Number',style: mystyle(16,Colors.grey,FontWeight.bold),),
                      ],),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,width: 370,decoration:
                              BoxDecoration(borderRadius:
                                  BorderRadius.circular(10),border: Border.all(
                                color: Colors.grey.shade300,
                              )),
                          ),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
