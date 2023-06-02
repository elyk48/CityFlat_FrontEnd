import 'dart:convert';
import 'dart:ffi';

import 'package:cityflat/controllers/apartment_controller.dart';
import 'package:cityflat/entities/user_e.dart';
import 'package:cityflat/session.dart';
import 'package:cityflat/splash_screen.dart';
import 'package:flutter/material.dart';
import '../entities/apartment_e.dart';
import 'appartment_info.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();


}



class _HomePageState extends State<HomePage> {
   late Future<bool> fetchedAparts =Future.value(false);
   bool _shouldReloadData = false;
  UserE user = new UserE.noarg();
String searchTxt ="";
   List<Apartment> _apparts = [];

   //fetch aparts with filter
   Future<List<Apartment>> fetchApartsByfilter() async {
     await Session.getUser_from_prefs(user).then((value) => user = value);

     List<dynamic> aparts=[];
     Map<String, dynamic> data={

       "minPrice":double.parse(_values.start.toString()),
       "maxPrice":double.parse(_values.end.toString()),
       "rooms":dropdownValue,


     };
     await ApartmentController.fetchApartsFilter(data).then((value) async {

       aparts = json.decode(value.body);

     });

     List<Apartment> _apparts = [];

     for (int i = 0; i < aparts.length; i++) {
       setState(() {
         Map<String, dynamic> apartment = aparts[i];
         print(apartment.toString());
         _apparts.add(Apartment.Booked(
           apartment["id"],
           apartment["name"],
           apartment["description"],
           apartment["pricePerNight"].toDouble() ,


           apartment["type"],
           apartment["location"],
           apartment["rooms"],
           apartment["img"],
         ));
       });

     }
     //print("aparts inside the function : "+ _apparts.toString());

     return _apparts;
   }

   Future<List<Apartment>> fetchApartsByType(String type) async {
     await Session.getUser_from_prefs(user).then((value) => user = value);

     List<dynamic> aparts=[];

     await ApartmentController.FilterByType(type).then((value) async {

       aparts = json.decode(value.body);

     });

     List<Apartment> _apparts = [];

     for (int i = 0; i < aparts.length; i++) {
       setState(() {
         Map<String, dynamic> apartment = aparts[i];
         print(apartment.toString());
         _apparts.add(Apartment.Booked(
           apartment["id"],
           apartment["name"],
           apartment["description"],
           apartment["pricePerNight"].toDouble() ,


           apartment["type"],
           apartment["location"],
           apartment["rooms"],
           apartment["img"],
         ));
       });

     }
     //print("aparts inside the function : "+ _apparts.toString());

     return _apparts;
   }

   Future<List<Apartment>> fetchApartsByName() async {
     await Session.getUser_from_prefs(user).then((value) => user = value);

     List<dynamic> aparts = [];


     // Call the FilterByname function with the desired text value
     await ApartmentController.FilterByname(searchTxt).then((value) async {
       aparts = json.decode(value.body);
     });

     List<Apartment> _apparts = [];

     for (int i = 0; i < aparts.length; i++) {
       setState(() {
         Map<String, dynamic> apartment = aparts[i];
         print(apartment.toString());
         _apparts.add(
           Apartment.Booked(
             apartment["id"],
             apartment["name"],
             apartment["description"],
             apartment["pricePerNight"].toDouble(),
             apartment["type"],
             apartment["location"],
             apartment["rooms"],
             apartment["img"],
           ),
         );
       });
     }

     return _apparts;
   }
   Future<List<Apartment>> fetchAparts() async {
     await Session.getUser_from_prefs(user).then((value) => user = value);

     List<dynamic> aparts=[];
     await ApartmentController.fetchAparts(user.token).then((value) async {
       aparts = json.decode(value.body);
     });

     List<Apartment> _apparts = [];

     for (int i = 0; i < aparts.length; i++) {
       setState(() {
         Map<String, dynamic> apartment = aparts[i];
         _apparts.add(Apartment.Booked(
           apartment["id"],
           apartment["name"],
           apartment["description"],
           apartment["pricePerNight"].toDouble() ,


           apartment["type"],
           apartment["location"],
           apartment["rooms"],
           apartment["img"],
         ));
       });

     }

     return _apparts;
   }



  @override
void initState()   {
    setState(() {
      fetchAparts().then((value) => {
        setState(() {
          _apparts=value;
        }),

      });



    });

    super.initState();
  }


   @override
   void didUpdateWidget(HomePage oldWidget) {
     super.didUpdateWidget(oldWidget);
     if (_shouldReloadData) {
       setState(() {
           fetchAparts().then((value) {
             _apparts=value;
           });
         _shouldReloadData = false;
       });
     }
   }



