import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tarkiz_infotech/core/constant/app_colors.dart';
import 'package:tarkiz_infotech/features/auth/presentation/screens/auth_screen.dart';
import 'package:tarkiz_infotech/features/auth/provider/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 👇 apne base design ke hisaab se change karo (Figma/XD size)
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'T A R K I Z',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.kPrimaryGradientTop,
            ),
          ),
          home: child,
        );
      },
      child: const LoginScreen(),
    );
  }
}
