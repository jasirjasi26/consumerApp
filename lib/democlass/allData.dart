// @dart=2.9
// To parse this JSON data, do
//
//     final allData = allDataFromJson(jsonString);

import 'dart:convert';


List<AllData> allDataFromJson(String str) => List<AllData>.from(json.decode(str).map((x) => AllData.fromJson(x)));

String allDataToJson(List<AllData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllData {
  AllData({
    this.menuId,
    this.menuGroupId,
    this.itemName,
    this.itemPrice,
    this.cmPid,
    this.image,
    this.isAddOn,
    this.isChooseBread,
    this.isToppings,
    this.isActive,
    this.comboItemsId,
    this.shortName,
    this.cid,
    this.taxid,
    this.menuGroupName,
    this.weight,
    this.rackNo,
    this.maxStockLevel,
    this.createdBy,
    this.categoryName,
    this.taxPercentage,
    this.qty,
  });

  int menuId;
  int menuGroupId;
  String itemName;
  double itemPrice;
  int cmPid;
  String image;
  bool isAddOn;
  bool isChooseBread;
  bool isToppings;
  bool isActive;
  int comboItemsId;
  dynamic shortName;
  int cid;
  double taxid;
  String menuGroupName;
  double weight;
  int rackNo;
  int maxStockLevel;
  dynamic createdBy;
  String categoryName;
  double taxPercentage;
  int qty;


  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
    menuId: json["MenuID"],
    menuGroupId: json["MenuGroupID"],
    itemName: json["ItemName"],
    itemPrice: json["ItemPrice"],
    cmPid: json["CMPid"],
    image: json["Image"],
    isAddOn: json["IsAddOn"],
    isChooseBread: json["IsChooseBread"],
    isToppings: json["IsToppings"],
    isActive: json["IsActive"],
    comboItemsId: json["ComboItemsID"],
    shortName: json["ShortName"],
    cid: json["Cid"],
    taxid: json["Taxid"],
    menuGroupName: json["MenuGroupName"],
    weight: json["Weight"],
    rackNo: json["RackNo"],
    maxStockLevel: json["MaxStockLevel"],
    createdBy: json["CreatedBy"],
    categoryName: json["CategoryName"],
    taxPercentage: json["TaxPercentage"],
    qty:  1
  );

  Map<String, dynamic> toJson() => {
    "MenuID": menuId,
    "MenuGroupID": menuGroupId,
    "ItemName": itemName,
    "ItemPrice": itemPrice,
    "CMPid": cmPid,
    "Image": image,
    "IsAddOn": isAddOn,
    "IsChooseBread": isChooseBread,
    "IsToppings": isToppings,
    "IsActive": isActive,
    "ComboItemsID": comboItemsId,
    "ShortName": shortName,
    "Cid": cid,
    "Taxid": taxid,
    "MenuGroupName": menuGroupName,
    "Weight": weight,
    "RackNo": rackNo,
    "MaxStockLevel": maxStockLevel,
    "CreatedBy": createdBy,
    "CategoryName": categoryName,
    "TaxPercentage": taxPercentage,
  };
}


class CartSummaries {
  CartSummaries({
    this.quantity,
  });

  int quantity;

  factory CartSummaries.fromJson(Map<String, dynamic> json) => CartSummaries(
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
  };
}

class Category {
  Category({
    this.id,
    this.parentId,
    this.offers,
  });

  int id;
  int parentId;
  dynamic offers;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    parentId: json["parent_id"],
    offers: json["offers"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "offers": offers,
  };
}

// class Image {
//   Image({
//     this.productId,
//     this.imageUrl,
//     this.isDefault,
//   });
//
//   int productId;
//   String imageUrl;
//   int isDefault;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     productId: json["product_id"],
//     imageUrl: json["image_url"],
//     isDefault: json["IS_default"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product_id": productId,
//     "image_url": imageUrl,
//     "IS_default": isDefault,
//   };
// }

