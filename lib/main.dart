import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarkiz_infotech/core/constant/app_colors.dart';
import 'package:tarkiz_infotech/features/auth/presentation/screens/auth_screen.dart';
import 'package:tarkiz_infotech/features/auth/provider/auth_provider.dart';

import 'core/utils/screen_utils.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T A R K I Z',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.kPrimaryGradientTop,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
