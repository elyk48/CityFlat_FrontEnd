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
    Map<String, dynamic> userData = {
      "name":user.name,
      "email": user.email,
      "password": user.password,
      "number":user.phoneNumber,
    };
    print("userdata : "+userData.toString());
    var url = Uri.http(baseUrl, "/user/register");
    return await http.post(
      url,
      headers: Utils.headers,
      body:  jsonEncode(userData),
    );
  }


  static Future<http.Response> VerifyUser_email(String email,int code) async {
    Map<String, dynamic> body = {
      "verificationCode":code
    };

    var url = Uri.http(baseUrl, "/user/verify/"+email);
    return await http.post(
      url,
      headers: Utils.headers,
      body:  jsonEncode(body),
    );
  }

  static Future<http.Response> ResendEmailCode(String email) async {


    var url = Uri.http(baseUrl, "/user/verify/"+email);
    return await http.get(
      url,
      headers: Utils.headers,

    );
  }

  static Future<http.Response> FetchUser(String id) async {


    var url = Uri.http(baseUrl, "/user/"+id);


    return await http.get(
      url,
      headers: Utils.headers,

    );
  }

  static Future<http.Response> updateUser(
      UserE user, String token) async {
    var url = Uri.http(baseUrl, "/user/${user.id}");
    return await http.put(
      url,
      headers: Utils.authorizationHeaders(token),
      body: json.encode(user.toJson()),
    );
  }


}
