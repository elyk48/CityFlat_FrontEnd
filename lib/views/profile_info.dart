import 'dart:convert';

import 'package:cityflat/controllers/user_controller.dart';
import 'package:cityflat/entities/user_e.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_info extends StatefulWidget {
  late String _id;
  late  String _username;
  late  String _email;
  late  String _number;
  late  String _address;
  late  String _BirthDate;
  late String _image;

   Profile_info(this._id, this._image, this._username, this._email,
      this._number, this._address, this._BirthDate);

  @override
  State<Profile_info> createState() => _Profile_infoState();
}

class _Profile_infoState extends State<Profile_info> {
  String _newUsername = '';
  String _newEmail = '';
  String _newNumber = '';
  String _newAddress = '';
  String _newBirthDate = '';
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  UserE user = new UserE.noarg();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _usernameController.text = widget._username;
    _emailController.text = widget._email;
    _numberController.text = widget._number;
    _addressController.text = widget._address;
    _BirthDateController.text = widget._BirthDate;
  }

  Future<UserE>UpdateUser(String id  ,UserE user ) async {
    late Map<String,dynamic> userFromserv;
    var prefs = await SharedPreferences.getInstance();



   await UserController.updateUser(user, prefs.getString("user_token").toString()).then((value) => {
if(value.statusCode==200){
        userFromserv=jsonDecode(value.body),
  setState(() {  user.id=userFromserv["id"];
  user.name=userFromserv["name"];
  user.email=userFromserv["email"];
  user.phoneNumber=userFromserv["number"];
  user.Birthdate=userFromserv["birthdate"];
  user.role=userFromserv["role"];
  user.address=userFromserv["address"];
  user.password=userFromserv["password"];
  user.isVerified=userFromserv["isVerified"]; })


}else {

  print("Update failed !!")
}
    });
    return user;




  }

  bool _isEditing = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _BirthDateController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  Widget _buildEditableText(
      {required String labelText,
        required TextEditingController controller,
        required bool isEditing,
        required VoidCallback onEditPressed}) {
    return Row(
      mainAxisAlignment:
      isEditing
          ? MainAxisAlignment.start:MainAxisAlignment.center,
      children: [
        isEditing
              ? Expanded(
                child: TextFormField(

    cursorColor: Colors.black,
      autofocus: false,


      style: TextStyle(
          color: Colors.black,
          fontFamily: 'alethiapro',
          fontWeight: FontWeight.normal,
          fontSize: 17),
      decoration: InputDecoration(
        alignLabelWithHint: true,

        filled: true,
        focusColor: Colors.black38,
        fillColor: Color.fromRGBO(206, 206, 206, 5),

        hintStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'AutourOne',
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        hintText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
                width: 1.5, color: Colors.black87),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
                width: 2, color: Colors.black87),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
                width: 1,
                color: Colors.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
    ),
              )
              : Text(
            controller.text,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'alethiapro',
                fontWeight: FontWeight.normal),
          ),
       _isEditing? IconButton(
         icon: Icon(Icons.cancel),
         onPressed: onEditPressed,
         color: Colors.white,
       ):
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: onEditPressed,
          color: Colors.white,
        )
      ],
    );
  }
