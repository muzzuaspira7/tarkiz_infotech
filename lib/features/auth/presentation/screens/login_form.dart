import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarkiz_infotech/core/constant/app_colors.dart';
import 'package:tarkiz_infotech/features/auth/presentation/screens/otp_screen.dart';
import 'package:tarkiz_infotech/features/auth/provider/auth_provider.dart';
import 'package:tarkiz_infotech/features/home/presentation/screens/home_screen.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared_widgets/textfield.dart';
import '../../../../shared_widgets/app_text.dart';
import '../../../../shared_widgets/gradient_button.dart';
import '../widgets/bottom_actions.dart';
import '../widgets/custom_phone_field.dart';
import '../widgets/logo_widget.dart';
import '../widgets/toggle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm(AuthProvider provider) {
    if (_formKey.currentState!.validate()) {
      if (provider.isLogin) {
        if (provider.emailController.text.isEmpty ||
            provider.passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Nothing entered"),
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        if (provider.emailController.text.isEmpty ||
            provider.passwordController.text.isEmpty ||
            provider.phoneController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please fill all fields"),
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => OtpScreen(emailOrPhone: provider.phoneController.text),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid input"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoWidget(),
          const SizedBox(height: 24),
          AppText(
            provider.isLogin
                ? "Start your journey with us"
                : "Registration your company",
            fontSize: 20,
          ),
          const SizedBox(height: 5),
          AppText(
            provider.isLogin
                ? "Sign in to enjoy the best HRMS experience"
                : "Sign up to enjoy the best HRMS experience",
            fontSize: 14,
          ),
          const SizedBox(height: 20),
          CustomToggle(
            leftText: "Login",
            rightText: "Register",
            isLeftSelected: provider.isLogin,
            onToggle: provider.toggleLogin,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            hintText: provider.isLogin ? "Email Address*" : "Work Email*",
            controller: provider.emailController,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Password*",
            controller: provider.passwordController,
            obscureText: true,
            validator: Validators.validatePassword,
          ),
          if (!provider.isLogin) ...[
            const SizedBox(height: 16),
            CustomPhoneField(
              controller: provider.phoneController,
              stringValidator: Validators.validatePhone,
            ),
          ],
          if (provider.isLogin)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText(
                  "Forgot password?",
                  fontSize: 12,
                  color: AppColors.kButtonColor,
                ),
              ),
            ),
          const SizedBox(height: 24),
          if (provider.isLogin)
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: GradientButton(
                text: "Login",
                onPressed: () => _submitForm(provider),
                isEnabled: true,
              ),
            ),

          SizedBox(height: 140.h),
          if (!provider.isLogin)
            BottomActions(
              emailOrPhone: provider.emailController.toString(),
              onRegister: () => _submitForm(provider),
            ),
        ],
      ),
    );
  }
}
