// @dart=2.9
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_consumer_app/democontroller/allDataController.dart';
import 'package:kiosk_consumer_app/democontroller/sunCategoryController.dart';
import 'package:kiosk_consumer_app/democlass/selectCategory.dart';
import 'package:kiosk_consumer_app/widgets/demoquantitybutton.dart';
import 'package:kiosk_consumer_app/widgets/pageheadersection.dart';
import 'cartpage.dart';
import 'democlass/allData.dart';
import 'democontroller/cartController.dart';

class ItemChooseScreen extends StatefulWidget {
  const ItemChooseScreen({Key key}) : super(key: key);

  @override
  _ItemChooseScreenState createState() => _ItemChooseScreenState();
}

class _ItemChooseScreenState extends State<ItemChooseScreen> {
  //final CategoryController categoryController = Get.put(CategoryController());
  final SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  final AllDataController allDataController = Get.put(AllDataController());
  ReusableObjectClass reusableObjectClass = ReusableObjectClass();
  final cartController = Get.put(CartController());
  var scrollController = ScrollController();
  var _searchcontroller = TextEditingController();

  int value1 = 1;
  int selectedCategoryIndex;
  int selectedSubCategoryIndex;
  static int offset = 0;
  List<AllData> listedItemList = [];
  List<AllData> _searchFoundedItem = [];
  bool isLoading = false;
  String _genderRadioBtnVal;

  void _runFilter(String enteredKeyword) {
    List<AllData> results = [];
    if (enteredKeyword.isEmpty) {
      results = listedItemList;
    } else {
      results = listedItemList
          .where((user) =>
              user.itemName.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchFoundedItem = results;
    });
  }

