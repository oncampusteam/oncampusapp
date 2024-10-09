import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:on_campus/screens/personal_info.dart';

class Profile extends StatefulWidget {
  final String username;
  const Profile({super.key, required this.username});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          // color: Colors.red,
                          height: 220.h,
                          width: double.infinity,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Positioned(
                              top: 35.h,
                              left: 0.h,
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: const Color.fromARGB(10, 0, 0, 0)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Icon(
                                  Icons.chevron_left,
                                  size: 24.sp.clamp(0, 24),
                                ),
                              ),
                            ),
                            // SizedBox(height: 200),
                            Column(
                              children: [
                                SizedBox(height: 30),
                                SizedBox(
                                  // color: Colors.green,
                                  // height: 100.h,
                                  // width: 117.w,
                                  child: Image.asset(
                                    "assets/profile/user logo.png",
                                    height: 110.h.clamp(0, 110),
                                    width: 110.w.clamp(0, 110),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  widget.username,
                                  style: TextStyle(
                                      fontFamily: "Poppins-Bold",
                                      fontSize: 22.sp.clamp(0, 24),
                                      color: Colors.black),
                                ),
                                Text(
                                  "+233552296265",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16.sp.clamp(0, 18),
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(80, 0, 0, 0)),
                                )
                              ],
                            ),
                            Positioned(
                              top: 140.h,
                              left: 200.w,
                              // right: 149.w,
                              child: Container(
                                height: 30.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(20, 0, 0, 0)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.r),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 8.r,
                                        spreadRadius: 3.r,
                                        color: Colors.black.withOpacity(0.15)),
                                    BoxShadow(
                                        offset: const Offset(0, 1),
                                        blurRadius: 3.r,
                                        spreadRadius: 0.r,
                                        color: Colors.black.withOpacity(0.30))
                                  ],
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.edit_outlined,
                                  size: 14.h,
                                  color: const Color(0xFF00EFD1),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => PersonalInfo(username: widget.username),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                              // color: Colors.blue,
                              margin: EdgeInsets.only(bottom: 5.h),
                              height: 50.h,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Personal Info",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.sp.clamp(0, 22),
                                            )),
                                        Image.asset(
                                          "assets/profile/userMale.png",
                                          height: 30.h,
                                          width: 30.w,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1.h,
                                    decoration: BoxDecoration(
                                        // color: Colors.black.withOpacity(0.00),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                                0.25), // Shadow color with opacity
                                            spreadRadius:
                                                0, // Spread radius (expands the shadow)
                                            blurRadius:
                                                4, // Blur radius (softness of the shadow)
                                            offset: const Offset(0,
                                                4), // Offset in X and Y direction
                                          ),
                                        ],
                                        // color: Colors.white,
                                        border: const Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    30, 0, 0, 0)))),
                                  )
                                ],
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Bookings",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Image.asset(
                                      "assets/profile/booking.png",
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Favorite",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Image.asset(
                                      "assets/profile/favorite.png",
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Chatbox",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Image.asset(
                                      "assets/profile/chatbox.png",
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Share the app",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Image.asset(
                                      "assets/profile/share.png",
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Services",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 5.h),
                                      child: Image.asset(
                                        "assets/profile/share_.png",
                                        height: 25.h,
                                        width: 25.w,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Payment History",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Image.asset(
                                      "assets/profile/paymentHistory.png",
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Refer and Earn",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Image.asset(
                                      "assets/profile/refer&earn.png",
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            height: 50.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Help",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp.clamp(0, 22),
                                        )),
                                    Image.asset(
                                      "assets/profile/help.png",
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.25), // Shadow color with opacity
                                          spreadRadius:
                                              0, // Spread radius (expands the shadow)
                                          blurRadius:
                                              4, // Blur radius (softness of the shadow)
                                          offset: const Offset(0,
                                              4), // Offset in X and Y direction
                                        ),
                                      ],
                                      // color: Colors.white,
                                      border: const Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  30, 0, 0, 0)))),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: 5.h),
                          height: 50.h,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Log Out",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp.clamp(0, 22),
                                      )),
                                  Image.asset(
                                    "assets/profile/logout.png",
                                    height: 30.h,
                                    width: 30.w,
                                  )
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 1.h,
                                decoration: BoxDecoration(
                                  // color: Colors.black.withOpacity(0.1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                          0.25), // Shadow color with opacity
                                      spreadRadius:
                                          0, // Spread radius (expands the shadow)
                                      blurRadius:
                                          4, // Blur radius (softness of the shadow)
                                      offset: const Offset(
                                          0, 4), // Offset in X and Y direction
                                    ),
                                  ],
                                  // color: Colors.white,
                                  border: const Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(30, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
