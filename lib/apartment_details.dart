import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ApartmentDetails extends StatefulWidget {
  const ApartmentDetails({Key? key}) : super(key: key);

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

class _ApartmentDetailsState extends State<ApartmentDetails> {
  Color _color = Color.fromRGBO(206, 206, 206, 5);
  late bool _alreadySaved = false;
  Widget _Service_item(
      {required String ServiceName,
      required Color color,
      required String image}) {
    return InkWell(
      onTap: () {
        setState(() {
          color = Color.fromRGBO(255, 215, 0, 5);
        });
      },
      child: Container(
        width: 90.0,
        height: 100.0,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Column(
          children: [
            Image.asset(image, color: Colors.black),
            Text(ServiceName, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      if (!snapshot.hasData) {
        return Scaffold(
            bottomSheet: Container(

              width: double.infinity,
              height: 100,
              child: Row(

                children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                  " € 150 Night",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.normal),
              ),
                ),

                  Padding(
                    padding: const EdgeInsets.only(left: 115),
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
                        Navigator.pushReplacementNamed(context, "");
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
                            "Appartment name",
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
                            onPressed: () {
                              setState(() {
                                _alreadySaved = !_alreadySaved;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "144 Street Dusseldorf, Germany",
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
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, "
                        "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
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
                      margin: EdgeInsets.only(top: 20),
                      height: 80,
                      child: ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (_, i) => _Service_item(
                            ServiceName: "cleaning",
                            color: _color,
                            image: "assets/images/cleaningIcon.png"),
                        scrollDirection: Axis.horizontal,
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
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        " 4 Rooms",
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
                        " € 150 Night",
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
}
