import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared_widgets/app_text.dart';
import '../../../../shared_widgets/gradient_button.dart';
import '../../../auth/provider/auth_provider.dart';

class BottomActions extends StatelessWidget {
  final String emailOrPhone;
  final VoidCallback onRegister;
  const BottomActions({super.key, required this.emailOrPhone, required this.onRegister});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthProvider>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          "By understanding and agree with the Terms & Conditions and Privacy Policy",
          fontSize: 12,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: GradientButton(
                text: "Back",
                icon: Icons.arrow_back_ios_outlined,
                onPressed: () {
                  if (!provider.isLogin) {
                    provider.toggleLogin(true);
                  } else {
                    Navigator.pop(context);
                  }
                },
                isEnabled: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GradientButton(
                text: "Register",
                onPressed: onRegister,
                isEnabled: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
