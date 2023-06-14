import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cityflat/entities/order_e.dart';
import 'package:cityflat/entities/user_e.dart';
import 'package:cityflat/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/user_controller.dart';
import 'entities/apartment_e.dart';
import 'entities/service_e.dart';
import 'package:http/http.dart' as http;

class ApartmentDetails extends StatefulWidget {
  late Apartment _apartment;

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

final List<String> imagesList = [
  'assets/images/appart2.jpg',
  'assets/images/appartment.jpg',
  'assets/images/modernAppartment.jpg',
];
Future<bool> getApartmentInfo() async {
  return true;
}

class Multi_select extends StatefulWidget {
  late List<String> items = [];

  Multi_select(this.items);

  @override
  State<Multi_select> createState() => _Multi_selectState();
}

class _Multi_selectState extends State<Multi_select> {
  final List<String> _selectedItems = [];
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select services',style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'alethiapro',
          fontWeight: FontWeight.normal)),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
            activeColor: Colors.black,
                    value: _selectedItems.contains(item),
                    title: Text(item, style: TextStyle(

                        color: Colors.black,
                        fontFamily: 'alethiapro',
                        fontWeight: FontWeight.normal),),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: _cancel,
            child: const Text(
              'Cancel',
                style: TextStyle(

                    color: Colors.black,
                    fontFamily: 'alethiapro',
                    fontWeight: FontWeight.normal),
            )),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit', style: TextStyle(

              color: Colors.white,
              fontFamily: 'alethiapro',
              fontWeight: FontWeight.normal),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  Color _color = Color.fromRGBO(206, 206, 206, 5);
  late bool _alreadySaved = false;
  List<String> _SelectedItems = [];
  void _showMultiSelect() async {
    final List<String> items = [];
    widget._apartment.services.forEach((element) {
      setState(() {
        items.add(element.name);
      });
    });
    final List<String> results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Multi_select(items);
        });

    if (results != null) {
      setState(() {
        _SelectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    if (ModalRoute.of(context)?.settings.arguments != null) {
      final List<Map<String, dynamic>> dataList = ModalRoute.of(context)!
          .settings
          .arguments as List<Map<String, dynamic>>;

      // Now you can access the first element of the list like this:
      final Map<String, dynamic> data = dataList[0];

      widget._apartment = Apartment(
        data['id'],
        data['name'],
        data['description'],
        data['pricePerNight'].toDouble(),
        [],
        [],
        data['type'],
        data['location'],
        data['rooms'],
        data['img'],
        data['rating'] != null ? data['rating'].toDouble() : 0.0,
      );

      // Populate the services list
      List<dynamic> servicesData = data['services'];
      List<service> services = [];
      for (int i = 0; i < servicesData.length; i++) {
        Map<String, dynamic> serviceData = servicesData[i];

        service serviceObj = service(
          serviceData['_id'],
          serviceData['name'],
          serviceData['description'],
          serviceData['pricePerNight'].toDouble(),
          serviceData['img'],
        );
        setState(() {
          services.add(serviceObj);
        });
      }
      setState(() {
        widget._apartment.services = services;
      });
    }
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      if (!snapshot.hasData) {
        var dropdownValue;
        return Scaffold(
            bottomSheet: Container(
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "€ " +
                          widget._apartment.pricePerNight.toString() +
                          " Night",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'alethiapro',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: ElevatedButton(
                      child: Text(
                        "Book",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'alethiapro',
                          fontWeight: FontWeight.normal,
                          fontSize: 22,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Color.fromRGBO(255, 215, 0, 5),
                        minimumSize: Size(130, 50),
                        backgroundColor: Colors.white,
                        elevation: 10,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Confirmation",style: TextStyle(

                                  color: Colors.black,
                                  fontFamily: 'alethiapro',
                                  fontWeight: FontWeight.normal)),
                              content:
                                  Text("are you sure you want to prceed ?",style: TextStyle(

                                      color: Colors.black,
                                      fontFamily: 'alethiapro',
                                      fontWeight: FontWeight.normal)),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("cancel",style: TextStyle(

                                    color: Colors.black,
                                    fontFamily: 'alethiapro',
                                    fontWeight: FontWeight.normal))),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),

                                    onPressed: () async {
                                      try {
                                        UserE user = UserE.noarg();
                                        Order order = Order.noArg();
                                        order.services = [];
                                        if (_SelectedItems.isNotEmpty) {
                                          widget._apartment.services
                                              .forEach((element) {
                                            _SelectedItems.forEach((e) {
                                              if (element.name == e) {
                                                order.services.add(element);
                                              }
                                            });
                                          });
                                        }

                                        order.apartment = widget._apartment;

                                        await Session.getUser_from_prefs(user)
                                            .then((value) {
                                          order.user = value;
                                        });
                                        order.checkin = dateRange.start.toString();
                                        order.checkout = dateRange.end.toString();

                                        int nights = int.parse(dateRange
                                                .duration.inDays
                                                .toString()) -
                                            1;
                                        late double servicefee = 0;
                                        order.services.forEach((element) {
                                          servicefee += element.pricePerNight;
                                        });
                                        order.servicesFees =
                                            servicefee * nights;
                                        order.nightsFees =
                                            order.apartment.pricePerNight *
                                                nights;
                                        order.totalprice = order.servicesFees +
                                            order.nightsFees;
                                        order.user=user;

                                        order.description="Order for apartment : "+order.apartment.name.toString() +"User : "+order.user.name.toString();
                                      late List<String> ServiceIds= [];
                                      order.services.forEach((element) {

                                        ServiceIds.add(element.id);

                                      });

                                        http.Response? res ;
                                      await  UserController.CreateOrder(order.totalprice,order.description,order.checkin,order.checkout, order.servicesFees, order.nightsFees, user.token,order.apartment.id, user.id,ServiceIds)
                                            .then(
                                          (value) =>{
                                            res =value,
                                          }

                                        );

                                        if(res!.statusCode==201||res!.statusCode== 200){



                                          Navigator.pushReplacementNamed(context,"/navBottom");
                                        }
                                        else{
                                     print(res!.body.toString());

                                        }

                                      } catch (err) {
                                        print(err.toString());
                                      }
                                    },
                                    child: Text("confirm"))
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: BorderDirectional(
                    top: BorderSide(
                      color: Colors.white,
                      width: 0.8,
                    ),
                  )),
            ),
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: BackButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/navBottom");
                },
                color: Colors.white, // <-- SEE HERE
              ),
            ),
            body: ListView(
              children: [
                Container(
                  color: Colors.black,
                  child: CarouselSlider(
                    items: imagesList.map((imageUrl) {
                      return Container(
                        height: 500, // adjust the height as needed
                        width: double.infinity,
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                          height: 600, // adjust the height as needed
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 280,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget._apartment.name,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30, left: 80),
                          alignment: Alignment.centerRight,
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
                                  UserController.addToWishList(widget._apartment.id, token);
                                } else {
                                  // Handle null token case
                                  // Show an error message or perform appropriate action
                                }
                              } else {
                                // Remove apartment from wishlist
                                if (token != null) {
                                  UserController.removeFromWishList(widget._apartment.id, token);
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
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget._apartment.location,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 22),
                          Text(
                            "4.5",
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
                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 40),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget._apartment.description,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white70,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Color.fromRGBO(255, 215, 0, 5),
                          minimumSize: Size(130, 50),
                          backgroundColor: Colors.white,
                          elevation: 10,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "");
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 300,
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.white.withOpacity(0.7),
                        indent: 1,
                        endIndent: 0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, left: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Choose your services",
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Color.fromRGBO(255, 215, 0, 5),
                                elevation: 6,
                                minimumSize: Size(250, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Text(
                                "Select your services",
                                  style: TextStyle(
fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'alethiapro',
                                      fontWeight: FontWeight.bold),
                              ),
                              onPressed: _showMultiSelect),
                          Divider(
                            height: 15,
                          ),
                          Wrap(
                            children: _SelectedItems.map((e) => Chip(
                                  label: Text(e),
                                )).toList(),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      width: 300,
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.white.withOpacity(0.7),
                        indent: 1,
                        endIndent: 0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Pick your dates",
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child:Column(
                                children: [
                                  Text(
                                    'Check-in', // Label for check-in date
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 6,
                                      shadowColor: Color.fromRGBO(255, 215, 0, 5),
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(180, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: Text(
                                      '${start.year}/${start.month}/${start.day}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: _pickDateRange,
                                  ),
                                ],
                              ),),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child:Column(
                                children: [
                                  Text(
                                    'Check-out', // Label for check-out date
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Color.fromRGBO(255, 215, 0, 5),
                                      elevation: 6,
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(180, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: Text(
                                      '${end.year}/${end.month}/${end.day}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: _pickDateRange,
                                  ),
                                ],
                              ),),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 5),
                      width: 300,
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.white.withOpacity(0.7),
                        indent: 1,
                        endIndent: 0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, left: 10, bottom: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget._apartment.rooms.toString() + " rooms",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 140),
                      alignment: Alignment.topLeft,
                      child: Text(
                        " € " +
                            widget._apartment.pricePerNight.toString() +
                            " Night",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      } else {
        return Scaffold();
      }
    });
  }

  void _pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light().copyWith(
              primary: Colors.black, // Customize the primary color
              onPrimary: Colors.white, // Customize the text color
            ),
            textTheme: TextTheme(
              // Customize the font style
              subtitle1:  TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'alethiapro',
                  fontWeight: FontWeight.normal)
            ),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (newDateRange == null) return; // Cancel

    setState(() {
      dateRange = newDateRange; // Save
    });
  }
}
