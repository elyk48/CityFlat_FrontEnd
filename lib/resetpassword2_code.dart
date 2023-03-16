import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
class resetpasswordPagecode extends StatefulWidget {
  const resetpasswordPagecode({Key? key}) : super(key: key);

  @override
  State<resetpasswordPagecode> createState() => _resetpasswordPagecodeState();
}

class _resetpasswordPagecodeState extends State<resetpasswordPagecode> {
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
                  'Password recovery',
                  style: TextStyle(
                      fontSize: 30,
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
                  height: 300,
                ),
              ),
            ),

            ////////////////////////////////////////
            Container(
              padding: EdgeInsets.only(top: 30),
              height: 350,
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
                    padding: EdgeInsets.fromLTRB(26, 0, 26, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 0, bottom: 50),
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Enter the code sent to your email.',
                            style: TextStyle(
                                fontSize: 22,
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

                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: Colors.black38,
                              fillColor: Color.fromRGBO(206, 206, 206, 5),
                              labelText: "Code",
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'alethiapro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'alethiapro',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              hintText: "445899",
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
                          height: 40,
                        ),



                        //continue button
                        Center(
                            child: ButtonTheme(
                              child: ElevatedButton(
                                child: Text(
                                  "Continue",
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
                                  Navigator.popAndPushNamed(
                                      context, "/newpassword");
                                },
                              ),
                            )),


                        Container(
                          margin: EdgeInsets.only(
                              left: 40, right: 30, bottom: 0, top: 10),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Didn't receive code?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'alethiapro',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {


                                  },
                                  child: Text(
                                    "Resend code",
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
