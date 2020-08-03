import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imc/ui/android/pages/sexo_page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SexoPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xffED213A), Color(0xff93291E)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset("images/logo.png"),
            ),
            Container(
              //alignment: Alignment.bottomCenter,
              child: Image.asset("images/empresa.png"),
            ),
          ],
        ),
      ),
    );
  }
}
