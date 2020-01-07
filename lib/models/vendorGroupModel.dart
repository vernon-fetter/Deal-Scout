import 'dart:convert';

VendorGroupModel vendorGroupModelFromJson(String str) => VendorGroupModel.fromJson(json.decode(str));

String vendorGroupModelToJson(VendorGroupModel data) => json.encode(data.toJson());

class VendorGroupModel {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<LabelColumns> result;

  VendorGroupModel({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory VendorGroupModel.fromJson(Map<String, dynamic> json) => VendorGroupModel(
    count: json["count"],
    descriptionColumns: DescriptionColumns.fromJson(json["description_columns"]),
    ids: List<int>.from(json["ids"].map((x) => x)),
    labelColumns: LabelColumns.fromJson(json["label_columns"]),
    listColumns: List<String>.from(json["list_columns"].map((x) => x)),
    listTitle: json["list_title"],
    orderColumns: List<String>.from(json["order_columns"].map((x) => x)),
    result: List<LabelColumns>.from(json["result"].map((x) => LabelColumns.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "description_columns": descriptionColumns.toJson(),
    "ids": List<dynamic>.from(ids.map((x) => x)),
    "label_columns": labelColumns.toJson(),
    "list_columns": List<dynamic>.from(listColumns.map((x) => x)),
    "list_title": listTitle,
    "order_columns": List<dynamic>.from(orderColumns.map((x) => x)),
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class DescriptionColumns {
  DescriptionColumns();

  factory DescriptionColumns.fromJson(Map<String, dynamic> json) => DescriptionColumns(
  );

  Map<String, dynamic> toJson() => {
  };
}

class LabelColumns {
  String name;

  LabelColumns({
    this.name,
  });

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
