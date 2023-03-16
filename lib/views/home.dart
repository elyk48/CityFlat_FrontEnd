import 'package:flutter/material.dart';
import 'appartment_info.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SfRangeValues _values = const SfRangeValues(40, 80);

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
                      child: Text("Filters",style:
                        TextStyle(
                          color: Colors.white,
                          fontFamily: 'alethiapro',
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                        ),


                      ),
                    ),

                Container(
                  margin: EdgeInsets.only(top: 2,bottom: 50),
                  alignment: Alignment.topCenter,
                  child: Divider(
                    color: Colors.white70,
                    thickness: 3,
                    indent: 0.6,
                    endIndent: 0.5,
                    height: 10,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text("Price range",style:
                  TextStyle(
                    color: Colors.white,
                    fontFamily: 'alethiapro',
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SfRangeSlider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.amber,

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
          color: Color.fromRGBO(255, 215, 0,5),
          ),
                    minimumSize: Size(120, 50),
                    backgroundColor: Colors.black87,
                    elevation: 3,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, "/navBottom");
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
              width: 400,
              height: 60,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 5, 0),
                    child: TextButton(
                      child: Text(
                        "STANDARD",
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          AppartmentInfo(
              "1231455ffxtx",
              'assets/images/appartment.jpg',
              'Tokyo Appartment',
              "the best and most comfortable appartment in the building",
              "19/02/2023",
              "24/02/2023",
              150.0,
              "berlin",
              4,
              4.5),
          AppartmentInfo(
              "1231455ffxtx",
              'assets/images/appart2.jpg',
              'China Appartment',
              "A beautiful cosy modern chamber , well organized and makes you feel home. ",
              "19/02/2023",
              "24/02/2023",
              150.0,
              "berlin",
              4,
              3.5),
          AppartmentInfo(
              "1231455ffxtx",
              'assets/images/modernAppartment.jpg',
              'Modern Appartment',
              "A charming modern appartment , well organized. ",
              "19/02/2023",
              "24/02/2023",
              150.0,
              "berlin",
              4,
              4.7),
        ],
      ),
    );
  }
}
