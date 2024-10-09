import 'package:on_campus/screens/Home%20Page%20Views/apartment.dart';
import 'package:on_campus/screens/Home%20Page%20Views/compare.dart';
import 'package:on_campus/screens/Home%20Page%20Views/home.dart';
import 'package:on_campus/screens/Home%20Page%20Views/payment.dart';
import 'package:on_campus/screens/Home%20Page%20Views/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNav extends StatefulWidget {
  final String username;
  const BottomNav({super.key, required this.username});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentpage = 2;

  List<Widget> getPages() {
    return [
      Apartment(username: widget.username),
      Payment(username: widget.username),
      Home(username: widget.username),
      Compare(username: widget.username),
      Profile(username: widget.username),
    ];
  }

  void navigateBottomBar(int index) {
    setState(() {
      currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: getPages()[currentpage],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CurvedNavigationBar(
                  height: 50,
                  color: Color(0xFF00EFD1),
                  buttonBackgroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  animationDuration: const Duration(milliseconds: 300),
                  index: currentpage,
                  items: [
                    Image.asset(
                      "assets/apartment/my apartment.png",
                      height: 45.h,
                      width: 80.w,
                    ),
                    Image.asset(
                      "assets/apartment/payment.png",
                      height: 32.h,
                      width: 55.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/apartment/HomeIcon2.png",
                        height: 20.h,
                        width: 25.w,
                      ),
                    ),
                    Image.asset(
                      "assets/apartment/compare.png",
                      height: 35.h,
                      width: 65.w,
                    ),
                    Image.asset(
                      "assets/apartment/profile.png",
                      height: 35.h,
                      width: 65.w.clamp(0, 65),
                    ),
                  ],
                  onTap: (index) => navigateBottomBar(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
