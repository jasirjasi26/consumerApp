
// @dart=2.9
import 'package:get/get.dart';
import 'package:kiosk_consumer_app/democlass/allData.dart';
import 'package:kiosk_consumer_app/services/demo_api.dart';


class AllDataController extends GetxController{
  // ignore: deprecated_member_use
  var allDataList = List<AllData>().obs;
  var isLoading =true.obs;

  @override
  void onInit() {

    fetchAllData();
    super.onInit();
  }

  Future fetchAllData() async {
    isLoading(true);
    try {
      var alldata=await ApiService.getAll();
      if(alldata!=null){
        allDataList.value=alldata;
      }
      return allDataList;
    } finally{
      isLoading(false);
    }

  }
}