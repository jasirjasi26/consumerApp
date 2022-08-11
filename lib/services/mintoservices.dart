// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'loginservice.dart';
import 'mintoclasses.dart';

class RestaurantServices{

  // Future<List<FloorDatas>> floorsandtablesData() async{
  //   LoginService loginService = LoginService();
  //   Token token =  await loginService.login();
  //   final String url = '${token.url}/AdempiereService/PosiboltRest/floorsandtables';
  //   Response response = await get(Uri.parse(url), headers: {
  //     HttpHeaders.contentTypeHeader: "application/json",
  //     "Authorization": '${token.token_type} ${token.access_token}'});
  //   if (response.statusCode == 200) {
  //     return floorDataFromJson(response.body);
  //   }
  //   else{
  //     throw Exception('Error getting');
  //   }
  // }

}