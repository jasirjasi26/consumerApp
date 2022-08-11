// // @dart=2.9
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kiosk_consumer_app/services/mintoclasses.dart';
// import 'package:kiosk_consumer_app/services/mintoservices.dart';
// import 'package:kiosk_consumer_app/widgets/pageheadersection.dart';
// import 'democontroller/cartController.dart';
// import 'itemchoosescreen.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   ScrollController scollBarController = ScrollController();
//   ReusableObjectClass reusableObjectClass = ReusableObjectClass();
//   List<TableDatas> selectedList;
//   List<TableDatas> _tab = [];
//   List<TableDatas> _longpressSelected = [];
//   String _choosedFloorValue;
//   List<TableDatas>  _tablesdata = [];
//
//   ///New Datas
//   List<FloorDatas> allfloorData = [];
//   List<String> listoffloornames = [];
//   //int guestcount = 0;
//   final CartController cartController = Get.put(CartController());
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 1,
//               height: MediaQuery.of(context).size.width > 700 ? 65 : 55.0,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(MediaQuery.of(context).size.width > 700 ? "assets/minttablet.png":"assets/mintphone.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//
//           SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0,bottom: 10.0),
//               child: Column(
//                 children: [
//                   PageHeaderSection(),
//
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 1,
//                       height: MediaQuery.of(context).size.width > 700  ? 55 : 44.0,
//                       padding: EdgeInsets.only(left: 10.0,right: 15.0),
//                       decoration: BoxDecoration(
//                         //border: Border.all(color:  Color(int.parse('FF131313',radix: 16)),width: .5),
//                         gradient: LinearGradient(
//                           colors: [
//                             Color(int.parse('FFe5e5e5',radix: 16)),
//                             Color(int.parse('FFe5e5e5',radix: 16)),
//                           ],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(8.0),),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.grey ,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0,2.0),
//                           ),
//                         ],
//                       ),
//                       child:FutureBuilder(
//                        // future: RestaurantServices().floorsandtablesData(),
//                         builder: (context, snapshot){
//                           if (!snapshot.hasData)
//                             return Container();
//                           allfloorData = snapshot.data;
//                           listoffloornames = allfloorData.map((e) => e.floorName).toList();
//                           return DropdownButtonHideUnderline(
//                             child: DropdownButton(
//                               hint: Text('CHOOSE FLOOR',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//                               value: _choosedFloorValue,
//                               elevation: 16,
//                               isExpanded: true,
//                               icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
//                               style: TextStyle(color: Colors.black),
//                               dropdownColor: Color(int.parse('FFcccccc',radix: 16)),
//                               onChanged: (value) {
//                                 setState(() {
//                                   _choosedFloorValue = value;
//                                   var tabiles = allfloorData.map((e) => (e.floorName == _choosedFloorValue) ? e.tables :null).where((element) => element != null);
//                                   for (var name in tabiles) {
//                                     _tablesdata = name;
//                                   }
//                                 });
//                               },
//                               items: listoffloornames.map((item) {
//                                 return DropdownMenuItem(
//                                   value: item,
//                                   child: item == _choosedFloorValue ? Text(item,style: TextStyle(color: Color(int.parse('FF505050',radix: 16)),fontWeight: FontWeight.bold,fontSize:14.5),) : Text(item),
//                                 );
//                               },
//                               ).toList(),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(height:MediaQuery.of(context).size.width > 700 ? 5.0 : 2.0),
//                   Container(
//                     padding: EdgeInsets.only(top: 5.0,left: 5.0,bottom: 5.0),
//                     height: MediaQuery.of(context).size.width > 700 ? MediaQuery.of(context).size.height * 0.705  : 575.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0),
//                       ),
//                     ),
//                     child: OrientationBuilder(
//                         builder: (context, orientation) {
//                           return Scrollbar(
//                             isAlwaysShown: true,
//                             controller: scollBarController,
//                             child: Padding(
//                               padding: EdgeInsets.all(10.0),
//                               child: GridView.builder(
//                                 scrollDirection: Axis.vertical,
//                                 controller: scollBarController,
//                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: MediaQuery.of(context).size.width > 700  ? orientation == Orientation.portrait ? 3 : 4 : orientation == Orientation.portrait ? 2 : 3,
//                                 ),
//                                 itemCount: _tablesdata.length,
//                                 itemBuilder: (BuildContext context,int key){
//                                   var item = _tablesdata[key];
//                                   return Card(
//                                     margin:MediaQuery.of(context).size.width > 700 ? EdgeInsets.symmetric(vertical: 8, horizontal: 10) : EdgeInsets.symmetric(vertical: 4, horizontal: 4),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12.0),
//                                     ),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius:  BorderRadius.circular(12.0),
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                             colors: _tablesdata[key].orderStatus == null ? [Color(int.parse('FF01941b',radix: 16)),Color(int.parse('FF03b332',radix: 16))] : _tablesdata[key].orderStatus == 'DR' ? [Color(int.parse('FF025ecc',radix: 16)),Color(int.parse('FF0390d4',radix: 16))] : _tablesdata[key].orderStatus == 'IP' ? [Color(int.parse('FFd4ab03',radix: 16)),Color(int.parse('FFd8dd08',radix: 16))] : [Colors.white,Colors.white] ,
//                                           )
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(12.0),
//                                               color: !_longpressSelected.contains(_tablesdata[key]) ? Colors.transparent : Colors.grey,
//                                             ),
//                                             child: GestureDetector(
//                                               onLongPress: () {
//                                                 setState(() {
//                                                   if (!_longpressSelected.contains(item)){
//                                                     _longpressSelected.add(item);
//                                                   } else {
//                                                     _longpressSelected.remove(item);
//                                                   }
//                                                 });
//                                               },
//                                               onTap: (){
//                                                 setState(() {
//                                                   if(_longpressSelected.isEmpty)
//                                                   {
//                                                     reusableObjectClass.guestCountDialog(context);
//                                                   }
//                                                   else if(_longpressSelected.length >= 1){
//                                                     if (!_longpressSelected.contains(item)) {
//                                                       _longpressSelected.add(item);
//                                                     }
//                                                     else {
//                                                       _longpressSelected.remove(item);
//                                                     }
//                                                   }
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           Center(
//                                               child: Column(
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   Text('${item.dineTableName}',style: TextStyle(fontFamily: 'PoppinsLight',fontWeight: FontWeight.w600,fontSize: 15,
//                                                     color: (item.orderStatus == 'IP' || item.orderStatus == 'DR') ? Colors.black:Colors.white,
//                                                   ),),
//                                                   SizedBox(height: 15.0,),
//                                                   Text('${item.guestCount}/${item.capacity}',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),),
//                                                   SizedBox(height: 5.0,),
//                                                   item.orderStatus == 'IP' || item.orderStatus == 'DR' ? Text('OrderNO: ${item.orderId}',style: TextStyle(fontFamily: 'PoppinsLight',fontStyle: FontStyle.normal,fontSize: 10.0,color: Colors.black,
//                                                   ),) : Container(),
//                                                   SizedBox(height: 5.0,),
//                                                   item.orderStatus == 'IP' || item.orderStatus == 'DR' ? Text('Saled  by: ${item.salesRepName}',style: TextStyle(fontFamily: 'PoppinsLight',fontStyle: FontStyle.normal,fontSize: 10.0,color: Colors.black,
//                                                   ),) : Container(),
//                                                   SizedBox(height: 5.0,),
//                                                   Text(item.orderStatus == null ? 'Available' : item.orderStatus == 'DR' ? 'Ordered': item.orderStatus == "IP" ? 'Billed': 'UnAvailable' ,style: TextStyle(fontSize:12,fontFamily: 'PoppinsLight',fontWeight: FontWeight.normal,color: (item.orderStatus == 'IP' || item.orderStatus == 'DR') ? Colors.black:Colors.white,),),
//                                                 ],
//                                               )
//                                           ),
//                                           Align(
//                                             alignment: Alignment.topRight,
//                                             child: Padding(
//                                               padding: EdgeInsets.only(top: 10.0,right: 10.0),
//                                               child: !_longpressSelected.contains(_tablesdata[key])
//                                                   ? Container() : Icon(Icons.offline_pin, color: Colors.blueAccent, size: 32.0,),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           );
//                         }
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: 50.0,
//                           width: 130,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(22.0),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.grey ,
//                                 blurRadius: 1.0,
//                                 offset: Offset(0.0,0.0),
//                               ),
//                             ],
//                           ),
//                           child: RaisedButton(
//                             onPressed: (){
//                               if(_longpressSelected.length == 1){
//                                 reusableObjectClass.guestCountDialog(context);
//                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemChooseScreen()));
//                               }
//                             },
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
//                             padding: EdgeInsets.all(0.0),
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                   gradient: LinearGradient(colors: [
//                                     Color(int.parse('FF505050',radix: 16)),
//                                     Color(int.parse('FF333333',radix: 16))],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter,
//                                   ),
//                                   borderRadius: BorderRadius.circular(22.0)
//                               ),
//                               child: Container(
//                                 constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
//                                 alignment: Alignment.center,
//                                 child: Text("SPLIT", textAlign: TextAlign.center, style: TextStyle(color: Colors.white
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Container(
//                           height: 50.0,
//                           width: 130,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(22.0),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.grey ,
//                                   blurRadius: 1.0,
//                                   offset: Offset(0.0,0.0)
//                               ),
//                             ],
//                           ),
//                           child: RaisedButton(
//                             onPressed: (){
//                               print("floors Data "+allfloorData.toString());
//                               print("tablesData" +_tablesdata.toString());
//                               if(_longpressSelected.length > 1){
//                                 reusableObjectClass.guestCountDialog(context);
//                               }
//                             },
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
//                             padding: EdgeInsets.all(0.0),
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                   gradient: LinearGradient(colors: [
//                                     Color(int.parse('FF505050',radix: 16)),
//                                     Color(int.parse('FF333333',radix: 16))],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter,
//                                   ),
//                                   borderRadius: BorderRadius.circular(22.0)
//                               ),
//                               child: Container(
//                                 constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
//                                 alignment: Alignment.center, child: Text("MERGE", textAlign: TextAlign.center,
//                                 style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.035,),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }