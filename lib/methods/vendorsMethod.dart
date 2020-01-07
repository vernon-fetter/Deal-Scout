import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dealbuddy/models/vendorsModel.dart';
import 'package:dealbuddy/methods/accessTokenMethod.dart';
import 'package:dealbuddy/variables.dart';

// Author: VC Fetter

Future<Vendors> getVendors() async {
  var accessToken = await postAuthorization();
  String link =
      "${backendAddress}api/v1/vendor/";
  final response = await http
      .get(Uri.encodeFull(link), headers: {"Content-Type": "application/json",
    "Authorization": "Bearer ${accessToken.accessToken}"},
  );
  return vendorsFromJson(response.body);
}
