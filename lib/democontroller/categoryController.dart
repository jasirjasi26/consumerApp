// // @dart=2.9
//
// import 'package:get/get.dart';
// import 'package:kiosk_consumer_app/democlass/allcategory.dart';
// import 'package:kiosk_consumer_app/services/demo_api.dart';
//
//
// class CategoryController extends GetxController{
//   // ignore: deprecated_member_use
//   var categoryList = List<AllCategory>().obs;
//
//   @override
//   void onInit() {
//
//     fetchCategory();
//     super.onInit();
//   }
//
//   Future<void> fetchCategory() async {
//     var category=await ApiService.getCategories();
//     if(category!=null){
//       categoryList.value=category;
//     }
//   }
// }