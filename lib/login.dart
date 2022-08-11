// @dart=2.9
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:get/get.dart';
import 'package:kiosk_consumer_app/utils/authentication.dart';
import 'package:kiosk_consumer_app/widgets/footer.dart';
import 'democontroller/cartController.dart';
import 'widgets/pageheadersection.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<LoginPage> {
  final cartController = Get.put(CartController());
  ReusableObjectClass reusableObjectClass = ReusableObjectClass();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn =false;
  bool google =false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child:Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),

                Text('Login',
                  style: new TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Login or Signup to place your order',
                  style: new TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .77,
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
                        Card(
                          elevation: 3,
                          child: TextFormField(
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
                            context, "/otp");
                      },
                      child: SizedBox(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .75,
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
                                  "Login",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Text(
                              "Don't you have an Account ? ",
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),

                            Text(
                              "Sign Up ",
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 15,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 35,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width*0.4,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "  OR  ",
                      style: TextStyle(
                          fontFamily: 'PoppinsBold',
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width*0.45,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 35,),


                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isSignIn = true;
                    });

                    User user =
                        await Authentication.signInWithGoogle(context: context);

                    setState(() {
                      isSignIn = false;
                    });

                    if (user != null) {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => UserInfoScreen(
                      //       user: user,
                      //     ),
                      //   ),
                      // );
                      FlutterFlexibleToast.showToast(
                          message: "Verification Success",
                          toastGravity: ToastGravity.BOTTOM,
                          icon: ICON.SUCCESS,
                          radius: 50,
                          elevation: 10,
                          imageSize: 15,
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          timeInSeconds: 2);
                      Navigator.pushReplacementNamed(
                          context, "/deliverytype");
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .75,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(width: 1.0, color: const Color(0xffcfcfcf)),
                      boxShadow: [
                      ],
                    ),
                    child:  Center(child: isSignIn
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                    )
                        :Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 50,
                          height: 30 ,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/google.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("Continue with Google"),
                        Spacer(),
                      ],
                    )),

                  ),
                ),
              ]),
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
