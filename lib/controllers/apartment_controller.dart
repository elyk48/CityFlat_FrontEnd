import 'dart:convert';

import 'package:cityflat/entities/user_e.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

import '../utils.dart';

class ApartmentController {
  static Future<http.Response> fetchAparts(String token) async {
    Uri url = Uri.http(baseUrl, "/appartments/all/getAllAppart");
    http.Response response = await http.get(
      url,
      headers: Utils.authorizationHeaders(token),
    );
    return response;
  }

  static Future<http.Response> fetchApartsFilter(Map<String, dynamic> data ) async {

print("data passed " +data.toString());
    Uri url = Uri.http(baseUrl, "/searchApart/filter");
    http.Response response = await http.post(
      url,
      headers: Utils.headers,
      body: json.encode(data),
    );
    return response;
  }




  static Future<http.Response> getAllServices() async {
    Uri url = Uri.http(baseUrl, "/user/service/getAllServices");
    http.Response response = await http.get(
      url,
      headers: Utils.headers,
    );
    return response;
  }



  static Future<http.Response> getOneApartment(String id) async {
    Uri url = Uri.http(baseUrl, "/user/appartments/"+id);
    http.Response response = await http.get(
      url,
      headers: Utils.headers,
    );
    return response;
  }

  static Future<http.Response> FilterByname(String text) async {
    Uri url = Uri.http(baseUrl, "/searchApart/"+text);
    http.Response response = await http.get(
      url,
      headers: Utils.headers,
    );
    return response;
  }


  static Future<http.Response> FilterByType(String type) async {
    Uri url = Uri.http(baseUrl, "/searchApart/type/"+type);
    http.Response response = await http.get(
      url,
      headers: Utils.headers,
    );
    return response;
  }
  static Future<http.Response> FilterByPrice(  double  price) async {
    Uri url = Uri.http(baseUrl, "/searchApart/byPrice"+price.toString());
    http.Response response = await http.get(
      url,
      headers: Utils.headers,
    );
    return response;
  }



}
