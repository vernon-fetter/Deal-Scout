import 'dart:convert';

VendorSite vendorSiteFromJson(String str) => VendorSite.fromJson(json.decode(str));

String vendorSiteToJson(VendorSite data) => json.encode(data.toJson());

class VendorSite {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<Result> result;

  VendorSite({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory VendorSite.fromJson(Map<String, dynamic> json) => VendorSite(
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
  String vendorSiteAddress;
  String vendorSiteEmail;
  String vendorSiteImage;
  String vendorSiteLatitude;
  String vendorSiteLongitude;
  String vendorSiteName;
  String vendorSiteTelephoneNumber;
  String vendorSiteUniqueDescription;
  String vendorSiteUniqueWebsite;
  String vendorSiteVendor;
  String vendorSiteVendorGroup;

  LabelColumns({
    this.abuser,
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

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    abuser: json["abuser"],
    vendorSiteAddress: json["vendor_site_address"],
    vendorSiteEmail: json["vendor_site_email"],
    vendorSiteImage: json["vendor_site_image"],
    vendorSiteLatitude: json["vendor_site_latitude"],
    vendorSiteLongitude: json["vendor_site_longitude"],
    vendorSiteName: json["vendor_site_name"],
    vendorSiteTelephoneNumber: json["vendor_site_telephone_number"],
    vendorSiteUniqueDescription: json["vendor_site_unique_description"],
    vendorSiteUniqueWebsite: json["vendor_site_unique_website"],
    vendorSiteVendor: json["vendor_site_vendor"],
    vendorSiteVendorGroup: json["vendor_site_vendor_group"],
  );

  Map<String, dynamic> toJson() => {
    "abuser": abuser,
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

class Result {
  List<Abuser> abuser;
  String vendorSiteAddress;
  String vendorSiteEmail;
  String vendorSiteImage;
  double vendorSiteLatitude;
  double vendorSiteLongitude;
  String vendorSiteName;
  String vendorSiteTelephoneNumber;
  String vendorSiteUniqueDescription;
  String vendorSiteUniqueWebsite;
  VendorSiteVendor vendorSiteVendor;
  VendorSiteVendorGroup vendorSiteVendorGroup;

  Result({
    this.abuser,
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    abuser: List<Abuser>.from(json["abuser"].map((x) => Abuser.fromJson(x))),
    vendorSiteAddress: json["vendor_site_address"],
    vendorSiteEmail: json["vendor_site_email"],
    vendorSiteImage: json["vendor_site_image"],
    vendorSiteLatitude: json["vendor_site_latitude"].toDouble(),
    vendorSiteLongitude: json["vendor_site_longitude"].toDouble(),
    vendorSiteName: json["vendor_site_name"],
    vendorSiteTelephoneNumber: json["vendor_site_telephone_number"],
    vendorSiteUniqueDescription: json["vendor_site_unique_description"],
    vendorSiteUniqueWebsite: json["vendor_site_unique_website"],
    vendorSiteVendor: VendorSiteVendor.fromJson(json["vendor_site_vendor"]),
    vendorSiteVendorGroup: VendorSiteVendorGroup.fromJson(json["vendor_site_vendor_group"]),
  );

  Map<String, dynamic> toJson() => {
    "abuser": List<dynamic>.from(abuser.map((x) => x.toJson())),
    "vendor_site_address": vendorSiteAddress,
    "vendor_site_email": vendorSiteEmail,
    "vendor_site_image": vendorSiteImage,
    "vendor_site_latitude": vendorSiteLatitude,
    "vendor_site_longitude": vendorSiteLongitude,
    "vendor_site_name": vendorSiteName,
    "vendor_site_telephone_number": vendorSiteTelephoneNumber,
    "vendor_site_unique_description": vendorSiteUniqueDescription,
    "vendor_site_unique_website": vendorSiteUniqueWebsite,
    "vendor_site_vendor": vendorSiteVendor.toJson(),
    "vendor_site_vendor_group": vendorSiteVendorGroup.toJson(),
  };
}

class Abuser {
  bool active;
  List<int> changed;
  int changedBy;
  DateTime changedOn;
  List<dynamic> created;
  dynamic createdBy;
  DateTime createdOn;
  String email;
  int failLoginCount;
  String firstName;
  int id;
  DateTime lastLogin;
  String lastName;
  int loginCount;
  String password;
  List<int> roles;
  int seclevel;
  List<dynamic> userInterests;
  int userVendor;
  List<int> userVendorSite;
  String username;

  Abuser({
    this.active,
    this.changed,
    this.changedBy,
    this.changedOn,
    this.created,
    this.createdBy,
    this.createdOn,
    this.email,
    this.failLoginCount,
    this.firstName,
    this.id,
    this.lastLogin,
    this.lastName,
    this.loginCount,
    this.password,
    this.roles,
    this.seclevel,
    this.userInterests,
    this.userVendor,
    this.userVendorSite,
    this.username,
  });

  factory Abuser.fromJson(Map<String, dynamic> json) => Abuser(
    active: json["active"],
    changed: List<int>.from(json["changed"].map((x) => x)),
    changedBy: json["changed_by"],
    changedOn: DateTime.parse(json["changed_on"]),
    created: List<dynamic>.from(json["created"].map((x) => x)),
    createdBy: json["created_by"],
    createdOn: DateTime.parse(json["created_on"]),
    email: json["email"],
    failLoginCount: json["fail_login_count"],
    firstName: json["first_name"],
    id: json["id"],
    lastLogin: DateTime.parse(json["last_login"]),
    lastName: json["last_name"],
    loginCount: json["login_count"],
    password: json["password"],
    roles: List<int>.from(json["roles"].map((x) => x)),
    seclevel: json["seclevel"],
    userInterests: List<dynamic>.from(json["user_interests"].map((x) => x)),
    userVendor: json["user_vendor"],
    userVendorSite: List<int>.from(json["user_vendor_site"].map((x) => x)),
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "changed": List<dynamic>.from(changed.map((x) => x)),
    "changed_by": changedBy,
    "changed_on": changedOn.toIso8601String(),
    "created": List<dynamic>.from(created.map((x) => x)),
    "created_by": createdBy,
    "created_on": createdOn.toIso8601String(),
    "email": email,
    "fail_login_count": failLoginCount,
    "first_name": firstName,
    "id": id,
    "last_login": lastLogin.toIso8601String(),
    "last_name": lastName,
    "login_count": loginCount,
    "password": password,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "seclevel": seclevel,
    "user_interests": List<dynamic>.from(userInterests.map((x) => x)),
    "user_vendor": userVendor,
    "user_vendor_site": List<dynamic>.from(userVendorSite.map((x) => x)),
    "username": username,
  };
}

class VendorSiteVendor {
  int id;
  String vendorAddress;
  String vendorDescription;
  String vendorEmail;
  int vendorGroup;
  String vendorLogo;
  String vendorName;
  String vendorTelephoneNumber;
  String vendorWebsite;

  VendorSiteVendor({
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

  factory VendorSiteVendor.fromJson(Map<String, dynamic> json) => VendorSiteVendor(
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

class VendorSiteVendorGroup {
  int id;
  String name;

  VendorSiteVendorGroup({
    this.id,
    this.name,
  });

  factory VendorSiteVendorGroup.fromJson(Map<String, dynamic> json) => VendorSiteVendorGroup(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
