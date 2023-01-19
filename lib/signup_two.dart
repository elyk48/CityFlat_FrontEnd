import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SignUpPageTwo extends StatefulWidget {
  const SignUpPageTwo({Key? key}) : super(key: key);

  @override
  State<SignUpPageTwo> createState() => _SignUpPageTwoState();
}

class _SignUpPageTwoState extends State<SignUpPageTwo> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool isPressed = false;
  bool isPressed_Cancel = false;
  bool agree = false;
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
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white60,
                        ),
                        hintText: "username",
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
                  Container(
                    alignment: Alignment.topCenter,
                    child: TextFormField(
                      obscureText: _obscureText2,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(_obscureText2
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
                            });
                          },
                        ),
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        labelText: " Re_Enter Password",
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
                    height: 10,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Checkbox(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          tristate: false,
                          checkColor: Colors.green,
                          activeColor: Colors.white,
                          fillColor: MaterialStateProperty.all(Colors.white),
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
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.white,
                            shadows: [
                              for (double i = 1;
                              i < 5;
                              i++)
                                Shadow(
                                  color: shadowColor,
                                  blurRadius: 3*i,
                                ),
                            ],
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(context, "/signup"),
                      ),
                    ],
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
                          onPressed: () {},
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
                              fontSize: 17,
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
//cancel button
                  Center(
                    child: Listener(
                      onPointerDown: (event) => setState(() {
                        isPressed_Cancel = true;
                      }),
                      onPointerUp: (event) => setState(() {
                        isPressed_Cancel = false;
                      }),
                      child: AnimatedContainer(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        width: 340,
                        height: 55,
                        duration: const Duration(microseconds: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isPressed_Cancel ? backgroundcolor : null,
                          boxShadow: [
                            for (double i = 1; i < 5; i++)
                              BoxShadow(
                                color: shadowColor,
                                blurRadius: (isPressed_Cancel ? 5 : 3) * i,
                                inset: true,
                              ),
                            for (double i = 1; i < 5; i++)
                              BoxShadow(
                                spreadRadius: -1,
                                color: shadowColor,
                                blurRadius: (isPressed_Cancel ? 5 : 3) * i,
                                blurStyle: BlurStyle.outer,
                              ),
                          ],
                        ),
                        child: TextButton(
                          onHover: (hovered) => setState(() {
                            this.isPressed_Cancel = hovered;
                          }),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, "/signup");
                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Colors.white, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                              color: Colors.white,
                              shadows: [
                                for (double i = 1; i < (isPressed_Cancel ? 8 : 4); i++)
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
