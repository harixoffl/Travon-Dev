// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travon/UTILS/Initialize.dart';

import '../../THEMES/style.dart';
import '../controllers/IAM_actions.dart';
import '../services/login_services.dart';

class Loginpage extends StatefulWidget with LoginServices {
  Loginpage({super.key});
  // static String userid = '';
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  void initState() {
    super.initState();
    ////////////////////////////---IAM-----////////////////////////////////////
    initialize_IAM();
    widget.load_login_details();
  }

  final LoginController loginController = Get.find<LoginController>();
  final IAMController IamController = Get.find<IAMController>();
  final formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = 50;
    return Obx(() {
      return AnimatedGradientBorder(
        animationTime: 2,
        glowSize: loginController.loginModel.indicator.value ? 5 : 5,
        gradientColors: loginController.loginModel.indicator.value ? [Color.fromARGB(255, 157, 98, 253), Colors.black] : [Primary_colors.Light],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: SizedBox(
          width: 500,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: loginController.loginModel.indicator.value ? Colors.transparent : Primary_colors.Color3.withOpacity(0.5),
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
                      'LogIn',
                      style: TextStyle(color: Colors.white, fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 4000) : baseFontSize * (screenWidth / 1500), fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 400,
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
                          labelText: 'User Name',
                          border: const OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                        ),
                        controller: loginController.loginModel.userController.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter user name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 400,
                      // height: screenWidth > 1000 ? 55 : 50,
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
                          labelText: "Password",
                          border: const OutlineInputBorder(),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              // setState(() {
                              loginController.togglePasswordVisibility(loginController.loginModel.passwordVisibility.value ? false : true);

                              // password_view = password_view == true ? false : true;
                              // });
                            },
                            child: Icon(loginController.loginModel.passwordVisibility.value == true ? Icons.remove_red_eye : Icons.visibility_off, color: Colors.white),
                          ),
                        ),
                        controller: loginController.loginModel.passwordController.value,
                        obscureText: !loginController.loginModel.passwordVisibility.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                side: BorderSide(color: const Color.fromARGB(255, 192, 191, 191)),
                                activeColor: Primary_colors.Color3,
                                checkColor: Colors.white,
                                focusColor: Primary_colors.Color3,
                                value: loginController.loginModel.isCheckedRememberMe.value,
                                onChanged: (value) {
                                  widget.actionRememberMe(value!);
                                  // setState(
                                  //   () {
                                  //     isCheckedRememberMe = value ?? false; // Update isCheckedRememberMe with the new value
                                  //   },
                                  // );
                                },
                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 7500) : 9, color: Color.fromARGB(255, 201, 201, 201), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              IamController.IAMModel.pagename.value = 'Forgotpassword';
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 7500) : 9, color: Color.fromARGB(255, 201, 201, 201), fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      height: 45,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 239, 237, 237)),
                        child: TextButton(
                          onPressed: () async {
                            if (formKey1.currentState?.validate() ?? false) {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              // initialize_others();
                              widget.Login(context);

                              widget.actionRememberMe(prefs.getBool('remember_me')!);
                              loginController.toggleIndicator(true);
                            }
                          },
                          child: Text(
                            'LogIn',
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
                            'New User ?',
                            style: TextStyle(fontSize: screenWidth > 1000 ? baseFontSize * (screenWidth / 7500) : 10, color: Color.fromARGB(255, 201, 201, 201), fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              IamController.IAMModel.pagename.value = 'Register';
                            },
                            child: Text(
                              'Register',
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
