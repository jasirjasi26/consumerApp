// @dart=2.9
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:get/get.dart';
import 'package:kiosk_consumer_app/widgets/footer.dart';
import 'democontroller/cartController.dart';
import 'widgets/pageheadersection.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<OtpPage> {
  final cartController = Get.put(CartController());
  ReusableObjectClass reusableObjectClass = ReusableObjectClass();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  String verificationCode;
  String code;
  List<String> userNumbers = []; // Option

  @override
  void initState() {
    //on Splash Screen hide statusbar
    onStart();

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    //before going to other screen show statusbar
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  onStart() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+918129902988",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              // ToastComponent.showDialog("Authentication Success", context,
              //     gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);

            } else {
              FlutterFlexibleToast.showToast(
                  message: "Invalid OTP",
                  toastGravity: ToastGravity.BOTTOM,
                  icon: ICON.ERROR,
                  radius: 50,
                  elevation: 10,
                  imageSize: 15,
                  textColor: Colors.white,
                  backgroundColor: Colors.black,
                  timeInSeconds: 2);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            verificationCode = verficationID;
            //isLoading=false;
          });
          FlutterFlexibleToast.showToast(
              message: "OTP Sent",
              toastGravity: ToastGravity.BOTTOM,
              icon: ICON.SUCCESS,
              radius: 50,
              elevation: 10,
              imageSize: 15,
              textColor: Colors.white,
              backgroundColor: Colors.black,
              timeInSeconds: 2);
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }


  // Future<void> _showSnackBar(String pin) async {
  //
  // }



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
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),

                    Text('OTP',
                      style: new TextStyle(
                          fontFamily: 'PoppinsBold',
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Verify Details',
                      style: new TextStyle(
                          fontFamily: 'PoppinsBold',
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('OTP sent to +918129902988',
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
                        width: MediaQuery.of(context).size.width * .8,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Enter OTP",
                                    style: TextStyle(
                                        fontFamily: 'PoppinsBold',
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: PinPut(
                                //obscureText: "*",
                                fieldsCount: 6,
                                withCursor: true,
                                textStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
                                eachFieldWidth: 40.0,
                                eachFieldHeight: 40.0,
                               // onSubmit: (String pin) => _showSnackBar(pin),
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration: pinPutDecoration,
                                selectedFieldDecoration: pinPutDecoration,
                                followingFieldDecoration: pinPutDecoration,
                                pinAnimationType: PinAnimationType.fade,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 250 ,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/otp.png"),
                          fit: BoxFit.contain,
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
                          onTap: () async {
                            if (_pinPutController.text.length == 6) {
                              var code = _pinPutController.text.toString();

                              if (code == "") {
                                FlutterFlexibleToast.showToast(
                                    message: "Enter verification code",
                                    toastGravity: ToastGravity.BOTTOM,
                                    icon: ICON.ERROR,
                                    radius: 50,
                                    elevation: 10,
                                    imageSize: 15,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    timeInSeconds: 2);
                                return;
                              } else {
                                await FirebaseAuth.instance
                                    .signInWithCredential(PhoneAuthProvider.credential(
                                    verificationId: verificationCode, smsCode: code))
                                    .then((value) async {
                                  if(value.user!=null){
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
                                  else{
                                    FlutterFlexibleToast.showToast(
                                        message: "Invalid OTP",
                                        toastGravity: ToastGravity.BOTTOM,
                                        icon: ICON.ERROR,
                                        radius: 50,
                                        elevation: 10,
                                        imageSize: 15,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.black,
                                        timeInSeconds: 2);
                                  }


                                });
                              }
                            }


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
                                      "VERIFY AND PROCEED",
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
                    Row(
                      children: [
                        Spacer(),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                Text(
                                  "Don't receive the OTP ? ",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),

                                Text(
                                  "RESEND ",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize: 14,
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
