// @dart=2.9
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Footer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 35 ,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/zclipse.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'Copyright ©  2021 ZRES. All Rights Reserved.',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 12,
              color: const Color(0xffcfcfcf),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
