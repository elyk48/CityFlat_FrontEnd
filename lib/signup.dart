

import 'dart:convert';

import 'package:cityflat/controllers/user_controller.dart';
import 'package:cityflat/entities/user_e.dart';
import 'package:cityflat/session.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPressedGog = false;
  bool _obscureText = true;
  bool isPressed = false;
  bool isPressedSignup = false;
  bool isPressedF = false;
  bool isPressedA = false;
  bool agreeTerms = false;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  late UserE user= new UserE.noarg();
   http.Response? res ;
  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.blueAccent;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Form(

        key: _keyForm,
        child: ListView(
          children: [


            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ////////////////////////////////////////
            Container(
              padding: EdgeInsets.only(top: 30),
              height: 720,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: const GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffad9c00),
                      Color(0xffad9c00),
                      Colors.amberAccent,
                      Color(0xffad9c00),
                      Colors.amberAccent,
                      Color(0xffad9c00),
                      Colors.amberAccent,
                      Color(0xffad9c00),
                      Color(0xffad9c00),
                      Colors.amberAccent,
                      Color(0xffad9c00),
                      Colors.amberAccent,
                      Color(0xffad9c00),
                      Colors.amberAccent,
                      Color(0xffad9c00),
                      Colors.amberAccent,
                      Color(0xffad9c00),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  width: 4.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(26, 0, 26, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          alignment: Alignment.topCenter,
                          child: TextFormField(


                            validator: (value) {

                              if (value == null || value.isEmpty) {
                                return "Name filed address cannot be empty!";
                              } else if (value.length < 6 || value.length>25) {
                                return "Name  length must be between 6 and 25 characters !";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (newValue) {
                              setState(() {
                                user.name = newValue!;
                              });

                            },
                            cursorColor: Colors.black,
                            autofocus: false,

                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.normal,
                                fontSize: 17),
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: Colors.black38,
                              fillColor: Color.fromRGBO(206, 206, 206, 5),
                              labelText: "Name",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AutourOne',
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                              ),
                              hintText: "JhoneDoe",
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
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          alignment: Alignment.topCenter,
                          child: TextFormField(


                            validator: (value) {
                              String pattern =
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                              if (value == null || value.isEmpty) {
                                return "Email address cannot be empty!";
                              } else if (!RegExp(pattern).hasMatch(value)) {
                                return "invalid email address !";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (newValue) {
                              setState(() {
                                user.email = newValue!;
                              });


                            },
                            cursorColor: Colors.black,
                            autofocus: false,
                            focusNode: focusNode1,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'alethiapro',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: Colors.black38,
                              fillColor: Color.fromRGBO(206, 206, 206, 5),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AutourOne',
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                              ),
                              hintText: "exemple@gmail.com",
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
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: TextFormField(

                            onSaved: (value) {
                              setState(() {
                                user.password = value!;
                              });

                            },
                            validator: (value) {

                              String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                              if(value == null || value.isEmpty) {
                                return "Password cannot be empty !";
                              }
                              else if(value.length < 8 ||value.length > 100) {
                                return "password must at east be 8 characters long";
                              }
                              else if(!RegExp(pattern).hasMatch(value)) {
                                return "Invaid password ";
                              }

                              else {
                                return null;
                              }
                            },

                            cursorColor: Colors.black,
                            focusNode: focusNode2,
                            obscureText: _obscureText,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'AutourOne',
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                            decoration: InputDecoration(
                              filled: true,
                              suffixIcon: IconButton(
                                color: Colors.black,
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {

                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              focusColor: Colors.black38,
                              fillColor: Color.fromRGBO(206, 206, 206, 5),
                              labelText: "Password",
                              labelStyle:TextStyle(
                                color: Colors.black,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
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
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          alignment: Alignment.topCenter,
                          child:

                          IntlPhoneField(
onSaved: (newValue) {
  setState(() {
    user.phoneNumber= newValue!.number.toString();
  });


},
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: Colors.black38,
                              fillColor: Color.fromRGBO(206, 206, 206, 5),
                              labelText: "Phone number",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AutourOne',
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                              ),
                              hintText: "+216 52615182",
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

                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.1,
                              child: Checkbox(
                                overlayColor: MaterialStateProperty.all(Colors.black),
                                tristate: false,
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                fillColor: MaterialStateProperty.all(Colors.black),
                                value: agreeTerms,
                                onChanged: (value) {
                                  setState(() {
                                    agreeTerms = value ?? true;
                                  });
                                },
                              ),
                            ),
                            InkWell(
                              child: Text(
                                'I accept the terms and conditions.',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontFamily: 'alethiapro',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () => Navigator.pushNamed(context, "/signup"),
                            ),
                          ],
                        ),
                        //continue button
                        SizedBox(
                          height: 12,
                        ),

                        Center(
                            child: ButtonTheme(
                              child: ElevatedButton(
                                child: Text(
                                  "Create account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'alethiapro',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120, 50),
                                  backgroundColor: Colors.black,
                                  elevation: 1,
                                ),
                                onPressed: () async {


                                  if (_keyForm.currentState!.validate() && agreeTerms==true) {
                                    _keyForm.currentState!.save();
                                    try{
                                     await  UserController.registerUser(user).then(await (value) => {res = value});
                                    }
                                    catch(e){

                                      print(e);
                                    }





                                      if(res!.statusCode==200 ||res!.statusCode==201){

                                        var userFromServer = jsonDecode(res!.body);
                                        Session.setUser_prefs(userFromServer);
                                        print("user created successfully... :  "+userFromServer.toString());

                                        Navigator.pushReplacementNamed(context,'/verify-email');

                                      }
                                      else {
                                        print(res!.reasonPhrase.toString());

                                      }

                                  

                                  }
                                },
                              ),
                            )),


                        Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black.withOpacity(0.7),
                                    indent: 1,
                                    endIndent: 0,
                                  ),
                                ),
                                Text(
                                  "Or sign up with",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'alethiapro',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black.withOpacity(0.7),
                                    indent: 1,
                                    endIndent: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              IconButton(
                                splashRadius: 40,
                                icon:
                                Image.asset("assets/images/google_icon.png"),
                                iconSize: 40,
                                onPressed: () {
                                  print("pressed");
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                splashRadius: 40,
                                icon: Image.asset(
                                    "assets/images/facebook_icon.png"),
                                iconSize: 40,
                                onPressed: () {
                                  print("pressed");
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                splashRadius: 40,
                                icon: Image.asset("assets/images/apple_logo.png"),
                                iconSize: 40,
                                onPressed: () {
                                  print("pressed");
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),

                        /**********signup here*********/
                        Container(
                          margin: EdgeInsets.only(
                              left: 40, right: 30, bottom: 0, top: 0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'alethiapro',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressedSignup = true;
                                    });
                                    Navigator.popAndPushNamed(
                                        context, "/signin");
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 58, 127, 5),
                                      fontFamily: 'alethiapro',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
