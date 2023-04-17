
import 'package:cityflat/session.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/user_controller.dart';
import '../entities/user_e.dart';
import 'package:http/http.dart' as http;
class verifyEmail extends StatefulWidget {
  const verifyEmail({Key? key}) : super(key: key);

  @override
  State<verifyEmail> createState() => _verifyEmailState();
}

class _verifyEmailState extends State<verifyEmail> {

  bool isPressedGog = false;
  late int _code ;
  bool isPressed = false;
  bool isPressedSignup = false;
  bool isPressedF = false;
  bool isPressedA = false;
  bool agree = false;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black87,
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Email verification',
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
                    padding: EdgeInsets.fromLTRB(26, 0, 26, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 0, bottom: 30),
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Enter the code sent to your email-address.',
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

    validator: (value) {


    if (value == null || value.isEmpty) {
    return "Code  cannot be empty!";
    } else if (value.toString().length<4 ||value.toString().length>4) {
    return "Invalid code";
    } else {
    return null;
    }
    },
    onSaved: (newValue) {
    setState(() {
    _code = int.parse(newValue!);
    });


    },
                            cursorColor: Colors.black,
                            autofocus: false,
                            focusNode: focusNode1,
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
                                fontSize: 20,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AutourOne',
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                              hintText: "xxxx",
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
                                  "Verify",
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

    if (_keyForm.currentState!.validate() ) {
      _keyForm.currentState!.save();

      late UserE user= new UserE.noarg();
      var prefs = await SharedPreferences.getInstance();


      await Session.getUser_from_prefs(user).then( (value) {
        user=value;
      });
      print(prefs.getString("user_email"));
      http.Response? res ;
      try{
        await UserController.VerifyUser_email(user.email,_code).then((value) => {res = value});
      }
      catch(e){

        print(e);
      }



      if(res!.statusCode==200 ||res!.statusCode==201){


        Navigator.pushReplacementNamed(context, "/signin");

      }
      else {
        print(res!.reasonPhrase.toString());

      }

    }

                                },
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),


                        TextButton(
                          onPressed: () async {
                            setState(() {

                            });

                            late UserE user= new UserE.noarg();
                            var prefs = await SharedPreferences.getInstance();


                            await Session.getUser_from_prefs(user).then( (value) {
                              user=value;
                            });
                            print(prefs.getString("user_email"));
                            http.Response? res ;
                            try{
                              await UserController.ResendEmailCode(user.email).then((value) => {res = value});
                            }
                            catch(e){

                              print(e);
                            }



                            if(res!.statusCode==200 ||res!.statusCode==201){


                            print("code resent to "+user.email.toString());

                            }
                            else {
                              print(res!.reasonPhrase.toString());

                            }

                          },
                          child: Text(
                            "Resend code",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 58, 127, 5),
                              fontFamily: 'alethiapro',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,

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
