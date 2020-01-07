import 'dart:convert';

Promos promosFromJson(String str) => Promos.fromJson(json.decode(str));

String promosToJson(Promos data) => json.encode(data.toJson());

class Promos {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<Result> result;

  Promos({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory Promos.fromJson(Map<String, dynamic> json) => Promos(
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
  String promoActive;
  String promoDateFrom;
  String promoDateTo;
  String promoDescription;
  String promoName;
  String promoPrice;
  String promoProductGroup;
  String promoProductName;
  String promoProductSubGroup;
  String promoProductSubSubGroup;
  String promoVendorGroup;
  String promoVendorName;
  String promoVendorSite;

  LabelColumns({
    this.promoActive,
    this.promoDateFrom,
    this.promoDateTo,
    this.promoDescription,
    this.promoName,
    this.promoPrice,
    this.promoProductGroup,
    this.promoProductName,
    this.promoProductSubGroup,
    this.promoProductSubSubGroup,
    this.promoVendorGroup,
    this.promoVendorName,
    this.promoVendorSite,
  });

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    promoActive: json["promo_active"],
    promoDateFrom: json["promo_date_from"],
    promoDateTo: json["promo_date_to"],
    promoDescription: json["promo_description"],
    promoName: json["promo_name"],
    promoPrice: json["promo_price"],
    promoProductGroup: json["promo_product_group"],
    promoProductName: json["promo_product_name"],
    promoProductSubGroup: json["promo_product_sub_group"],
    promoProductSubSubGroup: json["promo_product_sub_sub_group"],
    promoVendorGroup: json["promo_vendor_group"],
    promoVendorName: json["promo_vendor_name"],
    promoVendorSite: json["promo_vendor_site"],
  );

  Map<String, dynamic> toJson() => {
    "promo_active": promoActive,
    "promo_date_from": promoDateFrom,
    "promo_date_to": promoDateTo,
    "promo_description": promoDescription,
    "promo_name": promoName,
    "promo_price": promoPrice,
    "promo_product_group": promoProductGroup,
    "promo_product_name": promoProductName,
    "promo_product_sub_group": promoProductSubGroup,
    "promo_product_sub_sub_group": promoProductSubSubGroup,
    "promo_vendor_group": promoVendorGroup,
    "promo_vendor_name": promoVendorName,
    "promo_vendor_site": promoVendorSite,
  };
}

class Result {
  bool promoActive;
  DateTime promoDateFrom;
  DateTime promoDateTo;
  String promoDescription;
  String promoName;
  double promoPrice;
  PromoGroup promoProductGroup;
  PromoProductName promoProductName;
  PromoProductSubGroup promoProductSubGroup;
  PromoProductSubSubGroup promoProductSubSubGroup;
  PromoGroup promoVendorGroup;
  PromoVendorName promoVendorName;
  PromoVendorSite promoVendorSite;

  Result({
    this.promoActive,
    this.promoDateFrom,
    this.promoDateTo,
    this.promoDescription,
    this.promoName,
    this.promoPrice,
    this.promoProductGroup,
    this.promoProductName,
    this.promoProductSubGroup,
    this.promoProductSubSubGroup,
    this.promoVendorGroup,
    this.promoVendorName,
    this.promoVendorSite,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    promoActive: json["promo_active"],
    promoDateFrom: DateTime.parse(json["promo_date_from"]),
    promoDateTo: DateTime.parse(json["promo_date_to"]),
    promoDescription: json["promo_description"],
    promoName: json["promo_name"],
    promoPrice: json["promo_price"].toDouble(),
    promoProductGroup: PromoGroup.fromJson(json["promo_product_group"]),
    promoProductName: PromoProductName.fromJson(json["promo_product_name"]),
    promoProductSubGroup: PromoProductSubGroup.fromJson(json["promo_product_sub_group"]),
    promoProductSubSubGroup: PromoProductSubSubGroup.fromJson(json["promo_product_sub_sub_group"]),
    promoVendorGroup: PromoGroup.fromJson(json["promo_vendor_group"]),
    promoVendorName: PromoVendorName.fromJson(json["promo_vendor_name"]),
    promoVendorSite: PromoVendorSite.fromJson(json["promo_vendor_site"]),
  );

  Map<String, dynamic> toJson() => {
    "promo_active": promoActive,
    "promo_date_from": "${promoDateFrom.year.toString().padLeft(4, '0')}-${promoDateFrom.month.toString().padLeft(2, '0')}-${promoDateFrom.day.toString().padLeft(2, '0')}",
    "promo_date_to": "${promoDateTo.year.toString().padLeft(4, '0')}-${promoDateTo.month.toString().padLeft(2, '0')}-${promoDateTo.day.toString().padLeft(2, '0')}",
    "promo_description": promoDescription,
    "promo_name": promoName,
    "promo_price": promoPrice,
    "promo_product_group": promoProductGroup.toJson(),
    "promo_product_name": promoProductName.toJson(),
    "promo_product_sub_group": promoProductSubGroup.toJson(),
    "promo_product_sub_sub_group": promoProductSubSubGroup.toJson(),
    "promo_vendor_group": promoVendorGroup.toJson(),
    "promo_vendor_name": promoVendorName.toJson(),
    "promo_vendor_site": promoVendorSite.toJson(),
  };
}

class PromoGroup {
  int id;
  String name;

  PromoGroup({
    this.id,
    this.name,
  });

  factory PromoGroup.fromJson(Map<String, dynamic> json) => PromoGroup(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class PromoProductName {
  int id;
  String productDescription;
  int productGroup;
  String productImage;
  String productName;
  double productPrice;
  int productSubGroup;
  int productSubSubGroup;

  PromoProductName({
    this.id,
    this.productDescription,
    this.productGroup,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productSubGroup,
    this.productSubSubGroup,
  });

  factory PromoProductName.fromJson(Map<String, dynamic> json) => PromoProductName(
    id: json["id"],
    productDescription: json["product_description"],
    productGroup: json["product_group"],
    productImage: json["product_image"],
    productName: json["product_name"],
    productPrice: json["product_price"].toDouble(),
    productSubGroup: json["product_sub_group"],
    productSubSubGroup: json["product_sub_sub_group"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_description": productDescription,
    "product_group": productGroup,
    "product_image": productImage,
    "product_name": productName,
    "product_price": productPrice,
    "product_sub_group": productSubGroup,
    "product_sub_sub_group": productSubSubGroup,
  };
}

class PromoProductSubGroup {
  int id;
  String name;
  int productGroup;

  PromoProductSubGroup({
    this.id,
    this.name,
    this.productGroup,
  });

  factory PromoProductSubGroup.fromJson(Map<String, dynamic> json) => PromoProductSubGroup(
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

class PromoProductSubSubGroup {
  int id;
  String name;
  int productGroup;
  List<int> productInterests;
  int productSubGroup;

  PromoProductSubSubGroup({
    this.id,
    this.name,
    this.productGroup,
    this.productInterests,
    this.productSubGroup,
  });

  factory PromoProductSubSubGroup.fromJson(Map<String, dynamic> json) => PromoProductSubSubGroup(
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

class PromoVendorName {
  int id;
  String vendorAddress;
  String vendorDescription;
  String vendorEmail;
  int vendorGroup;
  String vendorLogo;
  String vendorName;
  String vendorTelephoneNumber;
  String vendorWebsite;

  PromoVendorName({
    this.id,
    this.vendorAddress,
    this.vendorDescription,
    this.vendorEmail,
    this.vendorGroup,
    this.vendorLogo,
    this.vendorName,
    this.vendorTelephoneNumber,
    this.vendorWebsite,
  });

  factory PromoVendorName.fromJson(Map<String, dynamic> json) => PromoVendorName(
    id: json["id"],
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
    "id": id,
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

class PromoVendorSite {
  List<int> abuser;
  int id;
  String vendorSiteAddress;
  String vendorSiteEmail;
  String vendorSiteImage;
  double vendorSiteLatitude;
  double vendorSiteLongitude;
  String vendorSiteName;
  String vendorSiteTelephoneNumber;
  String vendorSiteUniqueDescription;
  String vendorSiteUniqueWebsite;
  int vendorSiteVendor;
  int vendorSiteVendorGroup;

  PromoVendorSite({
    this.abuser,
    this.id,
    this.vendorSiteAddress,
    this.vendorSiteEmail,
    this.vendorSiteImage,
    this.vendorSiteLatitude,
    this.vendorSiteLongitude,
    this.vendorSiteName,
    this.vendorSiteTelephoneNumber,
    this.vendorSiteUniqueDescription,
    this.vendorSiteUniqueWebsite,
    this.vendorSiteVendor,
    this.vendorSiteVendorGroup,
  });

  factory PromoVendorSite.fromJson(Map<String, dynamic> json) => PromoVendorSite(
    abuser: List<int>.from(json["abuser"].map((x) => x)),
    id: json["id"],
    vendorSiteAddress: json["vendor_site_address"],
    vendorSiteEmail: json["vendor_site_email"],
    vendorSiteImage: json["vendor_site_image"],
    vendorSiteLatitude: json["vendor_site_latitude"].toDouble(),
    vendorSiteLongitude: json["vendor_site_longitude"].toDouble(),
    vendorSiteName: json["vendor_site_name"],
    vendorSiteTelephoneNumber: json["vendor_site_telephone_number"],
    vendorSiteUniqueDescription: json["vendor_site_unique_description"],
    vendorSiteUniqueWebsite: json["vendor_site_unique_website"],
    vendorSiteVendor: json["vendor_site_vendor"],
    vendorSiteVendorGroup: json["vendor_site_vendor_group"],
  );

  Map<String, dynamic> toJson() => {
    "abuser": List<dynamic>.from(abuser.map((x) => x)),
    "id": id,
    "vendor_site_address": vendorSiteAddress,
    "vendor_site_email": vendorSiteEmail,
    "vendor_site_image": vendorSiteImage,
    "vendor_site_latitude": vendorSiteLatitude,
    "vendor_site_longitude": vendorSiteLongitude,
    "vendor_site_name": vendorSiteName,
    "vendor_site_telephone_number": vendorSiteTelephoneNumber,
    "vendor_site_unique_description": vendorSiteUniqueDescription,
    "vendor_site_unique_website": vendorSiteUniqueWebsite,
    "vendor_site_vendor": vendorSiteVendor,
    "vendor_site_vendor_group": vendorSiteVendorGroup,
  };
}


