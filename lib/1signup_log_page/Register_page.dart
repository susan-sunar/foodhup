import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodhup/1signup_log_page/login.dart';
import 'package:foodhup/auth_class/auth_class.dart';
import 'package:foodhup/import/google.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<register> {

  AuthClass _auth= AuthClass();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.15,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -70,
                        right:-60 ,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      Positioned(
                        right:330 ,
                        top: -45,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(width: 30,color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
            
                      ),
                      Positioned(
                        right:250 ,
                        top: -90,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.pink[50],
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 23,),
                    Text('Sign Up',style: mystyle(30,Colors.black,FontWeight.w900),),
                  ],
                ),
                Gap(10),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(children: [Text('Full Name')],),
                      Gap(10),
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          label: Text("Name",style: mystyle(18),),
                          hintText: "Name",
                          // hintStyle: TextStyle(color: Colors.purple)
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter email";
                          }
                        },
                      ),
                      Gap(20),
                      Row(children: [Text('Email')],),
                      Gap(10),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          label: Text("Email",style: mystyle(18),),
                          hintText: "Email",
                          // hintStyle: TextStyle(color: Colors.purple)
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter email";
                          }
                        },
                      ),
                      Gap(20),
                      Row(children: [Text('Full Name')],),
                      Gap(10),
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                            label: Text("Password",style: mystyle(18),),
                            hintText: "Enter your password",
                            // hintStyle: TextStyle(color: Colors.purple)
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            suffix: IconButton(
                              onPressed: (){
                              },
                              icon: Icon(Icons.visibility),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter password";
                            }
                            if(value.length < 8){
                              return "Password must be at least 8 digits/char";
                            }
            
                          },
                        ),
                      ),
                      Gap(30),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.8,
                        color: Colors.deepOrange,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: () async{
                          User? user = await _auth.signUpWithEmailAndPassword(
                              _email.text, _password.text);
            
                          if (user != null) {
                            Get.snackbar('Sucess', 'Registration sucessful');
                            Get.offAllNamed('/login');
                          } else {
                            Get.snackbar("Sorry", 'There has been a problem, try again');
                          }
            
                        },
                        child: Text(
                          "Sign Up!",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Gap(20),
                      InkWell(
                          onTap: (){
                            Get.to(login()
                          );},
                          child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an acc? ',style: mystyle( 15),),
                              Text('Sign-In',style: mystyle( 15,primaryColor),)
                            ],
                          ))),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(20),
                          Container(
                            height: 1,
                            width: 100,
                            color: Colors.black,
                          ),
                          Gap(20),
                          Text('Sign In',style: mystyle(18,Colors.black,FontWeight.bold),),
                          Gap(20),
                          Container(
                            height: 1,
                            width: 100,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            color: Colors.white,
                            child: Container(
                              height: 55,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.facebook_outlined,color: Colors.blue,),
                                  Gap(10),
                                  Text('FACEBOOK',style: mystyle(15,),),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            child: Container(
                              height: 55,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.g_mobiledata_rounded,color: Colors.red,),
                                  Gap(10),
                                  Text('GOOGLE'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );

  }
}
