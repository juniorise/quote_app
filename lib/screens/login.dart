import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_app/screens/home/home_screen.dart';
import 'package:quote_app/services/auth_api.dart';
import 'package:quote_app/services/user_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? error;

  //get value from user
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black87.withOpacity(0.75), BlendMode.darken),
            image: AssetImage('assets/login_background.jpg'),
            fit: BoxFit.cover,
          )),
          child: ListView(children: <Widget>[
            //Title
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 95, left: 20),
                child: Text(
                  'Log in or sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'quicksand',
                      fontSize: 24),
                )),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
              child: Text(
                'to quote app',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            //Username
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
              child: TextField(
                controller: usernameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w300),
                  fillColor: Colors.white.withOpacity(0.2),
                  filled: true,
                ),
              ),
            ),
            //Password
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'quicksand',
                      fontWeight: FontWeight.w300),
                  fillColor: Colors.white.withOpacity(0.2),
                  filled: true,
                ),
              ),
            ),
            //LoginButton
            Container(
              height: 60,
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: RaisedButton(
                color: Colors.lightBlue[900],
                onPressed: () async {
                  if (usernameController.text.isEmpty) {
                    error = "Username and password must be filled";
                  } else if (passwordController.text.length <= 4) {
                    error = "Password must be longer than 4 digits";
                  } else {
                    error = null;
                    AuthApi api = AuthApi();
                    await api.logIntoAccount(
                        username: usernameController.text,
                        password: passwordController.text);
                    if (api.success()) {
                      await UserStorage.setUser(usernameController.text);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    } else {
                      error = api.message();
                    }
                  }

                  if (error != null) {
                    showTopSnackBar(
                      context,
                      CustomSnackBar.error(
                        message: "${error ?? ""}",
                      ),
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Log into account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'quicksand'),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
