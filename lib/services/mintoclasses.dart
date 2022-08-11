// @dart=2.9
import 'dart:convert';

List<FloorDatas> floorDataFromJson(String str) => List<FloorDatas>.from(json.decode(str).map((x) => FloorDatas.fromJson(x)));
String floorDataToJson(List<FloorDatas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FloorDatas {
  FloorDatas({
    this.floorId,
    this.floorName,
    this.tables,
  });

  int floorId;
  String floorName;
  List<TableDatas> tables;

  factory FloorDatas.fromJson(Map<String, dynamic> json) => FloorDatas(
    floorId: json["floorId"],
    floorName: json["floorName"],
    tables: List<TableDatas>.from(json["tables"].map((x) => TableDatas.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "floorId": floorId,
    "floorName": floorName,
    "tables": List<dynamic>.from(tables.map((x) => x.toJson())),
  };
}

class TableDatas {
  TableDatas({
    this.dineTableId,
    this.dineTableName,
    this.capacity,
    this.orderId,
    this.guestCount,
    this.orderStatus,
    this.salesRepName
  });

  int dineTableId;
  String dineTableName;
  int capacity;
  int orderId;
  int guestCount;
  String orderStatus;
  String salesRepName;

  factory TableDatas.fromJson(Map<String, dynamic> json) => TableDatas(
    dineTableId: json["dineTableId"],
    dineTableName: json["dineTableName"],
    capacity: json["capacity"],
    orderId: json["orderId"],
    guestCount: json["guestCount"],
    orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
      salesRepName: json["salesRepName"] == null ? null : json["salesRepName"],
  );

  Map<String, dynamic> toJson() => {
    "dineTableId": dineTableId,
    "dineTableName": dineTableName,
    "capacity": capacity,
    "orderId": orderId,
    "guestCount": guestCount,
    "orderStatus": orderStatus == null ? null : orderStatus,
    "salesRepName": salesRepName == null ? null : salesRepName,
  };
}