import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dealbuddy/models/vendorGroupModel.dart';
import 'package:dealbuddy/methods/accessTokenMethod.dart';
import 'package:dealbuddy/variables.dart';

// Author: VC Fetter

Future<VendorGroupModel> getVendorGroup() async {
  var accessToken = await postAuthorization();
  String link =
      "${backendAddress}api/v1/vendorgroup/";
  final response = await http
      .get(Uri.encodeFull(link), headers: {"Content-Type": "application/json",
    "Authorization": "Bearer ${accessToken.accessToken}"},
  );
  print(response.body);
  return vendorGroupModelFromJson(response.body);
}