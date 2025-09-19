import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin = true;

  bool get isLogin => _isLogin;

  void toggleLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  //  controllers..
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
}
