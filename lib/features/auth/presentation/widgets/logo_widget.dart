import 'package:flutter/material.dart';
import 'package:tarkiz_infotech/core/utils/screen_utils.dart';
import 'package:tarkiz_infotech/shared_widgets/app_text.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/logo.png', height: 30.w),
        const SizedBox(width: 8),
        const AppText(
          'TARKIZ INFOTECH',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
