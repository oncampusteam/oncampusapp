import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.blue,
        color: const Color(0xFF00EFD1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Align(
          child: Image.asset(
            "assets/initial_page/transparent_logo-removebg.png",
            width: 200.w,
            height: 100.h,
          ),
        ));
  }
}
