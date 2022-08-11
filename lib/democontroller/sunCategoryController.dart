// @dart=2.9

import 'package:get/get.dart';
import 'package:kiosk_consumer_app/democlass/allSubCategorys.dart';
import 'package:kiosk_consumer_app/services/demo_api.dart';

class SubCategoryController extends GetxController{
  // ignore: deprecated_member_use
  var subCategoryList = List<AllSubCategories>().obs;
  var isLoading =true.obs;


  @override
  void onInit() {
    fetchSubCategory();
    super.onInit();
  }

  Future<void> fetchSubCategory() async {
    isLoading(true);
    try {
      var subcategory=await ApiService.getSubCategories();
      if(subcategory!=null){
        subCategoryList.value=subcategory;
      }
    } finally{
      isLoading(false);
    }

  }
}