
// To parse this JSON data, do
//
//     final allSubCategories = allSubCategoriesFromJson(jsonString);
// To parse this JSON data, do
//
//     final allSubCategories = allSubCategoriesFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

List<AllSubCategories> allSubCategoriesFromJson(String str) => List<AllSubCategories>.from(json.decode(str).map((x) => AllSubCategories.fromJson(x)));

String allSubCategoriesToJson(List<AllSubCategories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllSubCategories {
  AllSubCategories({
    this.menuGroupId,
    this.menuGroupName,
    this.image,
    this.isActive,
    this.cmPid,
    this.menuCategoryId,
    this.categoryName,
  });

  int menuGroupId;
  String menuGroupName;
  dynamic image;
  bool isActive;
  int cmPid;
  int menuCategoryId;
  dynamic categoryName;

  factory AllSubCategories.fromJson(Map<String, dynamic> json) => AllSubCategories(
    menuGroupId: json["MenuGroupId"],
    menuGroupName: json["MenuGroupName"],
    image: json["Image"],
    isActive: json["IsActive"],
    cmPid: json["CMPid"],
    menuCategoryId: json["MenuCategoryId"],
    categoryName: json["CategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "MenuGroupId": menuGroupId,
    "MenuGroupName": menuGroupName,
    "Image": image,
    "IsActive": isActive,
    "CMPid": cmPid,
    "MenuCategoryId": menuCategoryId,
    "CategoryName": categoryName,
  };
}
