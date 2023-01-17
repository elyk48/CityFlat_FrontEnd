import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cityflat/signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset(
          "assets/images/logoAnimation.gif",

        ),/*Column(
          children: [
            Image.asset('assets/images/logo.png'),

          ],
        ),*/
        backgroundColor: Colors.black,
        splashIconSize: 1200,
        duration: 4000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: Duration(seconds: 1),

        nextScreen: const SignUpPage());


  }
}
