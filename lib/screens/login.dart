import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black87.withOpacity(0.75), BlendMode.darken),
            image: NetworkImage("https://wallpaperaccess.com/full/501978.jpg"),
            fit: BoxFit.cover,
          )),
        child: ListView(
          children: <Widget>[
            //Title
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 95, left: 20),
              child: Text(
                'Log in or sign up',
                  style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontSize: 24),
              )
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
              child: Text(
                'to quote app',
                style: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                ),
              ),
            ),
            //Username
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Quicksand', fontWeight: FontWeight.w300),
                  fillColor: Colors.white.withOpacity(0.2),
                  filled: true,
                ),
              ),
            ),
            //Password
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: TextField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white70, fontFamily: 'Quicksand',fontWeight: FontWeight.w300),
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
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Quicksand'
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
