import 'dart:convert';
import 'dart:io';

import 'package:cityflat/entities/user_e.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

import '../entities/order_e.dart';
import '../entities/service_e.dart';
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

  static Future<http.Response> updateUser(String name, String email, String number, String address, String birthdate, String token, String userId, File? image) async {
    var request = http.MultipartRequest('PUT', Uri.http(baseUrl, "/user/$userId"));

    // Add other form fields
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['number'] = number;
    request.fields['address'] = address;
    request.fields['birthdate'] = birthdate;

    // Add the image file if available
    if (image != null) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();

      var multipartFile = http.MultipartFile('img', stream, length, filename: image.path);
      request.files.add(multipartFile);
    }

    request.headers.addAll(Utils.authorizationHeaders(token));

    var response = await request.send();
    return await http.Response.fromStream(response);
  }

  static Future<http.Response> getMyOrders(
      UserE user) async {
    var url = Uri.http(baseUrl, "/user/orders/GetallUO");
    return await http.get(
      url,
      headers: Utils.authorizationHeaders(user.token),

    );
  }

  static Future<http.Response> getMyReservations(
      UserE user, String token) async {
    var url = Uri.http(baseUrl, "/user/reservations/getallmy");
    return await http.get(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }



  //create order
  static Future<http.Response?> CreateOrder(double totalprice, String description, String checkin, String checkout, double serviceFees, double nightfees, String token, String apartId, String UserId,List<String> services ) async {
    var url = Uri.http(baseUrl, "/user/reservations/createOrder");

    Map<String, dynamic> body = {
      "User": UserId,
      "totalPrice": totalprice,
      "description": description,
      "checkIn": checkin,
      "checkOut": checkout,
      "servicesFee": serviceFees,
      "nightsFee": nightfees,
      "appartment": apartId,
      "services" : services,
    };

    try {
      final response = await http.post(
        url,
        headers: Utils.authorizationHeaders(token),
        body: json.encode(body),
      );

      return response;
    } catch (e) {
      print('Error creating order: $e');
      return null; // Return null or an appropriate value to handle the error.
    }
  }
//notifciationsa
  static Future<http.Response> getMyNotifications(
      String token) async {
    var url = Uri.http(baseUrl, "/user/notifications/usernotif");
    return await http.get(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }
  static Future<http.Response> MarkNotifcationAsRead(
     String NotId , String token) async {

    Map<String, dynamic> NotificationData = {
      "read":true,
    };
    var url = Uri.http(baseUrl, "/user/notifications/"+NotId);
    return await http.put(
      url,
      headers: Utils.authorizationHeaders(token),
      body: json.encode(NotificationData),
    );
  }


  static Future<http.Response> DeleteAllNotifications(
      String token) async {


    var url = Uri.http(baseUrl, "/user/notifications/usernotif");
    return await http.delete(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }

  static Future<http.Response> DeleteOneNotification(
     String NotId, String token) async {


    var url = Uri.http(baseUrl, "/user/notifications/"+NotId);
    return await http.delete(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }


  //wishlist

  static Future<http.Response> addToWishList(
      String apartId , String token) async {


    var url = Uri.http(baseUrl, "/user/wishlist/"+apartId);
    return await http.put(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }

  static Future<http.Response> removeFromWishList(
      String apartId , String token) async {


    var url = Uri.http(baseUrl, "/user/rmwishlist/"+apartId);
    return await http.put(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }

  static Future<http.Response> ListWishlist(
      String token ) async {
    var url = Uri.http(baseUrl, "/user/wishlist/list");
    return await http.get(
      url,
      headers: Utils.authorizationHeaders(token),

    );
  }


}
