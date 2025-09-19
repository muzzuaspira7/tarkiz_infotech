import 'package:flutter/material.dart';
import 'package:tarkiz_infotech/core/utils/screen_utils.dart';
import 'package:tarkiz_infotech/features/auth/presentation/screens/account_success.dart';
import 'package:tarkiz_infotech/shared_widgets/app_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AccountSuccess()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0x803DCAD3),
              Color(0x663CC9C4),
              Color(0x803DCAD3),
              Color(0x661FBEC9),
              Color(0x803CC9C4),
              Color(0x663DCAD3),
              Color(0x801FBEC9),
            ],
            stops: [0.0, 0.15, 0.3, 0.45, 0.6, 0.75, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: 115.w),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                AppText(
                  "TAR",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF18b0ba),
                ),

                AppText(
                  "KIZ",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF095f6d),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: Colors.black,
                size: 25.w,
              ),
            ),
            SizedBox(height: 20.h),

            AppText(
              "Loading, Please wait...",
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
