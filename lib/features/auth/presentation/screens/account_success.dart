import 'package:flutter/material.dart';
import 'package:tarkiz_infotech/core/constant/app_colors.dart';
import 'package:tarkiz_infotech/shared_widgets/app_text.dart';
import 'package:tarkiz_infotech/shared_widgets/gradient_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSuccess extends StatelessWidget {
  const AccountSuccess({super.key});

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
              Color.fromARGB(128, 187, 227, 230),
              Color.fromARGB(102, 167, 208, 209),
              Color(0x808FE3E9),
              Color.fromARGB(102, 162, 204, 206),
              Color(0x808BDCDC),
              Color.fromARGB(102, 149, 197, 199),
              Color.fromARGB(128, 153, 218, 219),
            ],
            stops: [0.0, 0.15, 0.3, 0.45, 0.6, 0.75, 1.0],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
          child: Column(
            children: [
              const Spacer(),
              Column(
                children: [
                  CircleAvatar(
                    radius: 50.w,
                    backgroundColor: AppColors.kLightGreen,
                    child: Icon(Icons.check, color: Colors.green, size: 70.w),
                  ),
                  SizedBox(height: 20.h),
                  AppText(
                    "Account Successful!",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 280.w,
                    child: AppText(
                      textAlign: TextAlign.center,
                      "Your account is ready. Let’s begin for a better HRMS experience",
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.kTextSecondary,
                    ),
                  ),
                ],
              ),

              const Spacer(),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: GradientButton(text: "Done", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
