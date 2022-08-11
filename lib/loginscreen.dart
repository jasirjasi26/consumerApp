// @dart=2.9
import 'package:flutter/material.dart';
import 'package:kiosk_consumer_app/widgets/footer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMsg = '';
  List<String> _locations = ['1', '2', '3', '4']; // Option 2
  String _selectedLocation;
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                  Center(
                    child: Text(
                      'Choose your Table',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 30,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                  Container(height:MediaQuery.of(context).size.width*0.5+50,width:MediaQuery.of(context).size.width*0.5+50,child:  _buildQrView(context)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'SCAN  THE QR WITH YOUR MOBILE',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 15,),
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
                  SizedBox(height: 15,),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width:MediaQuery.of(context).size.width*0.18 ,),
                              Text(
                                'Choose Table :',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        Center(
                          child: Card(
                            elevation: 5,
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.5+50,
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.table_chart_outlined)
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isDense: true,
                                        isExpanded: true,
                                        hint: Text('Please select table'), // Not necessary for Option 1
                                        value: _selectedLocation,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedLocation = newValue;
                                          });
                                        },
                                        items: _locations.map((location) {
                                          return DropdownMenuItem(
                                            child: new Text(location),
                                            value: location,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                  GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => RegPage()));
                      Navigator.pushReplacementNamed(
                          context, "/chooseitems");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.65,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        gradient: LinearGradient(
                          begin: Alignment(-0.95, 0.0),
                          end: Alignment(1.0, 0.0),
                          colors: [const Color(0xff005fb8), const Color(0xff60cdff)],
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
                          'Continue ',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ),
                  )

                //             child: RaisedButton(
                //               onPressed: () async {
                //                 try {
                //                   // LoginService service = LoginService();
                //                   // SettingsData settingsData = SettingsData();
                //                   // await settingsData.saveUserNamePassword(usernameController.text.trim(), passwordController.text.trim());
                //                   // await service.login();
                //                   Navigator.pushReplacementNamed(context, "/tables");
                //                 }catch(e) {
                //                   setState(() {
                //                     errorMsg = e.toString();
                //                   });
                //                 }
                //               },
                ]
              ),
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



  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = MediaQuery.of(context).size.width*0.5+50;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      this.controller.stopCamera();
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) {
      //       return SignaturePage();
      //     }));
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('no Permission')),
      // );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

}
