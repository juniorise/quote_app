import 'package:flutter/material.dart';
import 'package:quote_app/screens/home/home_screen.dart';
import 'package:quote_app/screens/login.dart';
import 'package:quote_app/services/user_storage.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserStorage.getUser(),
      builder: (context, snapshot) {
        bool isSignin = snapshot.hasData && snapshot.data.toString().isNotEmpty;
        if (isSignin) {
          return HomeScreen();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
