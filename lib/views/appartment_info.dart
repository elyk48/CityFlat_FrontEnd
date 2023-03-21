import 'package:flutter/material.dart';

class AppartmentInfo extends StatefulWidget {
  final String _id;
  final String _image;
  final String _name;
  final String _description;
  final double _pricePerNight;
  final String _FromDate;
  final String _ToDate;
  final String _Location;
  final int _rooms;
  final double _rate;

  const AppartmentInfo(
      this._id,
      this._image,
      this._name,
      this._description,
      this._FromDate,
      this._ToDate,
      this._pricePerNight,
      this._Location,
      this._rooms,
      this._rate);

  @override
  State<AppartmentInfo> createState() => _AppartmentInfoState();
}

class _AppartmentInfoState extends State<AppartmentInfo> {
  bool _alreadySaved = false;
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


              Navigator.pushReplacementNamed(context, "");
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
                    height: 300,
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
