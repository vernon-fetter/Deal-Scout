import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int count;
  DescriptionColumns descriptionColumns;
  List<int> ids;
  LabelColumns labelColumns;
  List<String> listColumns;
  String listTitle;
  List<String> orderColumns;
  List<Result> result;

  User({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
  String active;
  String changed;
  String changedBy;
  String changedOn;
  String created;
  String createdBy;
  String createdOn;
  String email;
  String failLoginCount;
  String firstName;
  String lastLogin;
  String lastName;
  String loginCount;
  String password;
  String roles;
  String seclevel;
  String userInterests;
  String userVendor;
  String userVendorSite;
  String username;

  LabelColumns({
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

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
    active: json["active"],
    changed: json["changed"],
    changedBy: json["changed_by"],
    changedOn: json["changed_on"],
    created: json["created"],
    createdBy: json["created_by"],
    createdOn: json["created_on"],
    email: json["email"],
    failLoginCount: json["fail_login_count"],
    firstName: json["first_name"],
    lastLogin: json["last_login"],
    lastName: json["last_name"],
    loginCount: json["login_count"],
    password: json["password"],
    roles: json["roles"],
    seclevel: json["seclevel"],
    userInterests: json["user_interests"],
    userVendor: json["user_vendor"],
    userVendorSite: json["user_vendor_site"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "changed": changed,
    "changed_by": changedBy,
    "changed_on": changedOn,
    "created": created,
    "created_by": createdBy,
    "created_on": createdOn,
    "email": email,
    "fail_login_count": failLoginCount,
    "first_name": firstName,
    "last_login": lastLogin,
    "last_name": lastName,
    "login_count": loginCount,
    "password": password,
    "roles": roles,
    "seclevel": seclevel,
    "user_interests": userInterests,
    "user_vendor": userVendor,
    "user_vendor_site": userVendorSite,
    "username": username,
  };
}

class Result {
  bool active;
  DescriptionColumns changed;
  dynamic changedBy;
  DateTime changedOn;
  DescriptionColumns created;
  dynamic createdBy;
  DateTime createdOn;
  String email;
  int failLoginCount;
  String firstName;
  DateTime lastLogin;
  String lastName;
  int loginCount;
  String password;
  List<Role> roles;
  dynamic seclevel;
  List<dynamic> userInterests;
  dynamic userVendor;
  List<dynamic> userVendorSite;
  String username;

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    active: json["active"],
    changed: DescriptionColumns.fromJson(json["changed"]),
    changedBy: json["changed_by"],
    changedOn: DateTime.parse(json["changed_on"]),
    created: DescriptionColumns.fromJson(json["created"]),
    createdBy: json["created_by"],
    createdOn: DateTime.parse(json["created_on"]),
    email: json["email"],
    failLoginCount: json["fail_login_count"],
    firstName: json["first_name"],
    lastLogin: DateTime.parse(json["last_login"]),
    lastName: json["last_name"],
    loginCount: json["login_count"],
    password: json["password"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    seclevel: json["seclevel"],
    userInterests: List<dynamic>.from(json["user_interests"].map((x) => x)),
    userVendor: json["user_vendor"],
    userVendorSite: List<dynamic>.from(json["user_vendor_site"].map((x) => x)),
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "changed": changed.toJson(),
    "changed_by": changedBy,
    "changed_on": changedOn.toIso8601String(),
    "created": created.toJson(),
    "created_by": createdBy,
    "created_on": createdOn.toIso8601String(),
    "email": email,
    "fail_login_count": failLoginCount,
    "first_name": firstName,
    "last_login": lastLogin.toIso8601String(),
    "last_name": lastName,
    "login_count": loginCount,
    "password": password,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    "seclevel": seclevel,
    "user_interests": List<dynamic>.from(userInterests.map((x) => x)),
    "user_vendor": userVendor,
    "user_vendor_site": List<dynamic>.from(userVendorSite.map((x) => x)),
    "username": username,
  };
}

class Role {
  int id;
  String name;
  List<int> permissions;
  List<int> user;

  Role({
    this.id,
    this.name,
    this.permissions,
    this.user,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    permissions: List<int>.from(json["permissions"].map((x) => x)),
    user: List<int>.from(json["user"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "permissions": List<dynamic>.from(permissions.map((x) => x)),
    "user": List<dynamic>.from(user.map((x) => x)),
  };
}
