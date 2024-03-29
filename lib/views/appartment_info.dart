import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/apartment_controller.dart';
import '../controllers/user_controller.dart';
import '../entities/apartment_e.dart';
import '../entities/service_e.dart';

class AppartmentInfo extends StatefulWidget {
  final String _id;
  final String _image;
  final String _name;
  final String _description;
  final double _pricePerNight;
  late Apartment _apartment;

  final String _Location;
  final int _rooms;
  final double _rate;


   AppartmentInfo.Nog(


      this._id,
      this._image,
      this._name,
      this._description,

      this._pricePerNight,
      this._Location,
      this._rooms,
      this._rate);


  AppartmentInfo(
      this._id,
      this._image,
      this._name,
      this._description,
      this._pricePerNight,
      this._apartment,
      this._Location,
      this._rooms,
      this._rate);

  @override
  State<AppartmentInfo> createState() => _AppartmentInfoState();
}

class _AppartmentInfoState extends State<AppartmentInfo> {
  bool _alreadySaved = false;
  late Map<String,dynamic> ApartFromServ;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Container(
        width: 700,
        height: 480,
        margin: EdgeInsets.all(3),
        child: Card(
          shadowColor: Colors.black,

          semanticContainer: true,
          color: Colors.black, //Color.fromRGBO(8, 31, 31, 5).withOpacity(0.1),
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: InkWell(
            onTap: () async{
              var _prefs =  await SharedPreferences.getInstance();
             await ApartmentController.getOneApartment(widget._id).then((value) => {
setState((){

  ApartFromServ=jsonDecode(value.body);
})


              });
              List<service> _services =[];



              Navigator.pushReplacementNamed(context, "/appartmentDetails",arguments: [
                ApartFromServ,

              ]);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                      bottom: Radius.circular(20.0)),
                  child: Image.asset(
                    widget._image,
                    width: 500,
                    height: 250,
                  ),
                ),

                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,top: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget._name,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 120,bottom: 10,right: 10),
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_sharp,
                          size: 40,
                          color: _alreadySaved ? Colors.red : Colors.grey,
                        ),
                        onPressed: () async {
                          var prefs = await SharedPreferences.getInstance();
                          String? token = prefs.getString("user_token");
                          setState(() {
                            _alreadySaved = !_alreadySaved;
                          });

                          if (_alreadySaved) {
                            // Add apartment to wishlist
                            if (token != null) {
                              UserController.addToWishList(widget._id, token);
                            } else {
                              // Handle null token case
                              // Show an error message or perform appropriate action
                            }
                          } else {
                            // Remove apartment from wishlist
                            if (token != null) {
                              UserController.removeFromWishList(widget._id, token);
                            } else {
                              // Handle null token case
                              // Show an error message or perform appropriate action
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 13, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget._description,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(206, 206, 206, 5),
                        fontFamily: 'alethiapro',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12, bottom: 12),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 22),
                      Text(
                        widget._rate.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'alethiapro',
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "\$" + " " + widget._pricePerNight.toString() + " ",
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: 'alethiapro',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white70,
                  thickness: 0.75,
                  indent: 1,
                  endIndent: 1,
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
