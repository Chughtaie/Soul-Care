import 'package:flutter/material.dart';

class themeScreen extends StatefulWidget {
  static const id = "themeScreen";

  @override
  State<themeScreen> createState() => _themeScreenState();
}

class _themeScreenState extends State<themeScreen> {
  var val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Theme'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context, val);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  val = Color(0xFFD32F2F);
                },
                child: CircleAvatar(backgroundColor: Color(0xFFD32F2F)),
              ),
              FlatButton(
                onPressed: () {
                  val = Color(0xFF2196F3);
                },
                child: CircleAvatar(backgroundColor: Color(0xFF2196F3)),
              ),
              FlatButton(
                onPressed: () {
                  val = Color(0xFFFFEB3B);
                },
                child: CircleAvatar(backgroundColor: Color(0xFFFFEB3B)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  val = Color(0xFFF44336);
                },
                child: CircleAvatar(backgroundColor: Color(0xFFF44336)),
              ),
              FlatButton(
                onPressed: () {
                  val = Color(0xFF0288D1);
                },
                child: CircleAvatar(backgroundColor: Color(0xFF0288D1)),
              ),
              FlatButton(
                onPressed: () {
                  val = Color(0xFFFBC02D);
                },
                child: CircleAvatar(backgroundColor: Color(0xFFFFBC02D)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  val = Color(0xFFB71C1C);
                },
                child: CircleAvatar(backgroundColor: Color(0xFFB71C1C)),
              ),
              FlatButton(
                onPressed: () {
                  val = Color(0xFF1A237E);
                },
                child: CircleAvatar(backgroundColor: Color(0xFF1A237E)),
              ),
              FlatButton(
                onPressed: () {
                  val = Color(0xFFF57F17);
                },
                child: CircleAvatar(backgroundColor: Color(0xFFF57F17)),
              ),
            ],
          ),
          /*SliderTheme(
            data: SliderTheme.of(context).copyWith(
              //thumbShape:
              //  RoundSliderThumbShape(enabledThumbRadius: 15.0),
              thumbColor: Colors.lime,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              overlayColor: Color(0x29EB1555),
            ),
            child: Slider(
              value: val.toDouble(),
              min: 120,
              max: 220,
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.white,
              onChanged: (double value) {
                setState(() {
                  val = value.round();
                });
                print('value = $value');
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
