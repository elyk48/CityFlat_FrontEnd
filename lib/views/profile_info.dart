import 'package:flutter/material.dart';

class Profile_info extends StatelessWidget {
  final String _id;
  final String _username;
  final String _email;
  final String _number;
  final String _address;
  final String _BirthDate;
  final String _image;

  const Profile_info(this._id, this._image, this._username, this._email,
      this._number, this._address, this._BirthDate);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 110,
            child: CircleAvatar(
              radius: 108,
              backgroundImage: AssetImage('assets/images/appart2.jpg'),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            _username,
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(30),
          elevation: 20,
          color: Color.fromRGBO(8, 31, 31, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      "Email ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 45),
                    child: Text(
                      _email,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Divider(
                  color: Colors.white70,
                  thickness: 0.75,
                  indent: 1,
                  endIndent: 1,
                  height: 20,
                ),
              ),

              Row(
                children: [
                  Container(
                    child: Text(
                      "Phone ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text(
                        _number,
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
