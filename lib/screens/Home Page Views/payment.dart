import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:on_campus/screens/Home%20Page%20Views/apartment.dart';
import 'package:on_campus/screens/Home%20Page%20Views/compare.dart';
import 'package:on_campus/screens/Home%20Page%20Views/home.dart';
import 'package:on_campus/screens/Home%20Page%20Views/profile.dart';
import 'package:on_campus/temps/clipper.dart';

class Payment extends StatefulWidget {
  final String username;
  const Payment({super.key, required this.username});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedIndex = 1;
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
          child: Scaffold(
              // appBar: AppBar(),
              body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                // color: const Color.fromARGB(63, 118, 182, 234)
                // .withOpacity(0.1),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.h),
                          height: 40.h,
                          width: 40.w,
                          foregroundDecoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.03),
                              borderRadius: BorderRadius.circular(8.r)),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.chevron_left,
                                color: Colors.black, size: 24.w),
                          ),
                        ),
                        SizedBox(width: 75.w),
                        Text(
                          "Pending Payment",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp.clamp(0, 22),
                              color: const Color(0xFF323232)),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 40.h,
                        width: 40.w,
                        child: Icon(Icons.close,
                            color: const Color(0xFF323232), size: 14.h),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tapped = !tapped;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Card(
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.h, vertical: 20.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  height: 90.h,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        height: 90.h,
                                        child: Image.asset(
                                          "assets/payment/paymentImage.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0.r),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0.r),
                                              child: const Icon(
                                                Icons.favorite_border,
                                                size: 17,
                                                color: Color.fromARGB(
                                                    255, 33, 243, 201),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.0.w),
                                    child: SizedBox(
                                      // height: 90.h,
                                      // width: MediaQuery.sizeOf(context).width,
                                      // color: Colors.red,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Albert-Acquah hall",
                                                style: TextStyle(
                                                    fontSize:
                                                        16.sp.clamp(0, 18),
                                                    fontFamily: "Roboto",
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.15.w,
                                                    color: Color.fromARGB(
                                                        255, 58, 48, 74)),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 15.sp.clamp(0, 17),
                                                    color: const Color.fromARGB(
                                                        255, 33, 243, 201),
                                                  ),
                                                  Text(
                                                    " 4.8",
                                                    style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      color: const Color(
                                                          0xFF323232),
                                                      fontSize:
                                                          13.sp.clamp(0, 15),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 10.sp.clamp(0, 12),
                                              ),
                                              Text(
                                                "1994 Broadway, New York",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    color:
                                                        const Color(0xFF333333),
                                                    fontSize:
                                                        10.sp.clamp(0, 12)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 2.h),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.5.w,
                                              child: SizedBox(
                                                child: Text(
                                                  "    Wifi • Shower • Kitchen • Security •\n Parking • Balcony • Friendly Environment",
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: TextStyle(
                                                      fontSize:
                                                          9.sp.clamp(0, 11),
                                                      fontFamily: "Roboto",
                                                      color: const Color(
                                                          0xFF1D1B20)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Price Estimate",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 12.sp.clamp(0, 14),
                                                color: const Color(0xFF323232),
                                                letterSpacing: 0.15.w,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text("c2,000/",
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize:
                                                        18.sp.clamp(0, 20),
                                                    color:
                                                        const Color(0xFF323232),
                                                  )),
                                              Text(
                                                "Academic Year",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize:
                                                        12.sp.clamp(0, 14),
                                                    color: const Color(
                                                        0xFF323232)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    tapped
                        ? Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15.0.w, top: 40.h, right: 15.0.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Booking Date",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          ),
                                          Text(
                                            "August 08, 2024 | 4:40 PM",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Check In",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          ),
                                          Text(
                                            "August 08, 2024",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Check Out",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          ),
                                          Text(
                                            "August 08, 2026",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Tenant",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          ),
                                          Text(
                                            "01 person",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      const Divider(),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Amount",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          ),
                                          Text(
                                            "c 1,800",
                                            style: TextStyle(
                                                fontSize: 14.sp.clamp(0, 16),
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Tax & Fees",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          ),
                                          Text(
                                            "c 200.00",
                                            style: TextStyle(
                                                fontSize: 14.sp.clamp(0, 16),
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                                fontSize: 12.sp.clamp(0, 14)),
                                          ),
                                          Text(
                                            "c 2,000",
                                            style: TextStyle(
                                                fontSize: 14.sp.clamp(0, 16),
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Divider(height: .2.h),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/payment/Simplification.png",
                                                width: 25.w,
                                                height: 25,
                                                color: Colors.black,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                "Debit Card",
                                                style: TextStyle(
                                                    fontSize:
                                                        12.sp.clamp(0, 14)),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                              child: Text(
                                                "Change",
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 33, 243, 201),
                                                  fontSize: 12.sp.clamp(0, 14),
                                                ),
                                              ),
                                              onPressed: () {})
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    color: const Color(0xFFF5F8FF),
                                    height: 10.h),
                                Container(
                                  color: Colors.white,
                                  height: 60.h,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0.h, horizontal: 12.w),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF00EFD1),
                                      ),
                                      child: const Text(
                                        "Pay now",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Visibility(
                            visible: false, child: Placeholder()),
                    SizedBox(
                      height: 100.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
