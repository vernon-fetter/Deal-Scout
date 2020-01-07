import 'dart:convert';

ProductSubGroupModel productSubGroupModelFromJson(String str) => ProductSubGroupModel.fromJson(json.decode(str));

String productSubGroupModelToJson(ProductSubGroupModel data) => json.encode(data.toJson());

class ProductSubGroupModel {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<Result> result;

  ProductSubGroupModel({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory ProductSubGroupModel.fromJson(Map<String, dynamic> json) => ProductSubGroupModel(
    count: json["count"],
    descriptionColumns: DescriptionColumns.fromJson(json["description_columns"]),
    ids: List<int>.from(json["ids"].map((x) => x)),
    labelColumns: LabelColumns.fromJson(json["label_columns"]),
    listColumns: List<String>.from(json["list_columns"].map((x) => x)),
    listTitle: json["list_title"],
    orderColumns: List<String>.from(json["order_columns"].map((x) => x)),
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
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
  String productGroup;
  String productsubgroupName;

  LabelColumns({
    this.productGroup,
    this.productsubgroupName,
  });

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    productGroup: json["product_group"],
    productsubgroupName: json["productsubgroup_name"],
  );

  Map<String, dynamic> toJson() => {
    "product_group": productGroup,
    "productsubgroup_name": productsubgroupName,
  };
}

class Result {
  ProductGroup productGroup;
  String productsubgroupName;

  Result({
    this.productGroup,
    this.productsubgroupName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    productGroup: ProductGroup.fromJson(json["product_group"]),
    productsubgroupName: json["productsubgroup_name"],
  );

  Map<String, dynamic> toJson() => {
    "product_group": productGroup.toJson(),
    "productsubgroup_name": productsubgroupName,
  };
}

class ProductGroup {
  int id;
  Name name;

  ProductGroup({
    this.id,
    this.name,
  });

  factory ProductGroup.fromJson(Map<String, dynamic> json) => ProductGroup(
    id: json["id"],
    name: nameValues.map[json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
  };
}

enum Name { HOUSEHOLD, FOOD, DRINKS }

final nameValues = EnumValues({
  "Drinks": Name.DRINKS,
  "Food": Name.FOOD,
  "Household": Name.HOUSEHOLD
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