  @override
  Future<void> initState() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          setState(() {
            offset = offset + 1;
          });
          selectCategory.offset = offset;
          getList();
        } else {
          print('ListView scroll at top');
          // Load next documents
        }
      }
    });
    //getList();
    clickSubCategory(
        0,1);
    super.initState();
  }

  getList() async {
    isLoading = true;
    allDataController.fetchAllData().then((value) {
      setState(() {
        listedItemList.addAll(value);
        isLoading = false;
      });
    });
  }

  clickCategory(int index, int id) {
    listedItemList.clear();
    _searchFoundedItem.clear();
    _searchcontroller.clear();
    offset = 0;
    selectCategory.offset = offset;
    selectCategory.selectedSubCategory = id;
    setState(() {
      selectedCategoryIndex = index;
      selectedSubCategoryIndex = null;
    });
    subCategoryController.fetchSubCategory();
  }

  clickSubCategory(int index, int id) {
    listedItemList.clear();
    _searchFoundedItem.clear();
    _searchcontroller.clear();
    offset = 0;
    selectCategory.offset = offset;
    selectCategory.selectedSubCategory = id;
    setState(() {
      selectedSubCategoryIndex = index;
    });
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                gradient: LinearGradient(
                  begin: Alignment(-0.97, 0.0),
                  end: Alignment(0.97, 0.11),
                  colors: [const Color(0xff005fb8), const Color(0xff60cdff)],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.pop(context);

                            Navigator.pushReplacementNamed(
                                context, "/login");
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 60,
                        width: MediaQuery.of(context).size.width * .8,
                        child: Card(
                          child: new ListTile(
                            leading: new Icon(Icons.search),
                            title: new TextField(
                              style: TextStyle(fontFamily: 'PoppinsLight'),
                              controller: _searchcontroller,
                              onChanged: (value) => _runFilter(value),
                              decoration: new InputDecoration(
                                  hintText: '', border: InputBorder.none),
                            ),
                            // trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                            //   setState(() {
                            //     _searchcontroller.clear();
                            //     _searchFoundedItem = listedItemList;
                            //   });
                            //           },
                            //        ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          //margin: EdgeInsets.only(top: 50.0,bottom: 10,right:MediaQuery.of(context).size.width > 700 ? MediaQuery.of(context).size.width * 0.04 : 0),
                          height: 50,
                          width: 50,
                          child: Material(
                            color: Colors.transparent, // Button color
                            child: InkWell(
                              splashColor: Colors.white, // Splash color
                              onTap: () {
                                if (cartController.cartItems.length >= 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CartPage()));
                                } else {
                                  reusableObjectClass.showToast(
                                      context,
                                      Icons.shopping_cart,
                                      Colors.cyan,
                                      "No items in cart..!");
                                }
                              },
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      Positioned(
                                          top: 1,
                                          right: 23,
                                          child: CircleAvatar(
                                            radius: 11,
                                            backgroundColor: Colors.cyan,
                                            foregroundColor: Colors.white,
                                            child: GetX<CartController>(
                                                builder: (controller) {
                                              return Text(
                                                controller.count.toString(),
                                                style: TextStyle(
                                                    fontFamily: 'PoppinsLight',
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              );
                                            }),
                                          ))
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Container(
            padding:
                EdgeInsets.only(top: 140, left: 0.0, right: 0.0, bottom: 0.0),
            child: Stack(
              children: [
                // ListView(
                //   //shrinkWrap: true,
                //   //physics: NeverScrollableScrollPhysics(),
                //   children: [

                    SafeArea(
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount:
                              subCategoryController.subCategoryList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    clickSubCategory(
                                        index,
                                        subCategoryController
                                            .subCategoryList[index].menuGroupId);
                                  },
                                  child: Card(
                                    elevation: 3,
                                    borderOnForeground: true,
                                    shadowColor: Colors.cyan,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                        gradient: LinearGradient(
                                          begin: Alignment(0.0, -1.0),
                                          end: Alignment(0.0, 1.0),
                                          colors: [const Color(0xff60cdff), const Color(0xffffffff)],
                                          stops: [0.0, 1.0],
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 5,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: selectedSubCategoryIndex !=
                                                  index ? Colors.transparent : Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Center(
                                            child: Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  subCategoryController
                                                      .subCategoryList[index]
                                                      .menuGroupName.toUpperCase()
                                                      .toString(),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                      selectedSubCategoryIndex ==
                                                          index
                                                          ? FontWeight.w900
                                                          : FontWeight
                                                          .w400),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height,
                              child: _searchFoundedItem.isNotEmpty
                                  ? GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5,
                                              childAspectRatio: 0.6),
                                      itemCount: _searchFoundedItem.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        String image_url =
                                            _searchFoundedItem[index]
                                                .image
                                                .toString();
                                        return GestureDetector(
                                          onTap: () {
                                            showCustomDialog(context,
                                                _searchFoundedItem[index]);
                                          },
                                          child: Card(
                                            //margin: EdgeInsets.only(bottom: 0.8),
                                            color: Colors.white,
                                            elevation: 10,
                                            // (!cartController.cartItems.contains(k[index]))?Colors.white:Colors.grey.shade300,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          // width: MediaQuery.of(context).size.width * 0.3,
                                                          height: 90,
                                                          child: image_url != ""
                                                              ? ClipRRect(
                                                                  child:Image.memory(base64Decode(image_url))
                                                                )
                                                              : Container(
                                                                  height: 30,
                                                                  width: 30,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        1.5,
                                                                  ),
                                                                ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                                _searchFoundedItem[
                                                                        index]
                                                                    .itemName,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'PoppinsLight',
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900)),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                                "Rs " +
                                                                    "${_searchFoundedItem[index].itemPrice}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'PoppinsBold',
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                QuantityButton(
                                                                  initialQuantity:
                                                                      1,
                                                                  onQuantityChange:
                                                                      getCounterValue,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Container(
                                                              height: 30,
                                                              width: 135,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin:
                                                                      Alignment(
                                                                          -0.97,
                                                                          0.0),
                                                                  end:
                                                                      Alignment(
                                                                          0.97,
                                                                          0.11),
                                                                  colors: [
                                                                    const Color(
                                                                        0xff005fb8),
                                                                    const Color(
                                                                        0xff60cdff)
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                ),
                                                              ),
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    _searchFoundedItem[index]
                                                                            .qty =
                                                                        value1;
                                                                    cartController
                                                                        .addToCart(
                                                                            _searchFoundedItem[index]);
                                                                    //value1 = 1;
                                                                    reusableObjectClass.showToast(
                                                                        context,
                                                                        Icons
                                                                            .shopping_cart,
                                                                        Colors
                                                                            .cyan,
                                                                        "Item added to cart..!");
                                                                  });
                                                                },
                                                                color: Colors
                                                                    .transparent,
                                                                // textColor: Colors.white,
                                                                child: Text(
                                                                  'Add to Cart',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 3.0,
                                                  top: 3.0,
                                                  child: Icon(
                                                    (!cartController.cartItems
                                                            .contains(
                                                                _searchFoundedItem[
                                                                    index]))
                                                        ? null
                                                        : Icons.shopping_cart,
                                                    color: Colors.cyan,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                  : GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 0,
                                              mainAxisSpacing: 0,
                                              childAspectRatio: 0.6),
                                      itemCount: listedItemList.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        String image_url = listedItemList[index]
                                            .image
                                            .toString();
                                        return GestureDetector(
                                          onTap: () {
                                            showCustomDialog(context, listedItemList[index]);
                                          },
                                          child: Card(
                                            //margin: EdgeInsets.only(bottom: 0.8),
                                            color: Colors.white,
                                            elevation: 10,
                                            // (!cartController.cartItems.contains(k[index]))?Colors.white:Colors.grey.shade300,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          // width: MediaQuery.of(context).size.width * 0.3,
                                                          height: 90,
                                                          child: image_url != ""
                                                              ?  ClipRRect(
                                                              child:Image.memory(base64Decode(image_url))
                                                          )
                                                              : Container(
                                                                  height: 30,
                                                                  width: 30,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    strokeWidth:
                                                                        1,
                                                                  ),
                                                                ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                                listedItemList[
                                                                        index]
                                                                    .itemName,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'PoppinsLight',
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900)),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                                "Rs " +
                                                                    "${listedItemList[index].itemPrice}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'PoppinsBold',
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                QuantityButton(
                                                                  initialQuantity:
                                                                      1,
                                                                  onQuantityChange:
                                                                      getCounterValue,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Container(
                                                              height: 25,
                                                              width: 135,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin:
                                                                      Alignment(
                                                                          -0.97,
                                                                          0.0),
                                                                  end:
                                                                      Alignment(
                                                                          0.97,
                                                                          0.11),
                                                                  colors: [
                                                                    const Color(
                                                                        0xff005fb8),
                                                                    const Color(
                                                                        0xff60cdff)
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                ),
                                                              ),
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    listedItemList[index]
                                                                            .qty =
                                                                        value1;
                                                                    cartController
                                                                        .addToCart(
                                                                            listedItemList[index]);
                                                                    //value1 = 1;
                                                                    reusableObjectClass.showToast(
                                                                        context,
                                                                        Icons
                                                                            .shopping_cart,
                                                                        Colors
                                                                            .cyan,
                                                                        "Item added to cart..!");
                                                                  });
                                                                },
                                                                color: Colors
                                                                    .transparent,
                                                                // textColor: Colors.white,
                                                                child: Text(
                                                                  'Add to Cart',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 3.0,
                                                  top: 3.0,
                                                  child: Icon(
                                                    (!cartController.cartItems
                                                            .contains(
                                                                listedItemList[
                                                                    index]))
                                                        ? null
                                                        : Icons.shopping_cart,
                                                    color: Colors.cyan,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })),
                        ],
                      ),
                    ),
                  ],
                ),
            //  ],
            //),
          ),
          isLoading
              ? Positioned(
                  bottom: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.red[900],
                            strokeWidth: 1.5,
                          )),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Future<int> getCounterValue(int counter) async {
    value1 = await counter;
    print('value is $value1');
    return value1;
  }

  void showCustomDialog(BuildContext context, AllData listedItemList) {
    String image_url = listedItemList.image.toString();

    void _handleGenderChange(String value) {
      setState(() {
        _genderRadioBtnVal = value;
      });
    }

    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Center(
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.3,
                        height: 120,
                        child: image_url != ""
                            ?  ClipRRect(
                            child:Image.memory(base64Decode(image_url))
                        )
                            : Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(listedItemList.itemName,
                              style: TextStyle(
                                  fontFamily: 'PoppinsLight',
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Rs " + "${listedItemList.itemPrice}",
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              QuantityButton(
                                initialQuantity: 1,
                                onQuantityChange: getCounterValue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    Divider(),

                    Material(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("    Add Ons (0 to 3)",
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                          Container(
                            width: MediaQuery.of(context).size.width*0.75,
                            child: Row(
                              children: <Widget>[
                                Radio<String>(
                                  value: "Cheese",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Cheese"),
                                Radio<String>(
                                  value: "Bacon",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Bacon"),
                                Radio<String>(
                                  value: "Onion Rings",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Onion Rings"),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.75,
                            child: Row(
                              children: <Widget>[
                                Radio<String>(
                                  value: "Tomato's",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Tomato's"),
                                Radio<String>(
                                  value: "Cabbage",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Cabbage"),
                                Radio<String>(
                                  value: "Capsicum",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Capsicum"),
                              ],
                            ),
                          ),


                          Text("    Souce Side (0 to 3)",
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                          Container(
                            width: MediaQuery.of(context).size.width*0.75,
                            child: Row(
                              children: <Widget>[
                                Radio<String>(
                                  value: "Cheese",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Cheese"),
                                Radio<String>(
                                  value: "Bacon",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Bacon"),
                                Radio<String>(
                                  value: "Onion Rings",
                                  activeColor: Colors.cyan,
                                  groupValue: _genderRadioBtnVal,
                                  onChanged: (val){
                                    setState(() {
                                      _genderRadioBtnVal = val;
                                    });
                                  },
                                ),
                                Text("Onion Rings"),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 25,),

                    Container(
                      height: 30,
                      width: 125,
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
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            listedItemList.qty = value1;
                            cartController.addToCart(listedItemList);
                            Navigator.pop(context);
                            reusableObjectClass.showToast(
                                context,
                                Icons.shopping_cart,
                                Colors.cyan,
                                "Item added to cart..!");
                          });
                        },
                        color: Colors.transparent,
                        // textColor: Colors.white,
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ])),
            );
          });
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }


}
