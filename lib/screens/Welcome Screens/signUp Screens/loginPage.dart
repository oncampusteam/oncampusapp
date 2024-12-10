import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:on_campus/classes/screen_details.dart';
import 'package:on_campus/firebase/classes.dart';
import 'package:on_campus/firebase/firestore_db.dart';
import 'package:on_campus/screens/Welcome%20Screens/welcome_screen_4.dart';
import 'package:on_campus/third-party-auth/google-auth.dart';

class LoginPage extends StatefulWidget {
  final int? index;
  const LoginPage({super.key, required this.index});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? result;
  @override
  void initState() {
    super.initState();
  }

  TextEditingController PhoneNumTextEditingController = TextEditingController();
  TextEditingController GoogleTextEditingController = TextEditingController();
  TextEditingController AppleTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: SizedBox(
            height: ScreenDetails.ScreenHeight,
            width: ScreenDetails.ScreenWidth,
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: 0.h,
                    right: 0,
                    left: 0,
                    child: SizedBox(
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: ScreenDetails.ScreenHeight * 0.0119, vertical: ScreenDetails.ScreenHeight * 0.0178),
                        height: ScreenDetails.ScreenHeight * 0.45481,
                        width: ScreenDetails.ScreenWidth,
                        // color: Colors.red,
                        child: Image.asset("assets/loginPage/Group 7.png",
                            fit: BoxFit.fitHeight)),
                  ),
                  Positioned(
                    top: ScreenDetails.ScreenHeight * 0.5,
                    child: SizedBox(
                      // color: Colors.blue,
                      // margin: EdgeInsets.symmetric(horizontal: 45.h),
                      height: ScreenDetails.ScreenHeight * 0.44,
                      width: MediaQuery.of(context).size.width,
                      child: FittedBox(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              // color: Colors.blue,
                              width: ScreenDetails.ScreenWidth * 0.6,
                              height: 30.h,
                              child: Align(
                                child: Text("Let's Find Your",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      // letterSpacing: 2.w,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 30.sp,
                                      fontFamily: "Poppins-Black",
                                      // fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              // color: Colors.red,
                              width: ScreenDetails.ScreenWidth * 0.6,
                              height: 30.h,
                              child: Text("Sweet & Dream Place",
                                  style: TextStyle(
                                    // letterSpacing: 2.w,
                                    fontFamily: "Poppins-Black",
                                    // fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 30.sp,
                                  )),
                            ),
                            SizedBox(
                              // color: Colors.yellow,
                              height: 28.h,
                              width: ScreenDetails.ScreenWidth * 0.4,
                              child: Align(
                                child: Text("Place",
                                    style: TextStyle(
                                      // letterSpacing: 2.w,
                                      fontFamily: "Poppins-Black",
                                      // fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.none,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize:
                                          ScreenDetails.ScreenHeight * 0.04,
                                    )),
                              ),
                            ),
                            // SizedBox(height: 10.h),
                            Text("Get the opportunity to stay at incredible",
                                style: TextStyle(
                                  // letterSpacing: 2.w,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Poppins",
                                  decoration: TextDecoration.none,
                                  color: const Color.fromARGB(100, 0, 0, 0),
                                  fontSize: ScreenDetails.ScreenHeight * 0.0178,
                                )),
                            Text("place at economical prices",
                                style: TextStyle(
                                  // letterSpacing: 2.w,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Poppins",
                                  decoration: TextDecoration.none,
                                  color: const Color.fromARGB(100, 0, 0, 0),
                                  fontSize: ScreenDetails.ScreenHeight * 0.0178,
                                )),
                            // SizedBox(height: 10.h),
                            DotsIndicator(
                              position: widget.index ?? 1,
                              dotsCount: 3,
                              decorator: DotsDecorator(
                                  size: const Size(9, 7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  color:
                                      const Color.fromARGB(100, 158, 158, 158),
                                  activeColor:
                                      const Color.fromARGB(255, 0, 239, 209),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  activeSize: Size(40.w,
                                      ScreenDetails.ScreenHeight * 0.0105)),
                            ),
                            // SizedBox(height: 10.h),
                            Material(
                              child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  height: 42.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.r),
                                    ),
                                    border: Border.all(
                                        width: 1.w,
                                        color:
                                            const Color.fromARGB(100, 0, 0, 0)),
                                  ),
                                  // padding: EdgeInsets.only(left: 10.w),
                                  width: ScreenDetails.ScreenWidth * 0.8,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/loginPage/Phone.png",
                                        width: 20.h,
                                        height: 20.h,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                        "    Sign In with Phone Number",
                                        style: TextStyle(
                                          fontFamily: "Ag Body 1",
                                          fontSize: ScreenDetails.ScreenHeight *
                                              0.0178,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            SizedBox(
                                height: ScreenDetails.ScreenHeight * 0.0119),
                            Material(
                              child: InkWell(
                                onTap: () async {
                                  // await GoogleAuth.signUpWithGoogle();
                                  await FirestoreDb.instance.signInWithGoogle();
                                  // if (result == "null") {}
                                  // elseif(){}
                                },
                                child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.h),
                                    height: 42.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r),
                                      ),
                                      border: Border.all(
                                          width: 1.w,
                                          color: const Color.fromARGB(
                                              100, 0, 0, 0)),
                                    ),
                                    // padding: EdgeInsets.only(left: 10.w),
                                    width: ScreenDetails.ScreenWidth * 0.8,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/loginPage/google.png",
                                          width: 20.h,
                                          height: 20.h,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          "    Sign In with Google",
                                          style: TextStyle(
                                            fontFamily: "Ag Body 1",
                                            fontSize:
                                                ScreenDetails.ScreenHeight *
                                                    0.0178,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                                height: ScreenDetails.ScreenHeight * 0.0119),
                            Material(
                              child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  height: 42.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.r),
                                    ),
                                    border: Border.all(
                                        width: 1.w,
                                        color:
                                            const Color.fromARGB(100, 0, 0, 0)),
                                  ),
                                  // padding: EdgeInsets.only(left: 10.w),
                                  width: ScreenDetails.ScreenWidth * 0.8,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/loginPage/apple.png",
                                        width: 20.h,
                                        height: 20.h,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                        "    Sign In with Apple",
                                        style: TextStyle(
                                          fontFamily: "Ag Body 1",
                                          fontSize: ScreenDetails.ScreenHeight *
                                              0.0178,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: ScreenDetails.ScreenHeight * 0.0119,
                            ),
                            Material(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const WelcomeScreen4(),
                                      transition: Transition.fadeIn,
                                      curve: Curves.easeIn,
                                      duration:
                                          const Duration(milliseconds: 600));
                                },
                                child: Container(
                                  height: ScreenDetails.ScreenHeight * 0.05832,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 0, 239, 209),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    ),
                                  ),
                                  width: ScreenDetails.ScreenWidth * 0.8,
                                  child: Align(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
