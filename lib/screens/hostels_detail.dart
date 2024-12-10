import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:on_campus/classes/classes.dart';
import 'package:on_campus/firebase/classes.dart';
import 'package:on_campus/screens/Home%20Page%20Views/payment.dart';

class HostelDetails extends StatefulWidget {
  final String username;
  final Hostels hostel;
  const HostelDetails({
    super.key,
    required this.username,
    required this.hostel,
  });

  @override
  State<HostelDetails> createState() => _HostelDetailsState();
}

int number = 0;
int gender = 0;
int duration = 0;

class _HostelDetailsState extends State<HostelDetails> {
  int selectedIndex = 0;
  List<Photos> tileList = [
    Photos(name: "Overview"),
    Photos(name: "Description"),
    Photos(name: "Amenities"),
    Photos(name: "Room type"),
    Photos(name: "Policies"),
  ];
  List<Swipper> swipers = [
    Swipper(image: "assets/search/search_imgs.jpeg"),
    Swipper(image: "assets/search/search_imgs_1.jpeg"),
    Swipper(image: "assets/search/search_imgs_2.jpeg"),
    Swipper(image: "assets/search/search_imgs_3.jpeg"),
    Swipper(image: "assets/search/search_imgs_4.jpeg"),
  ];
  double height = 0;
  bool bookNow = false;

