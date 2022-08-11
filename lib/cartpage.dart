// @dart=2.9
import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_consumer_app/payment_options.dart';
import 'democontroller/cartController.dart';
import 'widgets/demoquantitybutton.dart';
import 'widgets/pageheadersection.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                                    Icon(
                                      Icons.phone_android,
                                      color: Colors.white,
                                    ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cart',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: MediaQuery.of(context).size.height * .5,
                    child: Expanded(
                      //padding: EdgeInsets.only(top: 90.0,),
                      child: GetX<CartController>(builder: (controller) {
                        return Scrollbar(
                          child: Padding(
                            padding: EdgeInsets.only(right: 0.0),
                            child: ListView.builder(
                                itemCount: controller.cartItems.length,
                                itemBuilder: (context, index) {
                                  String image_url = controller
                                      .cartItems[index].image
                                      .toString();
                                  return Stack(children: [
                                    Card(
                                      margin: EdgeInsets.only(bottom: 0.8),
                                      color: Colors.white,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              height: 110,
                                              child: image_url != ""
                                                  ? ClipRRect(
                                                      child: Image.memory(
                                                          base64Decode(
                                                              image_url)))
                                                  : Container(
                                                      height: 30,
                                                      width: 30,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 1.5,
                                                      ),
                                                    ),
                                            ),
                                            SizedBox(
                                              width: 4.0,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 5, bottom: 5),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      controller
                                                          .cartItems[index]
                                                          .itemName,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'PoppinsLight',
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w900)),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      "Rs." +
                                                          "${controller.cartItems[index].itemPrice}",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'PoppinsBold',
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width >
                                                                  700
                                                              ? 19
                                                              : 16,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // QuantityButton(
                                                      //   initialQuantity: controller.cartItems[index].qty,
                                                      //   onQuantityChange: getCounterValue,
                                                      // ),

                                                      Container(
                                                        height: 30.0,
                                                        width: 95.0,
                                                        //padding: EdgeInsets.symmetric(horizontal:1,vertical: 0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment(
                                                                -1.0, 0.0),
                                                            end: Alignment(
                                                                1.0, 0.0),
                                                            colors: [
                                                              const Color(
                                                                  0xff005fb8),
                                                              const Color(
                                                                  0xff60cdff)
                                                            ],
                                                            stops: [0.0, 1.0],
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color(
                                                                  0x29000000),
                                                              offset:
                                                                  Offset(0, 3),
                                                              blurRadius: 6,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 25.0,
                                                              child: IconButton(
                                                                onPressed: (controller
                                                                            .cartItems[index]
                                                                            .qty <=
                                                                        1)
                                                                    ? null
                                                                    : () {
                                                                        setState(
                                                                            () {
                                                                          controller
                                                                              .cartItems[index]
                                                                              .qty--;
                                                                        });
                                                                      },
                                                                icon: Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.0,
                                                            ),
                                                            Container(
                                                              width: 35,
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2,
                                                                      vertical:
                                                                          4),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3),
                                                                  color: Colors
                                                                      .white),
                                                              child: Center(
                                                                child: Text(
                                                                  controller
                                                                      .cartItems[
                                                                          index]
                                                                      .qty
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 25.0,
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    controller.cartItems[index].qty++;
                                                                  });
                                                                },
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          cartController
                                                              .removeFromCart(
                                                                  controller
                                                                          .cartItems[
                                                                      index]);
                                                          reusableObjectClass.showToast(
                                                              context,
                                                              Icons
                                                                  .dangerous_rounded,
                                                              Color(int.parse(
                                                                  'FFa70a00',
                                                                  radix: 16)),
                                                              "Item removed from cart..!");
                                                          // _showToast(context);
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]);
                                }),
                          ),
                        );
                      }),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width * .938,
                    padding: EdgeInsets.only(
                        top: 6.0, bottom: 6.0, left: 15.0, right: 6.0),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total   ",
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize:
                                        MediaQuery.of(context).size.width > 700
                                            ? 18
                                            : 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width > 700
                                    ? 220
                                    : 150,
                                child: Center(
                                    child: Text(
                                  "Rs 5.00",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  700
                                              ? 22
                                              : 19,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax     ",
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize:
                                        MediaQuery.of(context).size.width > 700
                                            ? 18
                                            : 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width > 700
                                    ? 220
                                    : 150,
                                child: Center(
                                    child: Text(
                                  "Rs 5.00",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  700
                                              ? 22
                                              : 19,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Grand Total    ",
                                style: TextStyle(
                                    fontFamily: 'PoppinsBold',
                                    fontSize:
                                        MediaQuery.of(context).size.width > 700
                                            ? 18
                                            : 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width > 700
                                    ? 55
                                    : 50,
                                width: MediaQuery.of(context).size.width > 700
                                    ? 220
                                    : 150,
                                child: Center(
                                  child: GetX<CartController>(
                                      builder: (controller) {
                                    return Text(
                                      "\Rs ${controller.totalPrice}" + " /-",
                                      style: TextStyle(
                                          fontFamily: 'PoppinsBold',
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  700
                                              ? 22
                                              : 19,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //         "Clear",
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.bold, fontSize: 17.0),
                      //       ),
                      //       // shape: RoundedRectangleBorder(
                      //       //   borderRadius: BorderRadius.circular(22.0),
                      //       // ),
                      //       onPressed: () {
                      //         setState(() {
                      //           cartController.deleteAll();
                      //           Navigator.pushNamed(context, "/home");
                      //           reusableObjectClass.showToast(
                      //               context,
                      //               Icons.dangerous_rounded,
                      //               Color(int.parse('FFa70a00', radix: 16)),
                      //               "Item removed from cart..!");
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
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
                            //icon: Icon(Icons.save,color: Colors.white,),

                            child: Center(
                              child:
                                  GetX<CartController>(builder: (controller) {
                                return Text(
                                  "Pay  \Rs ${controller.totalPrice}" + " /-",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  700
                                              ? 22
                                              : 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                );
                              }),
                            ),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(22.0),
                            // ),
                            onTap: () {
                              //Navigator.pushNamed(context, "/home");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PaymentOptionsPage()));
                            },
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

  Future<int> getCounterValue(int counter) async {
    int value1 = counter;
    print('value is $value1');
    return value1;
  }
}
