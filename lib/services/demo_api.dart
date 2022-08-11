import 'package:http/http.dart' as http;
import 'package:kiosk_consumer_app/democlass/allData.dart';
import 'package:kiosk_consumer_app/democlass/allSubCategorys.dart';
import 'package:kiosk_consumer_app/democlass/selectCategory.dart';


class ApiService {
  static  var client =http.Client();

  // static Future<List<AllCategory>?> getCategories() async {
  //   final response = await client
  //       .get(Uri.parse('https://sta.farawlah.sa/api/mobile/categories'));
  //   if (response.statusCode == 200) {
  //     return allCategoryFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }

  static Future<List<AllSubCategories>?> getSubCategories() async {
    // final response = await client.get(Uri.parse(
    //     'https://sta.farawlah.sa/api/mobile/subcategories?parent_id=${selectCategory.selectedSubCategory}'));
    final response = await client.get(Uri.parse(
        'https://zres1.clubsoft.co.in/WalkIn/GetAllMenuGroup?CMPid=1'));
    //print(response.body);
    if (response.statusCode == 200) {

      return allSubCategoriesFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<AllData>?> getAll() async {
    // final response = await client.get(Uri.parse(
    //     'https://sta.farawlah.sa/api/mobile/products?category_id=${selectCategory.selectedSubCategory}&limit=20&store_id=2&offset=${selectCategory.offset}'));
    final response = await client.get(Uri.parse(
        'https://zres1.clubsoft.co.in/WalkIn/GetAllMenuItemByMenuGroupID?MenuGroupID=${selectCategory.selectedSubCategory}&CMPid=1'));
    //print(response.body);
    if (response.statusCode == 200) {
     // print(response.body);
      return allDataFromJson(response.body);
    } else {
      return null;
    }
  }
}