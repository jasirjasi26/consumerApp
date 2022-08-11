// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kiosk_consumer_app/democontroller/cartController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../itemchoosescreen.dart';

class PageHeaderSection extends StatefulWidget {
  PageHeaderSection({Key key}) : super(key: key);

  @override
  _PageHeaderSectionState createState() => _PageHeaderSectionState();
}
class _PageHeaderSectionState extends State<PageHeaderSection> {
  String username;
  @override
  void initState() {
    super.initState();
   _getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.asset('assets/aaaa.png',fit: BoxFit.cover,height:MediaQuery.of(context).size.width > 700  ? 120 : 95.0,width:MediaQuery.of(context).size.width > 700  ? 300 : 240,),
            ),
            Column(
              children: [
                GestureDetector(
                    onTap: (){
                      _logoutDialog(context);
                    },
                    child: Icon(Icons.account_circle_rounded, size:MediaQuery.of(context).size.width > 700  ? 52 : 40,color:Color(int.parse('FF131313',radix: 16)) ,)),
                Container(
                  height:MediaQuery.of(context).size.width > 700  ? 25 : 15.0,
                  width:MediaQuery.of(context).size.width > 700  ? 50 : 42.0,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          color:  Color(int.parse('FF131313',radix: 16)),
                          borderRadius:MediaQuery.of(context).size.width > 700  ?BorderRadius.all(Radius.circular(14.0)) : BorderRadius.all(Radius.circular(8.0))),
                      child: new Center(
                        child: Expanded(
                          child: new Text(username!= null? username:'default',
                            style: TextStyle(color: Colors.white,fontSize: 6),
                            textAlign: TextAlign.center,),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5.0,),
        // Container(
        //   height: 40.0,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [
        //           Colors.green.shade300,
        //           Colors.green
        //         ]
        //     ),
        //     borderRadius: BorderRadius.all(Radius.circular(20.0),),
        //     boxShadow: const [
        //       BoxShadow(
        //           color: Colors.grey ,
        //           blurRadius: 2.0,
        //           offset: Offset(2.0,2.0)
        //       ),
        //     ],
        //   ),
        //   child: new Center(
        //     child: new Text(widget.heading,
        //       style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        //   ),
        // ),
      ],
    );
  }
  _getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.get('username');
    });
  }
}

void _logoutDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
                 child: Container(
                  height: 110.0,
                  padding: EdgeInsets.only(top: 14.0,left: 14.0,right: 14.0,bottom: 10.0),
                  width: MediaQuery.of(context).size.width*1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.dangerous_rounded, size: 25.0,color:Color(int.parse('FF03b332',radix: 16)),),
                          SizedBox(width: 6.0,),
                          Text("Do you really want to log out?",style: TextStyle(fontFamily: 'PoppinsLight',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 85.0,
                            height: 40.0,
                            child: RaisedButton(
                              color: Color(int.parse('FF0dc42c',radix: 16)),
                              textColor: Colors.white,
                              child: Text("NO",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          SizedBox(width: 7.0,),
                          SizedBox(
                            width: 85.0,
                            height: 40.0,
                            child: RaisedButton(
                              color: Colors.red,
                              textColor: Colors.white,
                              child: Text("YES",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              onPressed: () async{
                                try{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.clear();
                                }
                                catch(e) {
                                }
                                Navigator.of(context).pushReplacementNamed("/login");
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      });
}

class ReusableObjectClass{

  void showToast(BuildContext context, IconData icon, Color color, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
    Row(
      children: [
        Icon(icon,color: Colors.white,),
        SizedBox(width: 10,),
        Flexible(child: Text(text,)),
      ],
    ),
      duration: Duration(milliseconds: 500),
      backgroundColor: color,
    ),
    );
  }
  
  void guestCountDialog(BuildContext context) {
    TextEditingController guestcountcontroller = TextEditingController();
    int guestTotalCount = 0 ;
    CartController cartController = CartController();
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState2) {
                  void guestCount(int count){
                    setState2(() {
                      guestTotalCount = count;
                      guestcountcontroller.text = guestTotalCount.toString();
                    });
                  }
                  return Container(
                    height: 337.0,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 1.0, offset: Offset(1.0, 1.0),),
                        ]
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child:Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 5,),
                              Text('Guest Count',style: TextStyle(fontFamily: 'PoppinsLight',fontWeight: FontWeight.w600,fontSize: 20, color: Colors.black,),),
                              SizedBox(height: 9,),
                              Container(
                                child: Table(
                                  children: [
                                    TableRow(
                                        children: [
                                          buildButton(context,1,(){guestCount(1);}),
                                          buildButton(context,2,(){guestCount(2);}),
                                          buildButton(context,3,(){guestCount(3);}),
                                          buildButton(context,4,(){guestCount(4);}),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          buildButton(context,5,(){guestCount(5);}),
                                          buildButton(context,6,(){guestCount(6);}),
                                          buildButton(context,7,(){guestCount(7);}),
                                          buildButton(context,8,(){guestCount(8);}),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(width: 73, height: 50,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.top,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [new LengthLimitingTextInputFormatter(3),],
                                      controller: guestcountcontroller,
                                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 18.0,),
                                  Container(
                                    height: 40.0,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17.0),
                                    ),
                                    child: RaisedButton(
                                      onPressed: (){
                                           int gcount = int.parse(guestcountcontroller.text);
                                           if(gcount >= 1) {
                                          //cartController.guestcounts = gcount.;
                                            print("cart count =" + cartController.guestcounts.toString());
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemChooseScreen()));
                                          }
                                      },
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(int.parse('FF505050',radix: 16)),
                                              Color(int.parse('FF333333',radix: 16))],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius: BorderRadius.circular(17.0)
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                          alignment: Alignment.center,
                                          child: Text("Next", textAlign: TextAlign.center, style: TextStyle(color: Colors.white
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ),
                  );
                }
            ),
          );
        });
  }
  
  Widget buildButton(BuildContext context,int value,Function fun){
    return Container(
      padding: EdgeInsets.only(right: 5.0,left: 5.0,top: MediaQuery.of(context).size.width > 700 ? 18.0 : 9.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
          ),
          onPressed: (){
            fun();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemChooseScreen()));
          },
          child: Text(value.toString(), style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal, color: Colors.white),
          )
      ),
    );
  }
}

