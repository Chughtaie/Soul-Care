import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../Widgets/Rounded_buttons.dart';
//import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      //print(controller.value);
    });

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
  }

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.blueGrey
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: 'main_logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: controller.value * 100,
                    ),
                  ),
                ),
                ColorizeAnimatedTextKit(
                  speed: Duration(seconds: 1),
                  text: ['  Chat'],
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Horizon',
                    fontWeight: FontWeight.w800,
                  ),
                  colors: colorizeColors,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButtons(
              colr: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
                //Go to login screen.
              },
              text: 'Login',
            ),
            RoundButtons(
              colr: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
                //Go to login screen.
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
