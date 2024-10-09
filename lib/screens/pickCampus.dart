import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:on_campus/screens/Home%20Page%20Views/home.dart';
import 'package:on_campus/screens/select_category.dart';

class Pickcampus extends StatefulWidget {
  final String username;
  const Pickcampus({super.key, required this.username});

  @override
  State<Pickcampus> createState() => _PickcampusState();
}

class _PickcampusState extends State<Pickcampus> {
  TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;
  bool pop = false;
  List<String> cities = [
    "Greater Accra",
    "Ashanti Region",
    "Western Region",
    "Cape Coast",
    "Takoradi",
    "Northen Region",
    "Upper East Region",
    "Volta Region",
    "Upper West Region"
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: GestureDetector(
              onTap: () {
                setState(() {
                  pop = true;
                });
              },
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 20.h),
                margin: EdgeInsets.only(bottom: 50.h, left: 20.w, right: 20.w),
                height: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 239, 209),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                // padding: EdgeInsets.only(left: 10.w),
                width: 330.w,
                child: Align(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.sp.clamp(0, 20),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                margin: EdgeInsets.only(left: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "Pick Your Campus",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 31.sp.clamp(0, 31),
                        fontFamily: "Poppins-Bold",
                        // fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                        border: Border.all(
                          width: 2.w,
                          color: Colors.grey,
                        ),
                      ),
                      width: 370.w,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search_outlined),
                            prefixIconColor: Colors.grey,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // fillColor: Colors.white,
                            hintText: "Search by Region University or Hostel",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              // fontWeight: FontWeight.w600,
                              fontSize: 20.sp.clamp(0, 20),
                            )),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (BuildContext context, int index) {
                          index = index;
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  debugPrint(
                                      "this is the value of selected :$selectedIndex");
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 600),
                                margin: EdgeInsets.only(right: 10.h, left: 5.h),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: selectedIndex == index
                                      ? Border(
                                          bottom: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 0, 239, 209),
                                            width: 1,
                                          ),
                                        )
                                      : null,
                                ),
                                child: SizedBox(
                                  child: Text(
                                    cities[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 15.sp.clamp(0, 15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Row(
                      children: [
                        Image.asset(
                          "assets/pickCampus/University.png",
                          height: 35.h,
                          width: 40.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Text(
                            "Popular University in ${cities[selectedIndex]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 20.sp.clamp(0, 20),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
          pop
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.black38,
                        Colors.black38,
                      ],
                    ),
                  ),
                )
              : const Visibility(
                  visible: true,
                  child: Placeholder(color: Colors.transparent),
                ),
          pop
              ? SelectCategory(username: widget.username)
              : const Visibility(
                  visible: true,
                  child: Placeholder(color: Colors.transparent),
                ),
        ],
      ),
    );
  }
}