enum ImageUrl { PRODUCTS_IMAGES_486_JPG, PRODUCTS_IMAGES_OPHOTO_PNG, PRODUCTS_IMAGES_306_JPG }

final imageUrlValues = EnumValues({
  "products\\images\\306.jpg": ImageUrl.PRODUCTS_IMAGES_306_JPG,
  "products\\images\\486.jpg": ImageUrl.PRODUCTS_IMAGES_486_JPG,
  "products\\images\nophoto.png": ImageUrl.PRODUCTS_IMAGES_OPHOTO_PNG
});

class Inventory {
  Inventory({
    this.id,
    this.productId,
    this.criticalPoint,
    this.isSalableNstocks,
  });

  int id;
  int productId;
  int criticalPoint;
  int isSalableNstocks;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
    id: json["id"],
    productId: json["product_id"],
    criticalPoint: json["critical_point"],
    isSalableNstocks: json["Is_salable_nstocks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "critical_point": criticalPoint,
    "Is_salable_nstocks": isSalableNstocks,
  };
}

class Price {
  Price({
    this.id,
    this.productId,
    this.salePrice,
    this.taxId,
    this.tax,
  });

  int id;
  int productId;
  double salePrice;
  int taxId;
  Tax tax;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"],
    productId: json["product_id"],
    salePrice: json["sale_price"].toDouble(),
    taxId: json["tax_id"],
    tax: Tax.fromJson(json["tax"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "sale_price": salePrice,
    "tax_id": taxId,
    "tax": tax.toJson(),
  };
}

class Tax {
  Tax({
    this.id,
    this.name,
    this.nameArabic,
    this.rate,
    this.isPriceInclude,
  });

  int id;
  TaxName name;
  TaxName nameArabic;
  int rate;
  int isPriceInclude;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    id: json["id"],
    name: taxNameValues.map[json["name"]],
    nameArabic: taxNameValues.map[json["name_arabic"]],
    rate: json["rate"],
    isPriceInclude: json["IS_price_include"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": taxNameValues.reverse[name],
    "name_arabic": taxNameValues.reverse[nameArabic],
    "rate": rate,
    "IS_price_include": isPriceInclude,
  };
}

enum TaxName { VAT_15_PRICE_INCLUDED }

final taxNameValues = EnumValues({
  " VAT 15 Price included": TaxName.VAT_15_PRICE_INCLUDED
});

class Storage {
  Storage({
    this.id,
    this.productId,
    this.quantityOnhand,
    this.quantityReserved,
  });

  int id;
  int productId;
  int quantityOnhand;
  int quantityReserved;

  factory Storage.fromJson(Map<String, dynamic> json) => Storage(
    id: json["id"],
    productId: json["product_id"],
    quantityOnhand: json["quantity_onhand"],
    quantityReserved: json["quantity_reserved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "quantity_onhand": quantityOnhand,
    "quantity_reserved": quantityReserved,
  };
}

class TagElement {
  TagElement({
    this.id,
    this.productId,
    this.tagId,
    this.tag,
  });

  int id;
  int productId;
  int tagId;
  TagTag tag;

  factory TagElement.fromJson(Map<String, dynamic> json) => TagElement(
    id: json["id"],
    productId: json["product_id"],
    tagId: json["tag_id"],
    tag: TagTag.fromJson(json["tag"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "tag_id": tagId,
    "tag": tag.toJson(),
  };
}

class TagTag {
  TagTag({
    this.id,
    this.name,
    this.nameArabic,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  TagName name;
  TagName nameArabic;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory TagTag.fromJson(Map<String, dynamic> json) => TagTag(
    id: json["id"],
    name: tagNameValues.map[json["name"]],
    nameArabic: tagNameValues.map[json["name_arabic"]],
    isActive: json["IS_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": tagNameValues.reverse[name],
    "name_arabic": tagNameValues.reverse[nameArabic],
    "IS_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

enum TagName { FOOD, FRESH_FOOD }

final tagNameValues = EnumValues({
  "FOOD": TagName.FOOD,
  "Fresh Food": TagName.FRESH_FOOD
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}