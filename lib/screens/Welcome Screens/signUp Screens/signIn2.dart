import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:on_campus/classes/screen_details.dart';
import 'package:on_campus/screens/Welcome%20Screens/welcome_screen_4.dart';

class SignIn2 extends StatefulWidget {
  final int? index;
  const SignIn2({super.key, required this.index});

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  TextEditingController PhoneNumTextEditingController = TextEditingController();
  TextEditingController GoogleTextEditingController = TextEditingController();
  TextEditingController AppleTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    height: 300.h.clamp(0, 300),
                    child: Image.asset("assets/signIn2/Group 7.png",
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
                          position: 1,
                          dotsCount: 3,
                          decorator: DotsDecorator(
                              size: const Size(9, 7),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              color: const Color.fromARGB(100, 158, 158, 158),
                              activeColor:
                                  const Color.fromARGB(255, 0, 239, 209),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              activeSize: Size(40.w, 7.h)),
                        ),
                        SizedBox(height: 10.h),
                        Material(
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
                            padding: EdgeInsets.only(
                                left: ScreenDetails.ScreenHeight * 0.0119),
                            width: ScreenDetails.ScreenWidth * 0.8,
                            child: TextField(
                              cursorColor: Colors.black,
                              // enabled: false,
                              controller: PhoneNumTextEditingController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  enabledBorder: InputBorder.none,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorder: InputBorder.none,
                                  labelText: "Sign up with Phone number",
                                  prefixIcon: Image.asset(
                                    "assets/signIn2/Phone.png",
                                    width: 5,
                                    height: 5,
                                    fit: BoxFit.contain,
                                  ),
                                  labelStyle: TextStyle(
                                      fontFamily: "Ag Body 1",
                                      fontSize:
                                          ScreenDetails.ScreenHeight * 0.0178,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenDetails.ScreenHeight * 0.0119),
                        Material(
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
                            width: ScreenDetails.ScreenWidth * 0.8,
                            child: TextField(
                              cursorColor: Colors.black,
                              controller: GoogleTextEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: InputBorder.none,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                enabledBorder: InputBorder.none,
                                prefixIcon: Image.asset(
                                  "assets/signIn2/google.png",
                                  width: 5,
                                  height: 5,
                                  fit: BoxFit.contain,
                                ),
                                labelText: "Sign up with Google",
                                labelStyle: TextStyle(
                                  fontFamily: "Ag Body 1",
                                  fontSize: ScreenDetails.ScreenHeight * 0.0178,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenDetails.ScreenHeight * 0.0119),
                        Material(
                          child: Container(
                            // height: ScreenDetails.ScreenHeight * 0.05832,
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
                            width: ScreenDetails.ScreenWidth * 0.8,
                            child: TextField(
                              // enabled: false,
                              cursorColor: Colors.black,
                              controller: AppleTextEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                prefixIcon: Image.asset(
                                  "assets/signIn2/apple.png",
                                  width: 5,
                                  height: 5,
                                  fit: BoxFit.contain,
                                ),
                                labelText: "Sign up with Apple",
                                labelStyle: TextStyle(
                                  fontFamily: "Ag Body 1",
                                  fontSize: ScreenDetails.ScreenHeight * 0.0178,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
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
                                  duration: const Duration(milliseconds: 600));
                            },
                            child: Container(
                              height: ScreenDetails.ScreenHeight * 0.05832,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 239, 209),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              width: ScreenDetails.ScreenWidth * 0.8,
                              child: Align(
                                child: Text(
                                  "Sign up",
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
  }
}
