import 'package:flutter/material.dart';
import 'package:tarkiz_infotech/core/utils/screen_utils.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../shared_widgets/app_text.dart';

class CustomToggle extends StatelessWidget {
  final String leftText;
  final String rightText;
  final bool isLeftSelected;
  final ValueChanged<bool> onToggle;

  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final double borderRadius;

  const CustomToggle({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.isLeftSelected,
    required this.onToggle,
    this.selectedColor = AppColors.kButtonColor,
    this.unselectedColor = AppColors.kInactiveButtonColor,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = AppColors.kTextSecondary,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kInactiveButtonColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Row(
          children: [
            _ToggleOption(
              text: leftText,
              isSelected: isLeftSelected,
              onTap: () => onToggle(true),
              selectedColor: selectedColor,
              unselectedColor: Colors.transparent,
              selectedTextColor: selectedTextColor,
              unselectedTextColor: unselectedTextColor,
            ),
            _ToggleOption(
              text: rightText,
              isSelected: !isLeftSelected,
              onTap: () => onToggle(false),
              selectedColor: selectedColor,
              unselectedColor: Colors.transparent,
              selectedTextColor: selectedTextColor,
              unselectedTextColor: unselectedTextColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;

  const _ToggleOption({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedTextColor,
    required this.unselectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient:
                isSelected
                    ? const LinearGradient(
                      colors: [
                        AppColors.kButtonGradientStart,
                        AppColors.kButtonGradientEnd,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : null,
            color: isSelected ? null : unselectedColor,
          ),
          child: Center(
            child: AppText(
              text,
              fontWeight: FontWeight.normal,
              color: isSelected ? selectedTextColor : unselectedTextColor,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