  SfRangeValues _values = const SfRangeValues(40, 80);
  int dropdownValue = 1;
  var  is_hovered=false;

  Future<void> _bottomSheet(BuildContext context) async {
    showModalBottomSheet(
      elevation: 40,
      isDismissible: true,
      enableDrag: true,
      context: context,
      backgroundColor: Colors.black,
      constraints: BoxConstraints(
        maxHeight: 450,
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
            width: 600,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Filters",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2, bottom: 50),
                  alignment: Alignment.topCenter,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                    indent: 0.6,
                    endIndent: 0.5,
                    height: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Text(
                    "Price range",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SfRangeSlider(
                    activeColor: Colors.white,
                    inactiveColor: Color.fromRGBO(255, 215, 0, 5),
                    shouldAlwaysShowTooltip: true,
                    min: 0,
                    max: 2000,
                    values: _values,
                    interval: 20,
                    onChanged: (SfRangeValues value) {
                      setState(() {
                        _values = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50,left: 20),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                     Text(
                          "Rooms",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                          ),
                        ),
         SizedBox(

           width: 20,
         ),
                      DropdownButton<int>(
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        focusColor: Colors.white,
                        elevation: 10,
                        dropdownColor: Colors.black,
                        iconSize: 40,
                        // Step 3.
                        value: dropdownValue,
                        // Step 4.
                        items: <int>[1, 2, 3, 4, 5]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),

                    ],

                  ),
                ),



                ElevatedButton(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 2,
                      color: Color.fromRGBO(255, 215, 0, 5),
                    ),

                    backgroundColor: Colors.black87,
                    elevation: 3,
                  ),
                  onPressed: () async {
                    

                   await fetchApartsByfilter().then((value) => {

                      setState(() {
                        _apparts=value;
                      }),

                    });

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    late bool _hoverd = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        excludeHeaderSemantics: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 125,
        titleSpacing: 1,
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: TextField(
                  onSubmitted: (value) async {
                    await fetchApartsByName().then((value) => {

                      setState(() {
                        _apparts=value;
                      }),

                    });

                  },
                  onChanged: (value) {
    setState(() {
      searchTxt=value;

    });

                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      iconColor: Colors.black,
                      prefixIcon: Icon(
                        Icons.search_sharp,
                        size: 33,
                        color: Colors.black87,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.filter_list_rounded),
                        color: Colors.black87,
                        onPressed: () async {
                          await _bottomSheet(context);
                        },
                        iconSize: 30,
                      ),
                      focusColor: Colors.greenAccent,
                      hintText: "Search..."),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 400,
              height: 60,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 5, 0),
                    child: MouseRegion(

                      onHover: (event) {
                        setState(() {
                          is_hovered=true;

                        });

                      },
                      onExit: (event) {

                        setState(() {
                          is_hovered=false;

                        });
                      },

                      child: TextButton(

                        child: Text(
                          "STANDARD",
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal,
                            color: is_hovered
                                ? Color.fromRGBO(255, 215, 0, 5) : Colors.white,
                          ),
                        ),
                        onPressed: () async {

                          await fetchApartsByType("STANDARD").then((value) => {

                            setState(() {
                              _apparts=value;
                            }),

                          });
                          
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 5, 0),
                    child: TextButton(
                      child: Text(
                        "PREMIUM",
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      onPressed: () async {

                        await fetchApartsByType("PREMIUM").then((value) => {

                          setState(() {
                            _apparts=value;
                          }),

                        });

                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: TextButton(
                      child: Text(
                        "LUXURY",
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      onPressed: () async {

                        await fetchApartsByType("LUXURY").then((value) => {

                          setState(() {
                            _apparts=value;
                          }),

                        });

                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body:FutureBuilder(

        future: fetchedAparts,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: _apparts.length,
              itemBuilder: (BuildContext context,int index) {


                if (index < _apparts.length) {
                  return AppartmentInfo.Nog(
                    _apparts[index].id,
                    "assets/images/appartment.jpg",
                    _apparts[index].name,
                    _apparts[index].description,
                    _apparts[index].pricePerNight,
                    _apparts[index].location,
                    _apparts[index].rooms,
                    4.4,
                  );
                } else {
                  return Container(
alignment: Alignment.center,
                    child: Text("NO RESULTS",style: TextStyle(
                        fontSize: 21,
                        fontFamily: 'alethiapro',
                        fontWeight: FontWeight.normal,
                        color: Colors.black),),
                  ); // Placeholder widget if index is out of range
                }
              },
            );
          }
          else {
            return  LinearProgressIndicator(
              value: 10,
              color: Colors.red, //<-- SEE HERE
              backgroundColor: Colors.red, //<-- SEE HERE
            );
          }
        },
      ),

    );
  }
}



