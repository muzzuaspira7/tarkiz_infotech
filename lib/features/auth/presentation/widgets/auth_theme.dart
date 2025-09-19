import 'package:flutter/material.dart';
import '../../../../core/constant/app_colors.dart';

class AuthTheme extends StatelessWidget {
  final Widget child;

  const AuthTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final gradientHeight = screenHeight * 0.22; // Top 20%

    return Stack(
      children: [
        Positioned.fill(child: Container(color: Colors.white)),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: gradientHeight,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.kPrimaryGradientTop, 
                  Colors.white,  
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(child: SafeArea(child: child)),
      ],
    );
  }
}
