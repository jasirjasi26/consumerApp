// @dart=2.9
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'democontroller/cartController.dart';
import 'order_success.dart';
import 'package:http/http.dart' as http;

class PaymentOptionsPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<PaymentOptionsPage> {
  final cartController = Get.put(CartController());

  Future<void> payCard() async {
    var client =http.Client();

    Map data = {'CardNumber': "5555555555554444", 'Month': "12",'Year': "2023", 'cvc': "123",'Value':cartController.totalPrice.toString()};
    //encode Map to JSON
    var body = json.encode(data);
print(body);
    final response = await client.post(Uri.parse('https://zres1.clubsoft.co.in/pay'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: body,);

    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => OrderSuccessPage()));
      // return allDataFromJson(response.body);
    } else {
      return null;
    }
  }

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
                                    //Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, "/chooseitems");
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 30,
                        color:  Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    cartController.cartItems.length.toString()+" items, to pay Rs."+cartController.totalPrice.toString(),
                    style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontSize:15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),


                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.07,height: 50,),
                      Text(
                        "Wallet",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.2,),
                      Container(
                        width: 80,
                        height: 50 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/amazon.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Amazon Pay",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Link Account",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.2,),
                      Container(
                        width: 80,
                        height: 50 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/phone.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Phone Pay   ",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Link Account",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.2,),
                      Container(
                        width: 80,
                        height: 50 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/gpay.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Google Pay ",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Link Account",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.2,),
                      Container(
                        width: 80,
                        height: 50 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/paytm.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Paytm          ",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Link Account",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.07,height: 50,),
                      Text(
                        "Credit / Debit Card",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.2,),
                      Container(
                        width: 80,
                        height: 50 ,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/card.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Add New Card",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:15,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width *0.07,height: 70,),
                      Text(
                        "Please proceed to pay at counter",
                        style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize:18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  Divider(thickness: 1,),
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
                                height:  30,
                                width: MediaQuery.of(context).size.width > 700
                                    ? 220
                                    : 150,

                                child: Center(
                                    child:Text(
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
                                    )
                                ),
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
                                height:30,
                                width: MediaQuery.of(context).size.width > 700
                                    ? 220
                                    : 150,

                                child: Center(
                                    child:
                                    Text(
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
                                    )
                                ),
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
                                  child:
                                  GetX<CartController>(builder: (controller) {
                                    return Text(
                                      "\Rs ${controller.totalPrice}" + " /-",
                                      style: TextStyle(
                                          fontFamily: 'PoppinsBold',
                                          fontSize:
                                          MediaQuery.of(context).size.width >
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
                      //       color: Colors.transparent,
                      //       textColor: Colors.white,
                      //       label: Text(
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
                        child: GestureDetector(
                          onTap: () {
                            payCard();
                            //
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
                            child: GestureDetector(
                              //icon: Icon(Icons.save,color: Colors.white,),

                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize:
                                      MediaQuery.of(context).size.width >
                                          700
                                          ? 22
                                          : 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                )
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width > 700
                        ? MediaQuery.of(context).size.height * 0.17
                        : 40,
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

