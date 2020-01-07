import 'dart:convert';

ProductSubSubGroup productSubSubGroupFromJson(String str) => ProductSubSubGroup.fromJson(json.decode(str));

String productSubSubGroupToJson(ProductSubSubGroup data) => json.encode(data.toJson());

class ProductSubSubGroup {
  int count;
  DescriptionColumns descriptionColumns;
  List<dynamic> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<dynamic> result;

  ProductSubSubGroup({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory ProductSubSubGroup.fromJson(Map<String, dynamic> json) => ProductSubSubGroup(
    count: json["count"],
    descriptionColumns: DescriptionColumns.fromJson(json["description_columns"]),
    ids: List<dynamic>.from(json["ids"].map((x) => x)),
    labelColumns: LabelColumns.fromJson(json["label_columns"]),
    listColumns: List<String>.from(json["list_columns"].map((x) => x)),
    listTitle: json["list_title"],
    orderColumns: List<String>.from(json["order_columns"].map((x) => x)),
    result: List<dynamic>.from(json["result"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "description_columns": descriptionColumns.toJson(),
    "ids": List<dynamic>.from(ids.map((x) => x)),
    "label_columns": labelColumns.toJson(),
    "list_columns": List<dynamic>.from(listColumns.map((x) => x)),
    "list_title": listTitle,
    "order_columns": List<dynamic>.from(orderColumns.map((x) => x)),
    "result": List<dynamic>.from(result.map((x) => x)),
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
  String productGroup;
  String productInterests;
  String productSubGroup;

  LabelColumns({
    this.name,
    this.productGroup,
    this.productInterests,
    this.productSubGroup,
  });

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    name: json["name"],
    productGroup: json["product_group"],
    productInterests: json["product_interests"],
    productSubGroup: json["product_sub_group"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "product_group": productGroup,
    "product_interests": productInterests,
    "product_sub_group": productSubGroup,
  };
}
