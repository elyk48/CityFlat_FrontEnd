import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

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
  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.blueAccent;
    Color backgroundcolor = shadowColor.withOpacity(0.7);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        child: ListView(
          children: [
            Center(
              heightFactor: 1.3,
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 400,
                  height: 210,
                ),
              ),
            ),
/*
            Container(
                margin: const EdgeInsets.fromLTRB(37, 0, 37, 40),
                alignment: Alignment.topCenter,
                child: Text(
                  'SignIn',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal),
                ),
                width: 200),*/

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
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                        hintText: "exemple@gmail.com",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
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
                      obscureText: _obscureText,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  //continue button
                  Center(
                    child: Listener(
                      onPointerDown: (event) => setState(() {
                        isPressed = true;
                      }),
                      onPointerUp: (event) => setState(() {
                        isPressed = false;
                      }),
                      child: AnimatedContainer(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                            Navigator.pushReplacementNamed(context, '/navBottom');
                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Colors.white, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Login',
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

                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isPressedSignup = true;
                          });
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white60,
                            shadows: [
                              for (double i = 1; i < 2; i++)
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

                  Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.7),
                              indent: 1,
                              endIndent: 0,
                            ),
                          ),
                          Text(
                            "Or connect with",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white60,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.7),
                              indent: 1,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                      children: [
                        //signin with google
                        Flexible(
                          child: Center(
                            child: Listener(
                              onPointerDown: (event) => setState(() {
                                isPressedGog = true;
                              }),
                              onPointerUp: (event) => setState(() {
                                isPressedGog = false;
                              }),
                              child: AnimatedContainer(
                                margin: EdgeInsets.fromLTRB(20, 5, 0, 20),
                                width: 110,
                                height: 44,
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
                                    side: BorderSide(
                                        color: Colors.white, width: 1.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/google_icon.png",
                                        fit: BoxFit.fitWidth,
                                        width: 26,
                                      ),
                                      Text(
                                        'Google',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11,
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
                        ),
                        //sign in with facebook
                        Flexible(
                          child: Center(
                            child: Listener(
                              onPointerDown: (event) => setState(() {
                                isPressedF = true;
                              }),
                              onPointerUp: (event) => setState(() {
                                isPressedF = false;
                              }),
                              child: AnimatedContainer(
                                margin: EdgeInsets.fromLTRB(20, 5, 0, 20),
                                width: 110,
                                height: 44,
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
                                    side: BorderSide(
                                        color: Colors.white, width: 1.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/facebook_icon.png",
                                        fit: BoxFit.fitWidth,
                                        width: 26,
                                      ),
                                      Text(
                                        'Facebook',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
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
                        ),
//sign with apple account
                        Flexible(
                          child: Center(
                            child: Listener(
                              onPointerDown: (event) => setState(() {
                                isPressedA = true;
                              }),
                              onPointerUp: (event) => setState(() {
                                isPressedA = false;
                              }),
                              child: AnimatedContainer(
                                margin: EdgeInsets.fromLTRB(20, 5, 0, 20),
                                width: 110,
                                height: 44,
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
                                    side: BorderSide(
                                        color: Colors.white, width: 1.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/apple_logo.png",
                                        fit: BoxFit.fitWidth,
                                        width: 26,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Apple',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11,
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
                        ),
                      ],
                    ),
                  ),
                  /**********signup here*********/
                 Container(
                   margin: EdgeInsets.only(left: 40,right: 30),
                   child: Center(
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            Text("Dont have account?",style: TextStyle(
                              color: Colors.white70,

                            ),),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isPressedSignup = true;
                                });
                                Navigator.popAndPushNamed(context, "/signup");
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontFamily: 'Poppins',

                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.white60,
                                  shadows: [
                                    for (double i = 1; i < 2; i++)
                                      Shadow(
                                        color: shadowColor,
                                        blurRadius: 3 * i,
                                      ),
                                  ],
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
    );
  }
}