//datepicker
  var pickeddate;

  Widget _buildEditableTextDate(
      {required String labelText,
        required TextEditingController controller,
        required bool isEditing,
        required VoidCallback onEditPressed}) {
    return Row(
      mainAxisAlignment:
      isEditing
          ? MainAxisAlignment.start:MainAxisAlignment.center,
      children: [
         Container(
           padding: _isEditing?EdgeInsets.only(left: 25):EdgeInsets.only(left: 1),
           child: Text(
            controller.text,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'alethiapro',
                fontWeight: FontWeight.normal),
        ),
         ),

        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1900, 3, 5),
                maxTime: DateTime(2026, 6, 7), onChanged: (date) {
                  print('change $date');
                  setState(() {
                    pickeddate = "${date.day}";
                  });
                }, onConfirm: (date) {
                  print('confirm $date');
                  setState(() {
                    pickeddate =
                    "Picked Date is : ${date.day}/${date.month}/${date.year}";
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en,theme: DatePickerTheme(
containerHeight: 400,

                  backgroundColor:Colors.white70,
                  headerColor:Colors.white70,

                  itemStyle: TextStyle(
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.bold,

                  color: Colors.black,
                    backgroundColor: Colors.white70,
                  ),
                  doneStyle:  TextStyle(
                      shadows: [
                        Shadow(

                          color: Color.fromRGBO(255, 215, 0, 5),
                          offset: Offset(2,2),
                        )

                      ],
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.bold),
                  cancelStyle: TextStyle(
                    shadows: [
                      Shadow(

                          color: Colors.black,
                        offset: Offset(2,2),
                      )

                    ],
                      fontSize: 25,
                      color: Color.fromRGBO(255, 215, 0, 5),
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.bold),

                ));
          },
          color: Colors.white,
        )
      ],
    );
  }

  Widget _buildEditableTextName(
      {required String labelText,
        required TextEditingController controller,
        required bool isEditing,
        required VoidCallback onEditPressed}) {
    return Row(
      mainAxisAlignment:
      isEditing
          ? MainAxisAlignment.start:MainAxisAlignment.center,
      children: [
        isEditing
            ? Expanded(
          child: TextFormField(

            cursorColor: Colors.black,
            autofocus: false,


            style: TextStyle(
                color: Colors.black,
                fontFamily: 'alethiapro',
                fontWeight: FontWeight.normal,
                fontSize: 17),
            decoration: InputDecoration(
              alignLabelWithHint: true,

              filled: true,
              focusColor: Colors.black38,
              fillColor: Color.fromRGBO(206, 206, 206, 5),

              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'AutourOne',
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              hintText: labelText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1.5, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        )
            : Text(
          controller.text,
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: 'alethiapro',
              fontWeight: FontWeight.normal),
        ),
        _isEditing? IconButton(
          icon: Icon(Icons.cancel),
          onPressed: onEditPressed,
          color: Colors.white,
        ):
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: onEditPressed,
          color: Colors.white,
        )
      ],
    );
  }

  void _onSavePressed() {
    setState(() {
      _isEditing = false;
      widget._username = _newUsername.isNotEmpty ? _newUsername : widget._username;
      widget._email = _newEmail.isNotEmpty ? _newEmail : widget._email;
      widget._number = _newNumber.isNotEmpty ? _newNumber : widget._number;
      widget._address = _newAddress.isNotEmpty ? _newAddress : widget._address;
      widget._BirthDate =
      _newBirthDate.isNotEmpty ? _newBirthDate : widget._BirthDate;
    });
    // TODO: Add code to save updated information to the database
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key:_keyForm ,
      child: ListView(
        children: [

          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(20),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 113,
                  child: CircleAvatar(
                    radius: 108,
                    backgroundImage: AssetImage('assets/images/appart2.jpg'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:Color.fromRGBO(255, 215, 0, 5),
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        // Add code to open gallery and allow user to select an image
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 28,top: 10,bottom: 70),
            alignment: Alignment.center,
            child: _buildEditableTextName(
              labelText: widget._username,

              controller:_usernameController ,
              isEditing:_isEditing ,
              onEditPressed: () {
                setState(() {
                  _isEditing=true;
                });
              },


            ),
          ),


          Column(


              children: [
                Column(

                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 53,bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                  padding:  EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      child: _buildEditableText(
                        labelText: widget._email,

                        controller:_emailController ,
                        isEditing:_isEditing ,
                        onEditPressed: () {
                          setState(() {
                            _isEditing=true;
                          });
                        },


                      ),
                    ),
                  ],
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Divider(
                    color: Colors.white70,
                    thickness: 0.75,
                    indent: 1,
                    endIndent: 1,
                    height: 20,
                  ),
                ),

                Column(

                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 53,bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Phone ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding:  EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      child: _buildEditableText(
                        labelText: widget._number,

                        controller:_numberController ,
                        isEditing:_isEditing ,
                        onEditPressed: () {
                          setState(() {
                            _isEditing=true;
                          });
                        },


                      ),
                    ),
                  ],
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.75,
                    indent: 1,
                    endIndent: 1,
                    height: 20,
                  ),
                ),

                Column(

                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 53,bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Address ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding:  EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      child: _buildEditableText(
                        labelText: widget._address,

                        controller:_addressController ,
                        isEditing:_isEditing ,
                        onEditPressed: () {
                          setState(() {
                            _isEditing=true;
                          });
                        },


                      ),
                    ),
                  ],
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.75,
                    indent: 1,
                    endIndent: 1,
                    height: 20,
                  ),
                ),
                Column(

                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 53,bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Birth-date ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'alethiapro',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding:  EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      child: _buildEditableTextDate(
                        labelText: widget._BirthDate,

                        controller:_BirthDateController ,
                        isEditing:_isEditing ,
                        onEditPressed: () {
                          setState(() {
                            _isEditing=true;
                          });
                        },


                      ),
                    ),
                  ],
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.75,
                    indent: 1,
                    endIndent: 1,
                    height: 20,
                  ),
                ),
                if (_isEditing) ElevatedButton(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 2,
                      color: Color.fromRGBO(255, 215, 0, 5),
                    ),
                    minimumSize: Size(150, 50),
                    backgroundColor: Colors.black87,
                    elevation: 3,
                  ),
                  onPressed: () {


                    Navigator.pushReplacementNamed(context, "/navBottom");
                  },
                ),


                Padding(
                  padding: const EdgeInsets.only(top:20,bottom: 20),
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                      child: Text(
                        "Wishlist",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'alethiapro',
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 2,
                          color: Color.fromRGBO(255, 215, 0, 5),
                        ),
                        minimumSize: Size(120, 50),
                        backgroundColor: Colors.black87,
                        elevation: 3,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/navBottom");
                      },
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top:10,bottom: 30),
                  child: Container(
                    width: 220,
                    child: ElevatedButton(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'alethiapro',
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                        minimumSize: Size(120, 50),
                        backgroundColor: Colors.black87,
                        elevation: 3,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/signin");
                      },
                    ),
                  ),
                ),
              ],
            ),

        ],
      ),
    );
  }
}
