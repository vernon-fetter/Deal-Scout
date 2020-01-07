import 'dart:convert';

Vendors vendorsFromJson(String str) => Vendors.fromJson(json.decode(str));

String vendorsToJson(Vendors data) => json.encode(data.toJson());

class Vendors {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<Result> result;

  Vendors({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory Vendors.fromJson(Map<String, dynamic> json) => Vendors(
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
  String vendorAddress;
  String vendorDescription;
  String vendorEmail;
  String vendorGroup;
  String vendorLogo;
  String vendorName;
  String vendorTelephoneNumber;
  String vendorWebsite;

  LabelColumns({
    this.vendorAddress,
    this.vendorDescription,
    this.vendorEmail,
    this.vendorGroup,
    this.vendorLogo,
    this.vendorName,
    this.vendorTelephoneNumber,
    this.vendorWebsite,
  });

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    vendorAddress: json["vendor_address"],
    vendorDescription: json["vendor_description"],
    vendorEmail: json["vendor_email"],
    vendorGroup: json["vendor_group"],
    vendorLogo: json["vendor_logo"],
    vendorName: json["vendor_name"],
    vendorTelephoneNumber: json["vendor_telephone_number"],
    vendorWebsite: json["vendor_website"],
  );

  Map<String, dynamic> toJson() => {
    "vendor_address": vendorAddress,
    "vendor_description": vendorDescription,
    "vendor_email": vendorEmail,
    "vendor_group": vendorGroup,
    "vendor_logo": vendorLogo,
    "vendor_name": vendorName,
    "vendor_telephone_number": vendorTelephoneNumber,
    "vendor_website": vendorWebsite,
  };
}

class Result {
  String vendorAddress;
  String vendorDescription;
  String vendorEmail;
  VendorGroup vendorGroup;
  String vendorLogo;
  String vendorName;
  String vendorTelephoneNumber;
  String vendorWebsite;

  Result({
    this.vendorAddress,
    this.vendorDescription,
    this.vendorEmail,
    this.vendorGroup,
    this.vendorLogo,
    this.vendorName,
    this.vendorTelephoneNumber,
    this.vendorWebsite,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    vendorAddress: json["vendor_address"],
    vendorDescription: json["vendor_description"],
    vendorEmail: json["vendor_email"],
    vendorGroup: VendorGroup.fromJson(json["vendor_group"]),
    vendorLogo: json["vendor_logo"],
    vendorName: json["vendor_name"],
    vendorTelephoneNumber: json["vendor_telephone_number"],
    vendorWebsite: json["vendor_website"],
  );

  Map<String, dynamic> toJson() => {
    "vendor_address": vendorAddress,
    "vendor_description": vendorDescription,
    "vendor_email": vendorEmail,
    "vendor_group": vendorGroup.toJson(),
    "vendor_logo": vendorLogo,
    "vendor_name": vendorName,
    "vendor_telephone_number": vendorTelephoneNumber,
    "vendor_website": vendorWebsite,
  };
}

class VendorGroup {
  int id;
  String name;

  VendorGroup({
    this.id,
    this.name,
  });

  factory VendorGroup.fromJson(Map<String, dynamic> json) => VendorGroup(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
