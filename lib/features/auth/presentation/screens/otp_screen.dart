import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarkiz_infotech/features/auth/presentation/widgets/logo_widget.dart';
import 'package:tarkiz_infotech/shared_widgets/loading_screen.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../shared_widgets/app_text.dart';
import '../../../../shared_widgets/gradient_button.dart';
import '../widgets/auth_theme.dart';
import '../widgets/otp_input.dart';

class OtpScreen extends StatefulWidget {
  final String emailOrPhone;
  const OtpScreen({super.key, required this.emailOrPhone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  bool isOtpComplete = false;

  @override
  void initState() {
    super.initState();
    pinController.addListener(() {
      setState(() {
        isOtpComplete = pinController.text.length == 6;
      });
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AuthTheme(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LogoWidget(),
                      SizedBox(height: 24.h),
                      const AppText(
                        "6-Digit Code",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        "Code sent to ${widget.emailOrPhone}",
                        fontSize: 14,
                        color: AppColors.kTextSecondary,
                      ),
                      SizedBox(height: 40.h),

                      Center(
                        child: OtpInput(
                          controller: pinController,
                          focusNode: focusNode,
                          onCompleted: (pin) {
                            print('Entered OTP: $pin');
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 50,
                      //   child: GradientButton(
                      //     text: "Verify",
                      //     onPressed: () {
                      //       if(pinController.text.length == 6){
                      //         Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(builder: (_) => const LoadingScreen()),
                      //         );
                      //       } else {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(
                      //             content: Text('Please enter a valid 6-digit OTP'),
                      //             duration: Duration(seconds: 2),
                      //           ),
                      //         );
                      //       }
                      //     },
                      //     isEnabled: pinController.text.length == 6,
                      //   ),
                      // ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: GradientButton(
                          text: "Verify",
                          onPressed:
                              isOtpComplete
                                  ? () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const LoadingScreen(),
                                      ),
                                    );
                                  }
                                  : null,
                          isEnabled: isOtpComplete,
                        ),
                      ),

                      SizedBox(height: 15.h),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppText(
                              "Didn’t receive code?",
                              fontSize: 14,
                              color: AppColors.kTextSecondary,
                            ),

                            const AppText(
                              "  Resend OTP",
                              fontSize: 14,
                              color: AppColors.kTextPrimary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
