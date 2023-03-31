import 'dart:convert';

import 'package:cityflat/entities/user_e.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

import '../utils.dart';

class UserController {

  //login user
  static Future<http.Response> loginUser(String? email ,String? password) async {
    var url = Uri.http(baseUrl, "/user/login");
    Map<String, dynamic> userData = {
      "email": email,
      "password": password,
    };

    return await http.post(
      url,
      headers: Utils.headers,
      body: json.encode(userData),
    );
  }


  static Future<http.Response> registerUser(UserE user) async {
    var url = Uri.http(baseUrl, "/user/register");
    return await http.post(
      url,
      headers: Utils.headers,
      body: json.encode(user),
    );
  }


}
