import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';
import 'app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final IconData? icon;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;
    final borderRadius = BorderRadius.circular(12);

    return Container(
      decoration: BoxDecoration(
        gradient:
            hasIcon
                ? null
                : (isEnabled
                    ? LinearGradient(
                      colors: [
                        AppColors.kButtonGradientStart,
                        AppColors.kButtonGradientEnd,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : null),
        color:
            hasIcon
                ? Colors.white
                : (isEnabled ? null : AppColors.kInactiveButtonColor),
        borderRadius: borderRadius,
        border:
            hasIcon
                ? Border.all(color: AppColors.kTextSecondary.withOpacity(0.4))
                : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: isEnabled ? onPressed : null,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasIcon) ...[
                  SizedBox(width: 8.w),
                  Icon(icon, color: AppColors.kButtonColor, size: 18.sp),
                ],
                AppText(
                  text,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:
                      hasIcon
                          ? AppColors.kButtonColor
                          : (isEnabled
                              ? Colors.white
                              : AppColors.kTextSecondary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
