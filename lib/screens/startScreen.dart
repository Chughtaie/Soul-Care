import 'package:flash_chat/utilities/zakatCalculator.dart';

import '../Theme.dart';
import '../screens/welcome_screen.dart';
import '../utilities/qibla.dart';
import '../utilities/tasbeeh.dart';
import 'package:flutter/material.dart';

import 'zakat_calculate.dart';

Color colr = Colors.blue;

class lightMode extends StatefulWidget {
  static const id = 'lightMode';
  @override
  _lightModeState createState() => _lightModeState();
}

class _lightModeState extends State<lightMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colr,
      appBar: AppBar(
        backgroundColor: Color(0xF89456C1),
        leading: IconButton(
          onPressed: () async {
            var colrr = await Navigator.pushNamed(context, themeScreen.id);
            print('ndajkdn   ' + colrr.toString());
            setState(() {
              colr = null;
              colr = colrr;
            });
          },
          icon: Icon(Icons.menu, size: 40),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Soul Care',
                style: TextStyle(
                  fontFamily: 'RockSalt',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Image(
            height: 500,
            image: AssetImage('images/abc.jpg'),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                  child: Icon(Icons.forum_outlined, size: 43),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, home.id);
                  },
                  child: Icon(Icons.touch_app_outlined, size: 43),
                ),
                FlatButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, Qiblaa.id);
                  },
                  child: Icon(Icons.explore_outlined, size: 43),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Zakat.id);
                  },
                  child: Icon(Icons.monetization_on_outlined, size: 43),
                )
              ],
            ),
            color: Color(0xFFD8B0F0),
          )
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: lightMode.id,
      routes: {
        lightMode.id: (context) => lightMode(),
      },
    );
  }
}
