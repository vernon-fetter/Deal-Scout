import 'dart:convert';

Interests interestsFromJson(String str) => Interests.fromJson(json.decode(str));

String interestsToJson(Interests data) => json.encode(data.toJson());

class Interests {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<Result> result;

  Interests({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory Interests.fromJson(Map<String, dynamic> json) => Interests(
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
  String abuser;
  String interest;
  String productsubsubgroup;

  LabelColumns({
    this.abuser,
    this.interest,
    this.productsubsubgroup,
  });

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    abuser: json["abuser"],
    interest: json["interest"],
    productsubsubgroup: json["productsubsubgroup"],
  );

  Map<String, dynamic> toJson() => {
    "abuser": abuser,
    "interest": interest,
    "productsubsubgroup": productsubsubgroup,
  };
}

class Result {
  List<dynamic> abuser;
  String interest;
  List<Productsubsubgroup> productsubsubgroup;

  Result({
    this.abuser,
    this.interest,
    this.productsubsubgroup,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    abuser: List<dynamic>.from(json["abuser"].map((x) => x)),
    interest: json["interest"],
    productsubsubgroup: List<Productsubsubgroup>.from(json["productsubsubgroup"].map((x) => Productsubsubgroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "abuser": List<dynamic>.from(abuser.map((x) => x)),
    "interest": interest,
    "productsubsubgroup": List<dynamic>.from(productsubsubgroup.map((x) => x.toJson())),
  };
}

class Productsubsubgroup {
  int id;
  String name;
  int productGroup;
  List<int> productInterests;
  int productSubGroup;

  Productsubsubgroup({
    this.id,
    this.name,
    this.productGroup,
    this.productInterests,
    this.productSubGroup,
  });

  factory Productsubsubgroup.fromJson(Map<String, dynamic> json) => Productsubsubgroup(
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