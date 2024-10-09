import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:on_campus/screens/Welcome%20Screens/signUp%20Screens/signIn2.dart';
import 'package:on_campus/screens/Welcome%20Screens/welcome_screen_4.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  TextEditingController emailPhoneTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  height: 300.h.clamp(0, 300),
                  child: Image.asset("assets/loginPage/Group 7.png",
                      fit: BoxFit.fitHeight),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text("Let's Find Your Sweet",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 28.sp.clamp(0, 28),
                            fontFamily: "Poppins-Black",
                          )),
                      Text("& Dream Place",
                          style: TextStyle(
                            // letterSpacing: 2.w,
                            fontFamily: "Poppins-Black",
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 28.sp.clamp(0, 28),
                          )),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Get the opportunity to stay at incredible place at economical prices",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(100, 0, 0, 0),
                            fontSize: 14.sp.clamp(0, 14),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      DotsIndicator(
                        position: selectedIndex,
                        dotsCount: 3,
                        decorator: DotsDecorator(
                            size: const Size(9, 7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            color: const Color.fromARGB(100, 158, 158, 158),
                            activeColor: const Color.fromARGB(255, 0, 239, 209),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            activeSize: Size(40.w, 7.h)),
                      ),
                      SizedBox(height: 10.h),
                      Material(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                              border: Border.all(
                                  width: 1.w,
                                  color: const Color.fromARGB(100, 0, 0, 0)),
                            ),
                            padding: EdgeInsets.only(left: 10.w),
                            child: TextField(
                              controller: emailPhoneTextEditingController,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelText: "Email or Phone Number",
                                  labelStyle: TextStyle(
                                      fontFamily: "Ag Body 1",
                                      color: Color.fromARGB(255, 0, 0, 0))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Material(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                              border: Border.all(
                                width: 1.w,
                                color: const Color.fromARGB(100, 0, 0, 0),
                              ),
                            ),
                            padding: EdgeInsets.only(left: 10.w),
                            child: TextField(
                              controller: passwordTextEditingController,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontFamily: "Ag Body 1",
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Material(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const WelcomeScreen4(),
                              transition: Transition.fadeIn,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 600),
                            );
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 239, 209),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            width: 330.w.clamp(0, 400),
                            child: Align(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 18.sp.clamp(0, 18),
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: const Color.fromARGB(200, 0, 0, 0),
                                fontSize: 18.sp.clamp(0, 18),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex++;
                              });
                              Get.to(() => SignIn2(index: selectedIndex),
                                  transition: Transition.fadeIn,
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 600));
                            },
                            child: Text(
                              " sign up",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 239, 209),
                                  fontSize: 18.sp.clamp(0, 18),
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
