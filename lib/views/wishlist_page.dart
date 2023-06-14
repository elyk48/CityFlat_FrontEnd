import 'package:cityflat/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../controllers/user_controller.dart';
import '../entities/apartment_e.dart';
import 'appartment_info.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Apartment> wishlistApartments = [];

  @override
  void initState() {
    super.initState();
    fetchWishlistApartments();
  }

  Future<void> fetchWishlistApartments() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("user_token");

    if (token != null) {
      var response = await UserController.ListWishlist(token);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Apartment> apartments =
        List<Apartment>.from(data.map((x) => Apartment.fromJson(x)));
        setState(() {
          wishlistApartments = apartments;
        });
      } else {
        print('Failed to fetch wishlist apartments: ${response.statusCode}');
      }
    } else {
      print('Token is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/navBottom');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Wishlist ', // Text indicating that this is a wishlist page
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: wishlistApartments.length,
                itemBuilder: (BuildContext context, int index) {
                  Apartment apartment = wishlistApartments[index];

                  return AppartmentInfo.Nog(
                    apartment.id,
                    "assets/images/appartment.jpg",
                    apartment.name,
                    apartment.description,
                    apartment.pricePerNight,
                    apartment.location,
                    apartment.rooms,
                    apartment.rating,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}