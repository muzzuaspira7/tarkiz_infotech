import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tarkiz_infotech/core/constant/app_colors.dart';
import 'package:tarkiz_infotech/core/utils/screen_utils.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final int length;
  final void Function(String)? onCompleted;

  const OtpInput({
    super.key,
    required this.controller,
    required this.focusNode,
    this.length = 6,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColors.kInactiveButtonColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryGradientBottom.withOpacity(0.1),
        border: Border.all(color: AppColors.kButtonColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.kPrimaryGradientBottom.withOpacity(0.1),
        border: Border.all(color: AppColors.kButtonColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.kButtonGradientStart.withOpacity(0.6),
            AppColors.kButtonGradientEnd.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Pinput(
      length: length,
      controller: controller,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      cursor: Container(width: 2, height: 24.h, color: AppColors.kButtonColor),
      onCompleted: onCompleted,
    );
  }
}
