// @dart=2.9
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kiosk_consumer_app/widgets/footer.dart';
import 'democontroller/cartController.dart';
import 'widgets/demoquantitybutton.dart';
import 'widgets/pageheadersection.dart';

class DeliveryTypePage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<DeliveryTypePage> {
  final cartController = Get.put(CartController());
  ReusableObjectClass reusableObjectClass = ReusableObjectClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, "/login");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .75,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(width: 1.0, color:  Colors.cyan[300]),
                            boxShadow: [
                            ],
                          ),
                          child: Center(child: Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 50,
                                height: 30 ,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/dinein.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Dine In",
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                              Spacer(),
                            ],
                          )),

                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .75,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(width: 1.0, color:  Colors.cyan[300]),
                          boxShadow: [
                          ],
                        ),
                        child: Center(child: Row(
                          children: [
                            Spacer(),
                            Container(
                              width: 50,
                              height: 30 ,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/togo.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "To Go",
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                            Spacer(),
                          ],
                        )),

                      ),
                    ),

                    SizedBox(height: 20,),



                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .75,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(width: 1.0, color:  Colors.cyan[300]),
                          boxShadow: [
                          ],
                        ),
                        child: Center(child: Row(
                          children: [
                            Spacer(),
                            Container(
                              width: 50,
                              height: 30 ,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/homedelivery.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "Home Delivery",
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                            Spacer(),
                          ],
                        )),

                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),

          Positioned(
              bottom: 30,
              child: Footer()
          ),
        ],
      ),
    );
  }
}
