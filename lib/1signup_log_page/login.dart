import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodhup/auth_class/auth_class.dart';
import 'package:foodhup/import/google.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<login> {

  AuthClass _auth= AuthClass();
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
                    Text('Login',style: mystyle(30,Colors.black,FontWeight.w900),),],),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Gap(30),
                      Row(
                        children: [
                          Text('E-mail'),],),
                      Gap(10),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
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
                      Gap(30),
                      Row(
                        children: [
                          Text('Password'),],),
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
                        ),
                      ),
                      Gap(15),
                      Text('Forgot password?',style: mystyle(15,primaryColor,FontWeight.bold),),
                      Gap(15),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.7,
                        color: Colors.deepOrange,
                        height: 60,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                        onPressed: () async{
                          User? user = await _auth.signInWithEmailAndPassword(
                              _email.text, _password.text);
            
                          if (user != null) {
                            Get.snackbar('Sucess', 'login sucessful');
                            Get.offAllNamed('/buttom');
                          } else {
                            Get.snackbar("Sorry", 'There has been a problem, try again');
                          }
            
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Gap(15),
                      InkWell(
                          onTap: (){
                            Get.offNamed('/register');},
                          child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? ",style: mystyle( 14),),
                              Text('Sign-Up',style: mystyle( 14,primaryColor),)
                            ],
                          ))),
                      Gap(50),
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
                          Text('Sign in with',style: mystyle(18,Colors.black,FontWeight.bold),),
                          Gap(20),
                          Container(
                            height: 1,
                            width: 100,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Gap(30),
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
                                  Icon(Icons.facebook_outlined,color: Colors.blueAccent,size: 40,),
                                  Gap(10),
                                  Text('FACEBOOK',style: mystyle(15,null,FontWeight.bold),),
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
                                  Icon(Icons.g_mobiledata_rounded,color: Colors.red,size: 40,),
                                  Gap(10),
                                  Text('GOOGLE',style: mystyle(15,null,FontWeight.bold),),
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
