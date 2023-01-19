

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPressed = false;
  bool isPressedGog = false;
  bool isPressedF = false;
  bool isPressedA = false;
  bool isPressedSign= false;
  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.blueAccent;
    Color backgroundcolor = shadowColor.withOpacity(0.7);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        child: ListView(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(37, 92, 37, 40),
                alignment: Alignment.topCenter,
                child: Text(
                  'SignUp',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal),
                ),
                width: 200),
            Padding(
              padding: EdgeInsets.fromLTRB(26, 0, 26, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                        hintText: "exemple@gmail.com",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Listener(
                      onPointerDown: (event) => setState(() {
                        isPressed = true;
                      }),
                      onPointerUp: (event) => setState(() {
                        isPressed = false;
                      }),
                      child: AnimatedContainer(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        width: 340,
                        height: 55,
                        duration: const Duration(microseconds: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isPressed ? backgroundcolor : null,
                          boxShadow: [
                            for (double i = 1; i < 5; i++)
                              BoxShadow(
                                color: shadowColor,
                                blurRadius: (isPressed ? 5 : 3) * i,
                                inset: true,
                              ),
                            for (double i = 1; i < 5; i++)
                              BoxShadow(
                                spreadRadius: -1,
                                color: shadowColor,
                                blurRadius: (isPressed ? 5 : 3) * i,
                                blurStyle: BlurStyle.outer,
                              ),
                          ],
                        ),
                        child: TextButton(
                          onHover: (hovered) => setState(() {
                            this.isPressed = hovered;
                          }),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/signup2");

                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Colors.white, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.white,
                              shadows: [
                                for (double i = 1; i < (isPressed ? 8 : 4); i++)
                                  Shadow(
                                    color: shadowColor,
                                    blurRadius: 3 * i,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Listener(
                          onPointerDown: (event) => setState(() {
                            isPressedF = true;
                          }),
                          onPointerUp: (event) => setState(() {
                            isPressedF = false;
                          }),
                          child: AnimatedContainer(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            width: 340,
                            height: 55,
                            duration: const Duration(microseconds: 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isPressedF ? backgroundcolor : null,
                              boxShadow: [
                                for (double i = 1; i < 5; i++)
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: (isPressedF ? 5 : 3) * i,
                                    inset: true,
                                  ),
                                for (double i = 1; i < 5; i++)
                                  BoxShadow(
                                    spreadRadius: -1,
                                    color: shadowColor,
                                    blurRadius: (isPressedF ? 5 : 3) * i,
                                    blurStyle: BlurStyle.outer,
                                  ),
                              ],
                            ),
                            child: TextButton(
                              onHover: (hovered) => setState(() {
                                this.isPressedF = hovered;
                              }),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.white, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Image.asset(
                                      "assets/images/facebook_icon.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'SignUp with Facebook',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        for (double i = 1;
                                            i < (isPressedF ? 8 : 4);
                                            i++)
                                          Shadow(
                                            color: shadowColor,
                                            blurRadius: 3 * i,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
//google sigin
                      Center(
                        child: Listener(
                          onPointerDown: (event) => setState(() {
                            isPressedGog = true;
                          }),
                          onPointerUp: (event) => setState(() {
                            isPressedGog = false;
                          }),
                          child: AnimatedContainer(
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
                            width: 340,
                            height: 55,
                            duration: const Duration(microseconds: 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isPressedGog ? backgroundcolor : null,
                              boxShadow: [
                                for (double i = 1; i < 5; i++)
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: (isPressedGog ? 5 : 3) * i,
                                    inset: true,
                                  ),
                                for (double i = 1; i < 5; i++)
                                  BoxShadow(
                                    spreadRadius: -1,
                                    color: shadowColor,
                                    blurRadius: (isPressedGog ? 5 : 3) * i,
                                    blurStyle: BlurStyle.outer,
                                  ),
                              ],
                            ),
                            child: TextButton(
                              onHover: (hovered) => setState(() {
                                this.isPressedGog = hovered;
                              }),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.white, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Image.asset(
                                      "assets/images/google_icon.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'SignUp with Google',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        for (double i = 1;
                                            i < (isPressedGog ? 8 : 4);
                                            i++)
                                          Shadow(
                                            color: shadowColor,
                                            blurRadius: 3 * i,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
//apple login
                      Center(
                        child: Listener(
                          onPointerDown: (event) => setState(() {
                            isPressedA = true;
                          }),
                          onPointerUp: (event) => setState(() {
                            isPressedA = false;
                          }),
                          child: AnimatedContainer(
                            margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                            width: 340,
                            height: 55,
                            duration: const Duration(microseconds: 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isPressedA ? backgroundcolor : null,
                              boxShadow: [
                                for (double i = 1; i < 5; i++)
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: (isPressedA ? 5 : 3) * i,
                                    inset: true,
                                  ),
                                for (double i = 1; i < 5; i++)
                                  BoxShadow(
                                    spreadRadius: -1,
                                    color: shadowColor,
                                    blurRadius: (isPressedA ? 5 : 3) * i,
                                    blurStyle: BlurStyle.outer,
                                  ),
                              ],
                            ),
                            child: TextButton(
                              onHover: (hovered) => setState(() {
                                this.isPressedA = hovered;
                              }),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.white, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Image.asset(
                                      "assets/images/apple_logo.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'SignUp with Apple',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        for (double i = 1;
                                            i < (isPressedA ? 8 : 4);
                                            i++)
                                          Shadow(
                                            color: shadowColor,
                                            blurRadius: 3 * i,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isPressedSign= true;
                            });
                            Navigator.pushNamed(context, "/signin");
                          },
                          child: Text( "You already have an account? Click here",style: TextStyle(
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: Colors.white,
                            shadows: [
                              for (double i = 1;
                              i < (isPressedSign ? 8 : 4);
                              i++)
                                Shadow(
                                  color: shadowColor,
                                  blurRadius: 3 * i,
                                ),
                            ],
                          ),),

                        ),

                      ),
                    ],
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