  double selectInfoHeight = 0;
  bool selectInfo = false;
  Widget selectWidget() {
    return AnimatedContainer(
      height: selectInfoHeight,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
          color: const Color(0xFFFEFEFE),
          // color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.15),
            ),
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.30),
            )
          ]),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 5.h,
                width: 30.w,
                decoration: BoxDecoration(
                    color: const Color(0xFF79747E),
                    borderRadius: BorderRadius.circular(100.r)),
              ),
              5.verticalSpace,
              Text("Select Info",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp.clamp(0, 16),
                    letterSpacing: 0.2,
                  )),
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Number",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp.clamp(0, 16),
                              letterSpacing: 0.2,
                            )),
                        Text("Maximum 4 in a room",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: const Color(0xFF333333),
                              fontSize: 10.sp.clamp(0, 10),
                            ))
                      ]),
                  Row(
                    children: [
                      Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withOpacity(0.05))
                              ]),
                          child: const Align(
                              child: Text("-",
                                  style: TextStyle(color: Color(0xFF00EFD1))))),
                      5.horizontalSpace,
                      Text("$number",
                          style: TextStyle(
                              fontSize: 16.sp.clamp(0, 16),
                              fontWeight: FontWeight.w500)),
                      5.horizontalSpace,
                      Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withOpacity(0.05))
                              ]),
                          child: const Align(
                              child: Text("+",
                                  style: TextStyle(color: Color(0xFF00EFD1)))))
                    ],
                  )
                ],
              ),
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp.clamp(0, 16),
                              letterSpacing: 0.2,
                            )),
                        Text("Females Only",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: const Color(0xFF333333),
                              fontSize: 10.sp.clamp(0, 10),
                            ))
                      ]),
                  Row(
                    children: [
                      Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withOpacity(0.05))
                              ]),
                          child: const Align(
                              child: Text("-",
                                  style: TextStyle(color: Color(0xFF00EFD1))))),
                      5.horizontalSpace,
                      Text("$duration",
                          style: TextStyle(
                              fontSize: 16.sp.clamp(0, 16),
                              fontWeight: FontWeight.w500)),
                      5.horizontalSpace,
                      Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withOpacity(0.05))
                              ]),
                          child: const Align(
                              child: Text("+",
                                  style: TextStyle(color: Color(0xFF00EFD1)))))
                    ],
                  ),
                ],
              ),
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Duration",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp.clamp(0, 16),
                              letterSpacing: 0.2,
                            )),
                        Text("Maximum 4 years",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: const Color(0xFF333333),
                              fontSize: 10.sp.clamp(0, 10),
                            ))
                      ]),
                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                              color: Colors.black.withOpacity(0.05),
                            ),
                          ],
                        ),
                        child: const Align(
                          child: Text(
                            "-",
                            style: TextStyle(
                              color: Color(0xFF00EFD1),
                            ),
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        "$number",
                        style: TextStyle(
                          fontSize: 16.sp.clamp(0, 16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      5.horizontalSpace,
                      Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withOpacity(0.05))
                              ]),
                          child: const Align(
                              child: Text("+",
                                  style: TextStyle(color: Color(0xFF00EFD1)))))
                    ],
                  )
                ],
              ),
              15.verticalSpace,
              SizedBox(
                height: 40.h,
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r)))),
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 0, 239, 209))),
                  onPressed: () async {
                    Get.to(
                      () => Payment(username: widget.username),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text("Continue",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp.clamp(0, 12),
                      )),
                ),
              )
            ],
          ))),
    );
  }

  Widget book() {
    return AnimatedContainer(
      height: height,
      width: MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Align(
                  child: Container(
                    height: 5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: const Color(0xFF79747E),
                        borderRadius: BorderRadius.circular(100.r)),
                  ),
                ),
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("20% Off",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp.clamp(0, 12),
                          letterSpacing: 0.15.w,
                          color: const Color(0xFF00EFD1))),
                  Row(
                    children: [
                      Icon(Icons.star_border_outlined,
                          size: 15.h, color: const Color(0xFF00EFD1)),
                      Text("4.5",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15.w,
                              fontSize: 12.sp.clamp(0, 12),
                              color: const Color(0xFF323232))),
                      Text(" (180 reviews)",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15.w,
                              fontSize: 12.sp.clamp(0, 12),
                              color: const Color.fromRGBO(50, 50, 50, 0.6)))
                    ],
                  )
                ],
              ),
              15.verticalSpace,
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Albert-Acquah Hall",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp.clamp(0, 20),
                          color: const Color(0xFF1D1B20))),
                  Row(
                    children: [
                      Image.asset("assets/hostels_detail/location.png",
                          height: 12.h, width: 10.w),
                      Text(
                          "${widget.hostel.city}, ${widget.hostel.region} Region",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 10.sp.clamp(0, 10),
                          ))
                    ],
                  )
                ],
              )),
              const Divider(color: Color.fromRGBO(120, 120, 120, 0.3)),
              Text("Book Hostel",
                  style: TextStyle(
                      fontSize: 18.sp.clamp(0, 18),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2.w,
                      color: const Color(0xFF323232))),
              10.verticalSpace,
              Text("Check in",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15.sp.clamp(0, 15),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2.w,
                      color: const Color(0xFF323232))),
              SizedBox(
                height: 45.h,
                width: 400.w,
                child: Stack(children: [
                  Positioned(
                    top: 5.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                            border: Border.all(color: const Color(0xFf323232))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("08/17/2024",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp.clamp(0, 16),
                                      letterSpacing: 0.5.w,
                                      color: const Color(0xFF323232))),
                              Container(
                                  height: 30.h,
                                  width: 30.w,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF00EFD1)),
                                  child: Image.asset(
                                    "assets/hostels_detail/calender.png",
                                  ))
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                      top: 0,
                      left: 10.h,
                      child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 3.h),
                          child: Text("Date",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 12.sp.clamp(0, 12),
                                  color: const Color(0xFF323232)))))
                ]),
              ),
              Container(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text("MM/DD/YY",
                      style: TextStyle(
                          fontFamily: "Roboto", fontSize: 12.sp.clamp(0, 12)))),
              15.verticalSpace,
              Text("Check out",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15.sp.clamp(0, 15),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2.w,
                      color: const Color(0xFF323232))),
              SizedBox(
                height: 45.h,
                width: 400.w,
                child: Stack(children: [
                  Positioned(
                    top: 5.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                            border: Border.all(color: const Color(0xFf323232))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("08/17/2024",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp.clamp(0, 16),
                                      letterSpacing: 0.5.w,
                                      color: const Color(0xFF323232))),
                              Container(
                                  height: 30.h,
                                  width: 30.w,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF00EFD1)),
                                  child: Image.asset(
                                      "assets/hostels_detail/calender.png",
                                      height: 14.h,
                                      width: 14.w))
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                      top: 0,
                      left: 10.h,
                      child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 3.h),
                          child: Text("Date",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 12.sp.clamp(0, 12),
                                  color: const Color(0xFF323232)))))
                ]),
              ),
              Container(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text("MM/DD/YY",
                      style: TextStyle(
                          fontFamily: "Roboto", fontSize: 12.sp.clamp(0, 12)))),
              15.verticalSpace,
              SizedBox(
                height: 40.h,
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r)))),
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 0, 239, 209))),
                  onPressed: () async {
                    setState(() {
                      selectInfoHeight =
                          MediaQuery.of(context).size.height * 0.35;
                    });
                    await Future.delayed(const Duration(milliseconds: 400));
                    setState(() {
                      selectInfo = true;
                    });
                  },
                  child: Text("Continue",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp.clamp(0, 12),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  foregroundDecoration: BoxDecoration(
                      color: bookNow ? Colors.black.withOpacity(0.75) : null),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 400.h,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xFFF5F8FF),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Swiper(
                                  controller: SwiperController(),
                                  autoplay: true,
                                  curve: Curves.easeIn,
                                  autoplayDelay: 5000,
                                  itemCount:
                                      widget.hostel.hostel_images!.length,
                                  itemBuilder: (BuildContext, index) {
                                    // Swipper swiper = swipers[index];
                                    String? string =
                                        widget.hostel.hostel_images![index];
                                    return CachedNetworkImage(
                                      imageUrl: string ?? "",
                                      width: MediaQuery.sizeOf(context).width,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          SpinKitThreeBounce(
                                        color: const Color.fromARGB(
                                            255, 0, 239, 209),
                                        size: 50.0,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 400.h,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: 16.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20.h),
                                        height: 40.h,
                                        width: 40,
                                        foregroundDecoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        child: Icon(Icons.chevron_left,
                                            color: Colors.black, size: 24),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20.h),
                                      foregroundDecoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      height: 40.h,
                                      width: 40.w,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              child: const Icon(Icons.favorite,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              child: const Icon(
                                                  Icons.favorite_border,
                                                  color: Color(0xFF00EFD1)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  // height: 160.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 15.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 50.h, left: 10.h),
                                        // color: Colors.red,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.hostel.name,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 24.sp.clamp(0, 24),
                                                letterSpacing: 0.1.w,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 5.h),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 2.h),
                                                          child: Image.asset(
                                                              "assets/hostels_detail/location_white.png",
                                                              height: 15.h,
                                                              width: 15.w.clamp(
                                                                  0, 15))),
                                                      Text(
                                                        "${widget.hostel.city}, ${widget.hostel.region} Region",
                                                        style: TextStyle(
                                                          fontFamily: "Roboto",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 12
                                                              .sp
                                                              .clamp(0, 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Container(
                                                  //     margin: EdgeInsets.only(
                                                  //         left: 7.h),
                                                  //     height: 10.h,
                                                  //     width: 1.w,
                                                  //     color: Colors.white),
                                                  // Row(
                                                  //   children: [
                                                  //     Container(
                                                  //         margin:
                                                  //             EdgeInsets.only(
                                                  //                 left: 1.h),
                                                  //         child: Image.asset(
                                                  //             'assets/hostels_detail/University_white.png',
                                                  //             height: 15.h,
                                                  //             width: 15.w.clamp(
                                                  //                 0, 15))),
                                                  //     SizedBox(width: 5.w),
                                                  //     SizedBox(
                                                  //       height: 22.h,
                                                  //       child: Text(
                                                  //         "Main Campus, University of Ghana\nAccra",
                                                  //         style: TextStyle(
                                                  //           fontFamily:
                                                  //               "Roboto",
                                                  //           fontWeight:
                                                  //               FontWeight.w500,
                                                  //           color: Colors.white,
                                                  //           fontSize: 12
                                                  //               .sp
                                                  //               .clamp(0, 12),
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  // SizedBox(height: 5.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                          Icons
                                                              .directions_walk_sharp,
                                                          color: Colors.white),
                                                      Text(
                                                        // " 1 hour 08 min",
                                                        "${widget.hostel.distance_walk} mins",
                                                        style: TextStyle(
                                                          fontFamily: "Roboto",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 12
                                                              .sp
                                                              .clamp(0, 12),
                                                        ),
                                                      ),
                                                      5.horizontalSpace,
                                                      Image.asset(
                                                        "assets/hostels_detail/Steering Wheel.png",
                                                        width: 15.w,
                                                        height: 15.h,
                                                      ),
                                                      Text(
                                                        " ${widget.hostel.distance_car} mins",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11
                                                              .sp
                                                              .clamp(0, 11),
                                                        ),
                                                      ),
                                                      5.horizontalSpace,
                                                      Image.asset(
                                                          "assets/hostels_detail/Bus_white.png",
                                                          height: 15.h,
                                                          width: 15.w),
                                                      Text(
                                                        " ${widget.hostel.distance_car} mins",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11
                                                              .sp
                                                              .clamp(0, 11),
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
                                      Container(
                                        height: 130.h,
                                        // color: Colors.blue,
                                        margin: EdgeInsets.only(
                                            right: 10.h, top: 15.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                child: Image.asset(
                                                  'assets/hostels_detail/hostel-2.png',
                                                  height: 35.h,
                                                  width: 40.w.clamp(0, 40),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // SizedBox(height: 10.h),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                child: Image.asset(
                                                  'assets/hostels_detail/hostel-2.png',
                                                  height: 35.h,
                                                  width: 40.w.clamp(0, 40),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // SizedBox(height: 10.h),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.w),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                child: Image.asset(
                                                  'assets/hostels_detail/hostel-2.png',
                                                  height: 35.h,
                                                  width: 40.w.clamp(0, 40),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: const Color(0xFFF5F8FF),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: SizedBox(
                                height: 70.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5).r,
                                      ),
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.black87,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          side: BorderSide(
                                            width: 1.w,
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/photos.png",
                                                height: 15.h,
                                                width: 15.w),
                                            Text(
                                              " Photos",
                                              style: TextStyle(
                                                fontFamily: "Work Sans",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13.sp.clamp(0, 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5).r,
                                      ),
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.black87,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          side: const BorderSide(
                                              width: 1, color: Colors.black),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/videocam.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(
                                              " Videos",
                                              style: TextStyle(
                                                fontFamily: "Work Sans",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13.sp.clamp(0, 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5).r,
                                      ),
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.black87,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            side: BorderSide(
                                                width: 1.w,
                                                color: Colors.black)),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/360 View.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(
                                              " View",
                                              style: TextStyle(
                                                fontFamily: "Work Sans",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13.sp.clamp(0, 13),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F8FF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3.r,
                                    blurRadius: 8.r,
                                    // offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 36.h,
                              width: 600.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: tileList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Photos tile = tileList[index];
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        height: 36.h,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          border: selectedIndex == index
                                              ? Border(
                                                  bottom: BorderSide(
                                                    color:
                                                        const Color(0xFF00EFD1),
                                                    width: 1.5.w,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        child: Align(
                                          child: Container(
                                            child: Text(
                                              tile.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: selectedIndex == index
                                                    ? null
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w,
                                      right: 20.w,
                                      top: 5.h,
                                      bottom: 10.h),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.sp.clamp(0, 20),
                                            letterSpacing: 0.15.w,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Welcome to resort paradise we ensure the best service during your stay in bali with an emphasis on customer comfort. Enjoy Balinese specialties, dance and music every saturday for free at competitve prices you can...",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: const Color(0xFF787878),
                                          fontSize: 12.sp.clamp(0, 12),
                                        ),
                                      ),
                                      const Divider(
                                        color:
                                            Color.fromRGBO(120, 120, 120, 0.7),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Read More",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              letterSpacing: 0.15.w,
                                              color: const Color(0xFF00EFD1),
                                              fontSize: 15.sp.clamp(0, 15),
                                            )),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(height: 20.h),
                            Container(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 10.h),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Amenities",
                                        style: TextStyle(
                                            fontSize: 20.sp.clamp(0, 20),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  "assets/hostels_detail/bed.png",
                                                  height: 24.h,
                                                  width: 24.w),
                                              Text(
                                                " Bed",
                                                style: TextStyle(
                                                  fontFamily: "Work Sans",
                                                  fontSize: 14.sp.clamp(0, 14),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  "assets/hostels_detail/desk.png",
                                                  height: 24.h,
                                                  width: 24.w),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 5.h),
                                                child: Text(
                                                  " Study Desk",
                                                  style: TextStyle(
                                                    fontFamily: "Work Sans",
                                                    fontSize:
                                                        14.sp.clamp(0, 14),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/hostels_detail/kitchen.png",
                                                        height: 24.h,
                                                        width: 24.w),
                                                    Text(
                                                      " Kitchen",
                                                      style: TextStyle(
                                                        fontFamily: "Work Sans",
                                                        fontSize:
                                                            14.sp.clamp(0, 14),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/hostels_detail/view_more.png",
                                                      height: 24.h,
                                                      width: 24.w),
                                                  Text(
                                                    " More",
                                                    style: TextStyle(
                                                      fontFamily: "Work Sans",
                                                      fontSize:
                                                          14.sp.clamp(0, 14),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Bills included",
                                        style: TextStyle(
                                          letterSpacing: 0.15.w,
                                          fontSize: 16.sp.clamp(0, 16),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(children: [
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/hostels_detail/electricity.png",
                                                      height: 24.h,
                                                      width: 24.w),
                                                  Text(
                                                    " Electricity",
                                                    style: TextStyle(
                                                      fontFamily: "Work Sans",
                                                      fontSize:
                                                          14.sp.clamp(0, 14),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/hostels_detail/tap.png",
                                                      height: 24.h,
                                                      width: 24.w),
                                                  Text(
                                                    " Water",
                                                    style: TextStyle(
                                                      fontFamily: "Work Sans",
                                                      fontSize:
                                                          14.sp.clamp(0, 14),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.4,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/hostels_detail/wifi.png",
                                                        height: 24.h,
                                                        width: 24.w),
                                                    Text(
                                                      " Free Wifi",
                                                      style: TextStyle(
                                                        fontFamily: "Work Sans",
                                                        fontSize:
                                                            14.sp.clamp(0, 14),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/hostels_detail/view_more.png",
                                                      height: 24.h,
                                                      width: 24.w),
                                                  Text(
                                                    " More",
                                                    style: TextStyle(
                                                      fontFamily: "Work Sans",
                                                      fontSize:
                                                          14.sp.clamp(0, 14),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Security & Safety",
                                        style: TextStyle(
                                            fontSize: 16.sp.clamp(0, 16),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.4,
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            "assets/hostels_detail/cctv.png",
                                                            height: 24.h,
                                                            width: 24.w),
                                                        Text(
                                                          " CCTV",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Work Sans",
                                                            fontSize: 14
                                                                .sp
                                                                .clamp(0, 14),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          "assets/hostels_detail/security.png",
                                                          height: 24.h,
                                                          width: 24.w),
                                                      Text(
                                                        " 24/7 Security",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Work Sans",
                                                          fontSize: 14
                                                              .sp
                                                              .clamp(0, 14),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 20.h),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Room Types(2)",
                                        style: TextStyle(
                                            fontSize: 20.sp.clamp(0, 20),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    const Divider(),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                          child: Image.asset(
                                            "assets/hostels_detail/roomTypeImage.png",
                                            height: 70.h,
                                            width: 90.w.clamp(0, 90),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "2 in Room Bedroom Apartment",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize:
                                                          16.sp.clamp(0, 16),
                                                      // letterSpacing: 0.2.w,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  Text("¢4,000/",
                                                      style: TextStyle(
                                                          fontSize: 18
                                                              .sp
                                                              .clamp(0, 18))),
                                                  Text(
                                                    "Academic Year",
                                                    style: TextStyle(
                                                        fontSize:
                                                            12.sp.clamp(0, 12)),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Available Rooms:",
                                                    style: TextStyle(
                                                        fontSize:
                                                            12.sp.clamp(0, 12)),
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xFF23A26D)
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r),
                                                    ),
                                                    width: 55.w,
                                                    height: 25.h,
                                                    child: Center(
                                                      child: Text(
                                                        "Sold out",
                                                        style: TextStyle(
                                                          fontSize: 10
                                                              .sp
                                                              .clamp(0, 10),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0xFF00EFD1),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                        // Image.asset("assets/hostels_detail/bed.jpeg"),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(children: [
                                            Image.asset(
                                                "assets/hostels_detail/home.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Container(
                                              margin: EdgeInsets.only(top: 5.h),
                                              child: Text(
                                                " Bedroom 1",
                                                style: TextStyle(
                                                    fontFamily: "Work Sans",
                                                    fontSize:
                                                        14.sp.clamp(0, 14),
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF323232)),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/bathtub.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Container(
                                              margin: EdgeInsets.only(top: 5.h),
                                              child: Text(
                                                " Bathroom 1",
                                                style: TextStyle(
                                                    fontFamily: "Work Sans",
                                                    fontSize:
                                                        14.sp.clamp(0, 14),
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF323232)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  "assets/hostels_detail/bed.png",
                                                  height: 24.h,
                                                  width: 24.w),
                                              Text(
                                                " 2 Beds",
                                                style: TextStyle(
                                                  fontFamily: "Work Sans",
                                                  color:
                                                      const Color(0xFF323232),
                                                  fontSize: 14.sp.clamp(0, 14),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/home.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Container(
                                              margin: EdgeInsets.only(top: 5.h),
                                              child: Text(
                                                " Private Bedroom",
                                                style: TextStyle(
                                                  fontFamily: "Work Sans",
                                                  fontSize: 14.sp.clamp(0, 14),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          child: Container(
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "View more details",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 40.h),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/kitchen.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(
                                              " Private Kitchen",
                                              style: TextStyle(
                                                fontFamily: "Work Sans",
                                                fontSize: 14.sp.clamp(0, 14),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Divider(
                                        color: const Color.fromRGBO(
                                            120, 120, 120, 0.7),
                                        height: .2.h),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Text(
                                            "Academic Year",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Move in: 08 Aug 2024",
                                          style: TextStyle(
                                              fontSize: 13.sp.clamp(0, 13),
                                              color: const Color(0xFF323232)),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Column(children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Price Estimate",
                                                    style: TextStyle(
                                                        fontSize:
                                                            12.sp.clamp(0, 12),
                                                        letterSpacing: 0.2.w,
                                                        color: const Color(
                                                            0xFF787878)),
                                                  )),
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  Text("¢2,000/",
                                                      style: TextStyle(
                                                        fontSize:
                                                            18.sp.clamp(0, 18),
                                                      )),
                                                  Expanded(
                                                    child: Text(
                                                      "Academic Year",
                                                      style: TextStyle(
                                                          fontSize: 12
                                                              .sp
                                                              .clamp(0, 12),
                                                          color: const Color(
                                                              0xFF787878)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 110.w,
                                                height: 40.h,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    shape:
                                                        ContinuousRectangleBorder(
                                                      side: BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.r),
                                                    ),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 33, 243, 201),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Book now",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            14.sp.clamp(0, 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 20.h),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                          child: Image.asset(
                                            "assets/hostels_detail/Hostel 1.png",
                                            height: 70.h,
                                            width: 90.w,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "4 in Room Bedroom Apartment",
                                                style: TextStyle(
                                                    fontSize:
                                                        16.sp.clamp(0, 16),
                                                    letterSpacing: 0.2.w,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  Text("¢2000",
                                                      style: TextStyle(
                                                          fontSize: 18
                                                              .sp
                                                              .clamp(0, 18))),
                                                  Text(
                                                    "/Academic Year",
                                                    style: TextStyle(
                                                        fontSize:
                                                            12.sp.clamp(0, 12)),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5.h),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Available Rooms:",
                                                    style: TextStyle(
                                                        fontSize:
                                                            12.sp.clamp(0, 12)),
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  const Text(
                                                    "5",
                                                    style: TextStyle(
                                                      color: Color(0xFF00EFD1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(children: [
                                            Image.asset(
                                                "assets/hostels_detail/home.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(
                                              " Bedroom 1",
                                              style: TextStyle(
                                                  fontSize: 14.sp.clamp(0, 14),
                                                  fontFamily: "Work Sans",
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF323232)),
                                            ),
                                          ]),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/bathtub.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(" Bathroom 1",
                                                style: TextStyle(
                                                    fontSize:
                                                        14.sp.clamp(0, 14),
                                                    fontFamily: "Work Sans",
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF323232))),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Row(children: [
                                            Image.asset(
                                                "assets/hostels_detail/bed.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(" 2 Beds",
                                                style: TextStyle(
                                                    fontSize:
                                                        14.sp.clamp(0, 14),
                                                    fontFamily: "Work Sans",
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF323232))),
                                          ]),
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/bathtub.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(" Shared Bathroom",
                                                style: TextStyle(
                                                    fontSize:
                                                        14.sp.clamp(0, 14),
                                                    fontFamily: "Work Sans",
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF323232))),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          child: Container(
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "View more details",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 45,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/hostels_detail/kitchen.png",
                                                height: 24.h,
                                                width: 24.w),
                                            Text(" Shared Kitchen",
                                                style: TextStyle(
                                                    fontSize:
                                                        14.sp.clamp(0, 14),
                                                    fontFamily: "Work Sans",
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF323232))),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Divider(color: Colors.black, height: .2.h),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Text(
                                            "Academic Year",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        // const Text("Move in: 08 Aug 2024",)
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Column(children: [
                                              const Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Price Estimate",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF787878)))),
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  Text("¢2,000/",
                                                      style: TextStyle(
                                                          fontSize: 18
                                                              .sp
                                                              .clamp(0, 18))),
                                                  Expanded(
                                                    child: Text(
                                                      "Academic Year",
                                                      style: TextStyle(
                                                          fontSize: 12
                                                              .sp
                                                              .clamp(0, 12)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 130.w,
                                                height: 40.h,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    shape:
                                                        ContinuousRectangleBorder(
                                                      side: BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.r),
                                                    ),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 33, 243, 201),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Enquire Now",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            14.sp.clamp(0, 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              // height: 50.h,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(15.0.r),
                                child: Row(children: [
                                  Text(
                                    "View More Rooms",
                                    style: TextStyle(
                                      color: const Color(0xFF00EFD1),
                                      fontSize: 20.sp.clamp(0, 20),
                                      letterSpacing: 0.2.w,
                                      // fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xFF00EFD1),
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(20.r),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Cancellation Policies",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.sp.clamp(0, 20),
                                              letterSpacing: 0.2.w),
                                        )),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Cooling off period",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text("View",
                                              style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15),
                                                color: const Color(0xFF00EFD1),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(20.r),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Payment Details",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp.clamp(0, 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Booking deposit",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Payment Iinstallment plan",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Mode of payment",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Guarantor requirement",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(20.r),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Location",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp.clamp(0, 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0.w),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width.w,
                                        height: 400.h,
                                        // color: Colors.red,
                                        child: Image.asset(
                                          "assets/hostels_detail/screenshot.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(20.r),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Frequently Asked Questions (FAQs)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp.clamp(0, 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Can i bring a TV?",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Can i make a group booking?",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Can i have friends stay over?",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Do i have a cleaner?",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Is beddings and linens provided?",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("What are our rents covered?",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      height: .2.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Do i need a guarantor?",
                                            style: TextStyle(
                                                fontSize: 15.sp.clamp(0, 15))),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              fontSize: 15.sp.clamp(0, 15),
                                              color: const Color(0xFF00EFD1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 45.h),
                                  ],
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3.r,
                        blurRadius: 12.r,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .4,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Price Estimate",
                                  style: TextStyle(
                                      fontSize: 13.sp.clamp(0, 13),
                                      color: const Color(0xFF787878)),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Text("¢2,000",
                                      style: TextStyle(
                                        fontSize: 18.sp.clamp(0, 18),
                                      )),
                                  Expanded(
                                    child: Text(
                                      "/Academic Year",
                                      style: TextStyle(
                                          fontSize: 12.sp.clamp(0, 12),
                                          color: const Color(0xFF787878)),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 110.w,
                          height: 40.h,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                bookNow = true;
                                height =
                                    MediaQuery.of(context).size.height * 0.5;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: ContinuousRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              backgroundColor: const Color(0xFF00EFD1),
                            ),
                            child: Center(
                              child: Text(
                                "Book now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp.clamp(0, 11),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bookNow
                  ? Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            bookNow = false;
                            height = 0;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.transparent,
                        ),
                      ))
                  : Positioned(child: Container()),
              Positioned(bottom: 0, right: 0, left: 0, child: book()),
              selectInfo
                  ? Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectInfo = false;
                            selectInfoHeight = 0;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ))
                  : Positioned(child: Container()),
              Positioned(bottom: 0, right: 0, left: 0, child: selectWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
