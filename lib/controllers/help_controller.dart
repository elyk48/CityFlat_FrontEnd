import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

import '../utils.dart';
import 'dart:convert';

class HelpController {

  static Future<http.Response> CreateHelp(String message, String token ) async {
    var url = Uri.http(baseUrl, "/help/messages/sendmessage");
    Map<String, dynamic> helpData = {
"message":message
    };

    return await http.post(
      url,
      headers: Utils.authorizationHeaders(token),
      body: json.encode(helpData),
    );
  }


  static Future<http.Response> getAllHelpMsgs(
      String token) async {
    var url = Uri.http(baseUrl, "/help/messages/getall");
    return await http.get(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }

  static Future<http.Response> getOneHelpMsg(
      String token,String param) async {
    var url = Uri.http(baseUrl, "/help/messages/getDel/"+param);
    return await http.get(
      url,
      headers:Utils.headers,

    );
  }

  static Future<http.Response> DeleteOneNotification(
      String messageId, String token) async {


    var url = Uri.http(baseUrl, "/help/messages/getDel/"+messageId);
    return await http.delete(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }
}