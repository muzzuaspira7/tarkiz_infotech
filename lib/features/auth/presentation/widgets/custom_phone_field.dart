import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/constant/app_colors.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? stringValidator;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.onChanged,
    this.stringValidator,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: 'IN',
      disableLengthCheck: true,
      onChanged: (phone) {
        if (onChanged != null) onChanged!(phone.number);
      },
      style: const TextStyle(color: Colors.black),
      dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Phone Number*',
        hintStyle: TextStyle(color: AppColors.kTextSecondary),
        filled: true,
        fillColor: AppColors.kPrimaryGradientBottom,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.kTextSecondary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.kTextSecondary.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.kButtonColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
      validator: (phoneNumber) {
        final number = phoneNumber?.number;
        if (stringValidator != null) return stringValidator!(number);
        return null;
      },
    );
  }
}
