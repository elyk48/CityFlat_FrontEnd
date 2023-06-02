import 'dart:convert';

import 'package:cityflat/controllers/user_controller.dart';
import 'package:cityflat/entities/user_e.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../session.dart';

class Profile_info extends StatefulWidget {
  late String _id;
  late  String _username;
  late  String _email;
  late  String _number;
  late  String _address;
  late  String _BirthDate;
  late String _image;

   Profile_info(this._id, this._username, this._email,
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

  Future<void> UpdateUser(String name ,String email,String number,String address,String birthdate) async {
    late Map<String, dynamic> userFromServ;
    var prefs = await SharedPreferences.getInstance();



      DateFormat inputFormat = DateFormat('MMM d, yyyy');
      DateFormat outputFormat = DateFormat('yyyy-MM-dd');

      DateTime dt = inputFormat.parse(birthdate);
      String formattedDate = outputFormat.format(dt);

      print(formattedDate);

    var response = await UserController.updateUser( name,email,number,address,formattedDate,prefs.getString("user_token").toString(),prefs.getString("user_id").toString() );

    if (response.statusCode == 200) {
      userFromServ = jsonDecode(response.body);

      setState(() {
        user.id = userFromServ["id"];
        user.name = userFromServ["name"];
        user.email = userFromServ["email"];
        user.phoneNumber = userFromServ["number"];
        user.Birthdate = userFromServ["birthdate"];
        user.role = userFromServ["role"];
        user.address = userFromServ["address"];
        user.password = userFromServ["password"];
        user.isVerified = userFromServ["isVerified"];
        user.token=prefs.getString("user_token").toString();
      });

      await Session.setUser_prefs(user.AllToJson());
    } else {
      print("Update failed!! ${response.statusCode}");
      print(response.body);
    }


  }

  bool _isEditing = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _BirthDateController = TextEditingController();
//phoneText
  Widget _buildEditablePhoneText({
    required String labelText,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditPressed,
  }) {
    return Row(
      mainAxisAlignment:
      isEditing ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        isEditing
            ? Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: IntlPhoneField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      initialCountryCode: 'US',
                      onChanged: (value) {
                        setState(() {


                          widget._number=value.number;

                        });

                      },
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'alethiapro',
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
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
            fontWeight: FontWeight.normal,
          ),
        ),
        isEditing
            ? IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              _isEditing = false; // Set _isEditing to false when cancel icon is pressed
            });
          },
          color: Colors.white,
        )
            : IconButton(
          icon: Icon(Icons.edit),
          onPressed: onEditPressed,
          color: Colors.white,
        ),
      ],
    );
  }


  Widget _buildEditableTextEmail({
    required String labelText,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditPressed,
  }) {
    return Row(
      mainAxisAlignment: isEditing ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        isEditing
            ? Expanded(
          child: TextFormField(
            onChanged: (value) {


              setState(() {

                widget._email=value;
              });
            },
            cursorColor: Colors.black,
            autofocus: false,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'alethiapro',
              fontWeight: FontWeight.normal,
              fontSize: 17,
            ),
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
                borderSide: const BorderSide(width: 1.5, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
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
            fontWeight: FontWeight.normal,
          ),
        ),
        isEditing
            ? IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              _isEditing = false; // Set _isEditing to false when cancel icon is pressed
            });
          },
          color: Colors.white,
        )
            : IconButton(
          icon: Icon(Icons.edit),
          onPressed: onEditPressed,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildEditableTextAddress({
    required String labelText,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditPressed,
  }) {
    return Row(
      mainAxisAlignment: isEditing ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        isEditing
            ? Expanded(
          child: TextFormField(
            onChanged: (value) {


              setState(() {

                widget._address=value;
              });
            },
            cursorColor: Colors.black,
            autofocus: false,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'alethiapro',
              fontWeight: FontWeight.normal,
              fontSize: 17,
            ),
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
                borderSide: const BorderSide(width: 1.5, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
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
            fontWeight: FontWeight.normal,
          ),
        ),
        isEditing
            ? IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              _isEditing = false; // Set _isEditing to false when cancel icon is pressed
            });
          },
          color: Colors.white,
        )
            : IconButton(
          icon: Icon(Icons.edit),
          onPressed: onEditPressed,
          color: Colors.white,
        ),
      ],
    );
  }

//datepicker


  Widget _buildEditableTextDate({
    required String labelText,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditPressed,
  }) {
    return Row(
      mainAxisAlignment: isEditing
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        Text(
          controller.text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'alethiapro',
            fontWeight: FontWeight.normal,
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () async {
            setState(() {
              _isEditing = true; // Update _isEditing to true when the edit icon is pressed
            });

            onEditPressed();

            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2026),
            );

            if (selectedDate != null) {
              final formattedDate = DateFormat.yMMMd().format(selectedDate);
              widget._BirthDate= formattedDate;
            }

            // Note: No need to update _isEditing to false here
          },
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildEditableTextName({
    required String labelText,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditPressed,
  }) {
    return Row(
      mainAxisAlignment: isEditing ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        isEditing
            ? Expanded(
          child: TextFormField(
onChanged: (value) {
setState(() {
  widget._username=value;

});

},
            cursorColor: Colors.black,
            autofocus: false,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'alethiapro',
              fontWeight: FontWeight.normal,
              fontSize: 17,
            ),
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
                borderSide: const BorderSide(width: 1.5, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black87),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
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
            fontWeight: FontWeight.normal,
          ),
        ),
        isEditing
            ? IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              _isEditing = false; // Set _isEditing to false when cancel icon is pressed
            });
          },
          color: Colors.white,
        )
            : IconButton(
          icon: Icon(Icons.edit),
          onPressed: onEditPressed,
          color: Colors.white,
        ),
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

    });

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
                      child: _buildEditableTextEmail(
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
                      child: _buildEditablePhoneText(
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
                      child: _buildEditableTextAddress(
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
                  onPressed: () async {
                    try {
                      if (_keyForm.currentState!.validate()) {
                        _keyForm.currentState!.save();

                      }
 print("date 2 "+ widget._BirthDate);
                      _onSavePressed();
                      UpdateUser(
                        widget._username,
                        widget._email,
                        widget._number,
                        widget._address,
                        widget._BirthDate,
                      );

                    } catch (error) {
                      print('An error occurred: $error');
                    }
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
