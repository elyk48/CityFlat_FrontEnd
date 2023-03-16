

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
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
  bool agree = false;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.blueAccent;
    Color backgroundcolor = shadowColor.withOpacity(0.7);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Form(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            ////////////////////////////////////////
            Container(
              padding: EdgeInsets.only(top: 30),
              height: 660,
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
                          child: TextFormField(
                            cursorColor: Colors.black,
                            autofocus: false,

                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'AutourOne',
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
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
                                value: agree,
                                onChanged: (value) {
                                  setState(() {
                                    agree = value ?? false;
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
                          height: 20,
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
                                onPressed: () {},
                              ),
                            )),


                        Container(
                          margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
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
                              left: 40, right: 30, bottom: 0, top: 16),
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
