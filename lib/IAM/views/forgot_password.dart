// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:travon/IAM/services/forgotpassword_service.dart';

import '../../THEMES/style.dart';
import '../controllers/IAM_actions.dart';

class Forgot_password extends StatefulWidget with ForgotpasswordService {
  Forgot_password({super.key});

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {
  final IAMController IamController = Get.find<IAMController>();
  final ForgotpasswordController forgotpasswordController = Get.find<ForgotpasswordController>();
  final formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = 50;
    return Obx(() {
      return AnimatedGradientBorder(
        animationTime: 2,
        glowSize: forgotpasswordController.forgotpasswordModel.indicator.value ? 5 : 5,
        gradientColors: forgotpasswordController.forgotpasswordModel.indicator.value ? [Color.fromARGB(255, 157, 98, 253), Colors.black] : [Primary_colors.Light],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: SizedBox(
          width: 500,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: forgotpasswordController.forgotpasswordModel.indicator.value ? Colors.transparent : Primary_colors.Color3.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 1), // Shadow offset
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Primary_colors.Light,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey1,
                child: Column(
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.white, fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 4000) : baseFontSize * (screenWidth / 1500), fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      height: screenWidth > 1000 ? 55 : 50,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 13, color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 75, 75, 96),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 7500) : 10, color: Color.fromARGB(255, 167, 165, 165)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          labelText: 'Email',
                          border: const OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail, color: Colors.white),
                        ),
                        controller: forgotpasswordController.forgotpasswordModel.emailController.value,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 400,
                      height: 45,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 239, 237, 237)),
                        child: TextButton(
                          onPressed: () {
                            if (formKey1.currentState?.validate() ?? false) {
                              forgotpasswordController.toggleIndicator(true);

                              widget.Forgotpassword(context);
                            }

                            // if (_emailController.text != '') {
                            //   setState(() {
                            //     indicator = true;
                            //   });
                            //   Forgotpassword1_api();
                            // } else {
                            //   showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return AlertDialog(
                            //         backgroundColor: Primary_colors.Light,
                            //         title: const Text('Input Error', style: TextStyle(color: Colors.white)),
                            //         content: Text('Please give input for all the fields', style: TextStyle(color: const Color.fromARGB(255, 175, 174, 174))),
                            //         actions: [
                            //           TextButton(
                            //             onPressed: () {
                            //               Navigator.of(context).pop();

                            //               // _isLoading = false;
                            //             },
                            //             child: const Text(
                            //               'OK',
                            //               style: TextStyle(color: Colors.white, fontSize: 15),
                            //             ),
                            //           ),
                            //         ],
                            //       );
                            //     },
                            //   );
                            // }
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 7000) : 11, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't want to continue ?",
                            style: TextStyle(fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 7500) : 10, color: Color.fromARGB(255, 201, 201, 201), fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              IamController.IAMModel.pagename.value = 'Login';
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 7500) : 10, color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
