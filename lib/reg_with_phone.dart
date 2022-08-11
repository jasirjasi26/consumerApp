// @dart=2.9
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'democontroller/cartController.dart';
import 'widgets/demoquantitybutton.dart';
import 'widgets/pageheadersection.dart';

class RegPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<RegPage> {
  final cartController = Get.put(CartController());
  ReusableObjectClass reusableObjectClass = ReusableObjectClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        gradient: LinearGradient(
                          begin: Alignment(-0.97, 0.0),
                          end: Alignment(0.97, 0.11),
                          colors: [
                            const Color(0xff005fb8),
                            const Color(0xff60cdff)
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        begin: Alignment(-1.0, 0.0),
                                        end: Alignment(1.0, 0.0),
                                        colors: [
                                          const Color(0xff005fb8),
                                          const Color(0xff60cdff)
                                        ],
                                        stops: [0.0, 1.0],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Menu',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 14,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.table_chart,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '  Table 2     ',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 15,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  RichText(
                    text: new TextSpan(
                      children: <TextSpan>[
                        new TextSpan(
                          text: 'Get your own',
                          style: new TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        new TextSpan(
                          text: ' Online Ordering\n',
                          style: new TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontSize: 26,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700),
                        ),
                        new TextSpan(
                          text: '                 System',
                          style: new TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Enter Your Mobile Number",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            //controller: _controller,

                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: new InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                hintText: "  +91-9822222222"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, "/chooseitems");
                        },
                        child: SizedBox(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              gradient: LinearGradient(
                                begin: Alignment(-0.97, 0.0),
                                end: Alignment(0.97, 0.11),
                                colors: [
                                  const Color(0xff005fb8),
                                  const Color(0xff60cdff)
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: GestureDetector(
                              child: Center(
                                  child: Text(
                                "Get In Touch",
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
