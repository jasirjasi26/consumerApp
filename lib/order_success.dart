// @dart=2.9
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'democontroller/cartController.dart';
import 'widgets/pageheadersection.dart';

class OrderSuccessPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<OrderSuccessPage> {
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
                          SizedBox(height: 60,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
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
                                    Icon(Icons.table_chart,color: Colors.white,),
                                    Text(
                                      '  Table 2',
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.phone_android,color: Colors.white,),
                                    Text(
                                      '   8129902988',
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


                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.5 ,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/ordersuccess.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                        "Your order was Successful !",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:24,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      )
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      //       onPressed: () {
                      //         setState(() {
                      //           cartController.deleteAll();
                      //           Navigator.pushNamed(context, "/home");
                      //           reusableObjectClass.showToast(
                      //               context,
                      //               Icons.dangerous_rounded,
                      //               Color(int.parse('FFa70a00', radix: 16)),
                      //               "Item removed from cart..!");

                      SizedBox(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(
                                context, "/chooseitems");
                          },
                          child: Container(
                            width:MediaQuery.of(context).size.width * .7,
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
                            child:Center(
                                child: Text(
                                  "Back to Dashboard",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize:19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                )
                            )
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
