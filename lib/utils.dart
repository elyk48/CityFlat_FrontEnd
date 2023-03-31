import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static void showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }

  static Map<String, String> authorizationHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  static Future<dynamic> refreshCurrentPage(
      BuildContext context, Widget widget) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
    );
  }

  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy - HH:mm').format(date);
  }

  
}
