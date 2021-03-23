import 'package:flutter/material.dart';
import 'package:quote_app/screens/home/upload_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Open Upload"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return UploadQuoteSheet();
              },
            );
          },
        ),
      ),
    );
  }
}
