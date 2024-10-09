import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:on_campus/classes/classes.dart';
import 'package:on_campus/classes/hostel.dart';
import 'package:on_campus/customscroll.dart';
import 'package:on_campus/screens/Home%20Page%20Views/home.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            scrollBehavior: CustomScroll(),
            home: const Search(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Poppins",
              useMaterial3: true,
            ),
          );
        });
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Hostel> hostels = [
    Hostel(
      category: "",
      hotelName: "Joemat luxury hostel",
      imageUrl: "assets/search/joemat.jpeg",
      location: "Kenyasi",
      price: "",
      rate: "4.7",
      roomCapacity: 2,
    ),
    Hostel(
      category: "",
      hotelName: "Albert-Acquah hostel",
      imageUrl: "assets/search/albert.jpeg",
      location: "Kenyasi",
      price: "",
      rate: "4.6",
      roomCapacity: 2,
    ),
  ];
  List<Hostel> recommendedHostels = [
    Hostel(
      category: "",
      hotelName: "Ultimate hostel",
      imageUrl: "assets/search/ultimate.jpeg",
      location: "Kenyasi",
      price: "",
      rate: "4.5",
      roomCapacity: 2,
    ),
    Hostel(
      category: "",
      hotelName: "Adom hostel",
      imageUrl: "assets/search/adom.jpeg",
      location: "Kenyasi",
      price: "",
      rate: "4.4",
      roomCapacity: 2,
    ),
  ];
  List<Swipper> swipers = [
    Swipper(image: "assets/search/search_imgs.jpeg"),
    Swipper(image: "assets/search/search_imgs_1.jpeg"),
    Swipper(image: "assets/search/search_imgs_2.jpeg"),
    Swipper(image: "assets/search/search_imgs_3.jpeg"),
    Swipper(image: "assets/search/search_imgs_4.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Allows overflowing of Positioned widget
        alignment: Alignment.topCenter,
        children: [
          // First item (image)
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 200.h,
              child: Stack(
                children: [
                  Swiper(
                      controller: SwiperController(),
                      autoplay: true,
                      curve: Curves.easeIn,
                      pagination: SwiperPagination(
                        margin: EdgeInsets.only(bottom: 30.h),
                      ),
                      autoplayDelay: 5000,
                      itemCount: swipers.length,
                      itemBuilder: (BuildContext, index) {
                        Swipper swiper = swipers[index];
                        return Image.asset(
                          swiper.image,
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.cover,
                        );
                      }),
                  Container(
                      height: 200.h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.black12,
                            Colors.black87,
                          ],
                        ),
                      ),
                      child: SizedBox(
                        height: 200.h,
                        width: MediaQuery.sizeOf(context).width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, .4),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 30.h,
                                    width: 30.w,
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 17.sp.clamp(0, 17),
                                        ),
                                        color: Colors.black38,
                                        onPressed: () {
                                          Get.to(
                                            () => const Home(
                                              username: "Godfred",
                                            ),
                                            transition: Transition.fadeIn,
                                            curve: Curves.easeIn,
                                            duration: const Duration(
                                                milliseconds: 600),
                                          );
                                        }),
                                  ),
                                  Image.asset(
                                    "assets/search/logo2.png",
                                    height: 35.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, .4),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 30.h,
                                    width: 30.w,
                                    child: Icon(
                                      Icons.list,
                                      color: Colors.black38,
                                      size: 17.sp.clamp(0, 17),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                height: 35.h,
                                child: Center(
                                  child: TextField(
                                    // controller: controller,
                                    obscureText: false,
                                    enableSuggestions: true,
                                    autocorrect: true,

                                    cursorColor: Colors.grey,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11.sp.clamp(0, 11)),
                                    decoration: InputDecoration(
                                      labelText:
                                          "Search by Region, University...",
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11.sp.clamp(0, 11),
                                      ),
                                      contentPadding:
                                          EdgeInsets.only(left: 50.0.w),
                                      filled: true,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 20.sp.clamp(0, 20),
                                      ),
                                      prefixIconColor: Colors.blue,
                                      fillColor: Colors.white,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        borderSide: BorderSide(
                                          width: 0.w,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    //  TextInputType.emailAddress,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      )),
                ],
              )),
          // Second item (container) overlapping the first item
          Positioned(
            top: 180.h, // Adjust this value to control the overlap
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              // height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: const Color.fromARGB(255, 242, 246, 249),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 20.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most searched hostels",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp.clamp(0, 13)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0.w),
                            child: Text(
                              "View",
                              style: TextStyle(
                                  color: const Color(0xFF00EFD1),
                                  fontSize: 12.sp.clamp(0, 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 20.h),
                    SizedBox(
                      height: 190.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hostels.length,
                        itemBuilder: (BuildContext, index) {
                          Hostel hostel = hostels[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                width: 190.w.clamp(0, 290),
                                // height: 200.h,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30.r),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            hostel.imageUrl,
                                            height: 130.h,
                                            width: 200.w.clamp(0, 300),
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0.0.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                    child: Container(
                                                      color: Colors.black87
                                                          .withOpacity(.3),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.0.w,
                                                                vertical: 5.h),
                                                        child: Text(
                                                          "Top Choice",
                                                          style: TextStyle(
                                                            fontSize: 12
                                                                .sp
                                                                .clamp(0, 12),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 15.0.w),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.r),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0.r),
                                                          child: Icon(
                                                            Icons.favorite,
                                                            size: 17
                                                                .sp
                                                                .clamp(0, 17),
                                                            color: const Color(
                                                                0xFF00EFD1),
                                                          ),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      hostel.hotelName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp.clamp(0, 13),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 15.sp.clamp(0, 15),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          hostel.location,
                                          style: TextStyle(
                                              fontSize: 13.sp.clamp(0, 13)),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Icon(
                                          Icons.star_border_outlined,
                                          size: 15.sp.clamp(0, 15),
                                          color: const Color.fromARGB(
                                              255, 33, 243, 201),
                                        ),
                                        Text(
                                          hostel.rate,
                                          style: TextStyle(
                                              fontSize: 10.sp.clamp(0, 10)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended for you",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp.clamp(0, 13)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0.w),
                            child: Text(
                              "View",
                              style: TextStyle(
                                  color: const Color(0xFF00EFD1),
                                  fontSize: 12.sp.clamp(0, 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 20.h),
                    SizedBox(
                      height: 190.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendedHostels.length,
                        itemBuilder: (BuildContext, index) {
                          Hostel recommendedHostel = recommendedHostels[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                width: 190.w.clamp(0, 290),
                                // height: 200.h,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30.r),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            recommendedHostel.imageUrl,
                                            height: 130.h,
                                            width: 200.w.clamp(0, 300),
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  color: Colors.black87
                                                      .withOpacity(.3),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.0.w,
                                                            vertical: 5.h),
                                                    child: Text(
                                                      "Top Choice",
                                                      style: TextStyle(
                                                        fontSize:
                                                            12.sp.clamp(0, 12),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15.0.w),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0.r),
                                                      child: Icon(
                                                        Icons.favorite,
                                                        size:
                                                            17.sp.clamp(0, 17),
                                                        color: const Color(
                                                            0xFF00EFD1),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      recommendedHostel.hotelName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp.clamp(0, 15),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 15.sp.clamp(0, 15),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          recommendedHostel.location,
                                          style: TextStyle(
                                              fontSize: 13.sp.clamp(0, 13)),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Icon(
                                          Icons.star_border_outlined,
                                          size: 15.sp.clamp(0, 15),
                                          color: const Color.fromARGB(
                                              255, 33, 243, 201),
                                        ),
                                        Text(
                                          recommendedHostel.rate,
                                          style: TextStyle(
                                              fontSize: 10.sp.clamp(0, 10)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
