import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

import '../utils.dart';
import 'dart:convert';

class ReservationController {

  static Future<http.Response> getMyReservations(
      String token) async {
    var url = Uri.http(baseUrl, "/user/reservations/getallmy");
    return await http.get(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }

  static Future<http.Response> CreateReservation(String OrderId,String  cardNumber, String exp_month,String exp_year,String cvc, String token ) async {
    var url = Uri.http(baseUrl, "/user/reservations/addReservation");
    Map<String, dynamic> ReservationData = {
      "Order": {
        "id": OrderId

      },
      "Card": {

        "number": cardNumber,
        "exp_month": exp_month,
        "exp_year": exp_year,
        "cvc": cvc,

      }
    };

    return await http.post(
      url,
      headers: Utils.authorizationHeaders(token),
      body: json.encode(ReservationData),
    );
  }







  static Future<http.Response> getOneReservations(
      String token,String reservationId) async {
    var url = Uri.http(baseUrl, "/user/reservations/getOne/"+reservationId);
    return await http.get(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }


  static Future<http.Response> UserDelcineOrder(
      String token,String orderId) async {


    var url = Uri.http(baseUrl, "/user/order/userDecline/"+orderId);
    return await http.delete(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }

}