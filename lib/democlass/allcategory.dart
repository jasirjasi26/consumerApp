
import 'dart:convert';

List<AllCategory> allCategoryFromJson(String str) => List<AllCategory>.from(json.decode(str).map((x) => AllCategory.fromJson(x)));

String allCategoryToJson(List<AllCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCategory {
  AllCategory({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.imageUrl,
    this.parentId,
    required this.isActive,
    required this.isAvailableInApp,
  });

  int id;
  String name;
  String nameArabic;
  String imageUrl;
  dynamic parentId;
  int isActive;
  int isAvailableInApp;

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
    id: json["id"],
    name: json["name"],
    nameArabic: json["name_arabic"],
    imageUrl: json["image_url"],
    parentId: json["parent_id"],
    isActive: json["IS_active"],
    isAvailableInApp: json["IS_available_in_app"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_arabic": nameArabic,
    "image_url": imageUrl,
    "parent_id": parentId,
    "IS_active": isActive,
    "IS_available_in_app": isAvailableInApp,
  };
}