import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dealbuddy/models/productGroupModel.dart';
import 'package:dealbuddy/methods/accessTokenMethod.dart';
import 'package:dealbuddy/variables.dart';

// Author: VC Fetter

Future<ProductGroupModel> getProductGroup() async {
  var accessToken = await postAuthorization();
  String link =
      "${backendAddress}api/v1/productgroup/";
  final response = await http
      .get(Uri.encodeFull(link), headers: {"Content-Type": "application/json",
    "Authorization": "Bearer ${accessToken.accessToken}"},
  );
  print(response.body);
  return productGroupModelFromJson(response.body);
}