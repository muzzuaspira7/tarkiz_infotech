import 'package:flutter/material.dart';
import 'package:tarkiz_infotech/shared_widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AppText('Home Screen')));
  }
}
