import 'package:flutter/material.dart';
import 'package:quote_app/screens/home/home_screen.dart';
import 'package:quote_app/screens/login.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSignin = true;
    if (isSignin) {
      return HomeScreen();
    } else {
      return LoginPage();
    }
  }
}
