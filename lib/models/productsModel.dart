import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<Result> result;

  Products({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
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
  String productDescription;
  String productGroup;
  String productImage;
  String productName;
  String productPrice;
  String productSubGroup;
  String productSubSubGroup;

  LabelColumns({
    this.productDescription,
    this.productGroup,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productSubGroup,
    this.productSubSubGroup,
  });

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    productDescription: json["product_description"],
    productGroup: json["product_group"],
    productImage: json["product_image"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    productSubGroup: json["product_sub_group"],
    productSubSubGroup: json["product_sub_sub_group"],
  );

  Map<String, dynamic> toJson() => {
    "product_description": productDescription,
    "product_group": productGroup,
    "product_image": productImage,
    "product_name": productName,
    "product_price": productPrice,
    "product_sub_group": productSubGroup,
    "product_sub_sub_group": productSubSubGroup,
  };
}

class Result {
  String productDescription;
  ProductGroup productGroup;
  String productImage;
  String productName;
  double productPrice;
  ProductSubGroup productSubGroup;
  ProductSubSubGroup productSubSubGroup;

  Result({
    this.productDescription,
    this.productGroup,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productSubGroup,
    this.productSubSubGroup,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    productDescription: json["product_description"],
    productGroup: ProductGroup.fromJson(json["product_group"]),
    productImage: json["product_image"],
    productName: json["product_name"],
    productPrice: json["product_price"].toDouble(),
    productSubGroup: ProductSubGroup.fromJson(json["product_sub_group"]),
    productSubSubGroup: ProductSubSubGroup.fromJson(json["product_sub_sub_group"]),
  );

  Map<String, dynamic> toJson() => {
    "product_description": productDescription,
    "product_group": productGroup.toJson(),
    "product_image": productImage,
    "product_name": productName,
    "product_price": productPrice,
    "product_sub_group": productSubGroup.toJson(),
    "product_sub_sub_group": productSubSubGroup.toJson(),
  };
}

class ProductGroup {
  int id;
  String name;

  ProductGroup({
    this.id,
    this.name,
  });

  factory ProductGroup.fromJson(Map<String, dynamic> json) => ProductGroup(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class ProductSubGroup {
  int id;
  String name;
  int productGroup;

  ProductSubGroup({
    this.id,
    this.name,
    this.productGroup,
  });

  factory ProductSubGroup.fromJson(Map<String, dynamic> json) => ProductSubGroup(
    id: json["id"],
    name: json["name"],
    productGroup: json["product_group"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_group": productGroup,
  };
}

class ProductSubSubGroup {
  int id;
  String name;
  int productGroup;
  List<int> productInterests;
  int productSubGroup;

  ProductSubSubGroup({
    this.id,
    this.name,
    this.productGroup,
    this.productInterests,
    this.productSubGroup,
  });

  factory ProductSubSubGroup.fromJson(Map<String, dynamic> json) => ProductSubSubGroup(
    id: json["id"],
    name: json["name"],
    productGroup: json["product_group"],
    productInterests: List<int>.from(json["product_interests"].map((x) => x)),
    productSubGroup: json["product_sub_group"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_group": productGroup,
    "product_interests": List<dynamic>.from(productInterests.map((x) => x)),
    "product_sub_group": productSubGroup,
  };
}