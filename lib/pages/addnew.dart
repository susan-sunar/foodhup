
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodhup/import/google.dart';
import 'package:gap/gap.dart';

class new_address extends StatelessWidget {
  const new_address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(0.2, 0.5),
                            blurRadius: 2,
                            spreadRadius: 0.1,
                            blurStyle: BlurStyle.normal)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                  ),
                  Gap(50),
                  Text(
                    'Add new address',
                    style: mystyle(20, null, FontWeight.bold),
                  )
                ],
              ),
              Gap(40),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full name'),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    Gap(20),
                    Text('Mobile number'),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    Gap(20),
                    CSCPicker(

                      onCountryChanged: (country){},
                      onStateChanged: (state){},
                      onCityChanged: (city){},


                    ),
                    Gap(80),
                    Center(
                      child: MaterialButton(
                        minWidth: 250,
                        height: 50,
                        color: primaryColor,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: primaryColor)),
                        onPressed: () {},
                        child: Text('SAVE',style: mystyle(17,Colors.white),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
