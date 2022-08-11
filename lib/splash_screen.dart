import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_consumer_app/services/loginservice.dart';

class LogoScreen extends StatelessWidget {

  void checkLoginAndVanigate(BuildContext context) async {
    try {
      LoginService service = LoginService();
      Token token = await service.login();
      if (token != null && token.isValid()) {
        Navigator.of(context).pushReplacementNamed("/home");
      }
    } catch (e) {
      Navigator.of(context).pushReplacementNamed("/home");
     // Navigator.of(context).pushReplacementNamed("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 0),
            () => checkLoginAndVanigate(context));
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(
        //   image: AssetImage("assets/back.png"), // <-- BACKGROUND IMAGE
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Center(
        // child: Image.asset("assets/Logo.png", height: 200, width: 300, fit: BoxFit.fitWidth),
      ),
    );
  }
}