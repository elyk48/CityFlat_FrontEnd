import 'dart:convert';

import 'package:cityflat/entities/user_e.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

import '../utils.dart';

class ApartmentController {
  static Future<http.Response> fetchAparts(String token) async {
    Uri url = Uri.http(baseUrl, "/appartments/getAllAppart");
    http.Response response = await http.get(
      url,
      headers: Utils.authorizationHeaders(token),
    );
    return response;
  }

}
