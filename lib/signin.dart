import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPressedGog = false;
  bool _obscureText = true;
  bool isPressed = false;
  bool isPressedSignup = false;
  bool isPressedF = false;
  bool isPressedA = false;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });

    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Form(
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'WELCOME TO',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'alethiapro',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(0),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/cityFlat_logo.png",
                  width: 400,
                  height: 250,
                ),
              ),
            ),

            ////////////////////////////////////////
            Container(
              padding: EdgeInsets.only(top: 30),
              height: 490,
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
                          padding: EdgeInsets.only(top: 0, bottom: 25),
                          alignment: Alignment.topCenter,
                          child: Text(
                            'LOGIN TO YOUR ACCOUNT',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.bold),
                          ),
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
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
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
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
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
                              fontFamily: 'alethiapro',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
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
                              labelStyle: TextStyle(
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

                        //continue button
                        Center(
                            child: ButtonTheme(
                          child: ElevatedButton(
                            child: Text(
                              "Login",
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
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, "/navBottom");
                            },
                          ),
                        )),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isPressedSignup = true;
                                });
                                Navigator.pushNamed(context, "/resetpassword");
                              },
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 58, 127, 5),
                                  fontFamily: 'alethiapro',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                  "Or connect with",
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

                        Row(
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

                        /**********signup here*********/
                        Container(
                          margin: EdgeInsets.only(
                              left: 40, right: 30, bottom: 0, top: 0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dont have account?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'alethiapro',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressedSignup = true;
                                    });
                                    Navigator.popAndPushNamed(
                                        context, "/signup");
                                  },
                                  child: Text(
                                    "Join free today",
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 58, 127, 5),
                                      fontFamily: 'alethiapro',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
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
