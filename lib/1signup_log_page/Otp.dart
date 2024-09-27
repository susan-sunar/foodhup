import 'package:flutter/material.dart';
import 'package:foodhup/auth_class/auth_class.dart';
import 'package:foodhup/import/google.dart';
import 'package:foodhup/pages/button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpPageState();
}

class _OtpPageState extends State<Otp> {
  final AuthClass _auth = AuthClass();
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  top: -70,
                  right: -60,
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
                  right: 330,
                  top: -45,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(width: 30, color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  right: 250,
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
                Positioned(
                  left: 35,
                  top: 40,
                  child: InkWell(onTap: (){
                    Get.back();
                  },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.001,
                                offset: Offset(0.3, 0.3),
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50),
                Text(
                  'Verification Code',
                  style: mystyle(30, null, FontWeight.bold),
                ),
                Gap(10),
                Text(
                  'Please type the verification code sent to ',
                  style: mystyle(15, Colors.grey),
                ),
                Text(
                  'Number.',
                  style: mystyle(15, Colors.grey),
                ),
                Gap(30),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) => _buildOTPInputField(index)),
                  ),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I don\'t receive a code! '),
                    Text(
                      'Please resend',
                      style: TextStyle(color: primaryColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: MaterialButton(
              color: primaryColor,
              minWidth: 250,
              height: 50,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: primaryColor)),
              onPressed: () async {
                String otp = _controllers.map((controller) => controller.text).join();
                if (otp.length == 6) {
                  _auth.sendOtp(otp);
                  Get.to(buttom());
                } else {
                  // Handle invalid OTP length
                }
              },
              child: Text(
                'SEND',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPInputField(int index) {
    return Container(
      width: 45,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 24),
          ),
          style: TextStyle(fontSize: 24, color: Colors.black),
          keyboardType: TextInputType.number,
          maxLength: 1,
          onChanged: (value) {
            if (value.length == 1 && index < 5) {
              _focusNodes[index + 1].requestFocus();
            } else if (value.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '!';
            }
            return null;
          },
        ),
      ),
    );
  }
}
