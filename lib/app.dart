import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/constant/theme_constant.dart';
import 'package:quote_app/wrapper_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConstant.themeData,
      home: WrapperPage(),
    );
  }
}
