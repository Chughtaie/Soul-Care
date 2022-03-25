import 'package:flutter/material.dart';

class home extends StatefulWidget {
  static const id = 'home';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TasbeehCounter();
  }
}

class TasbeehCounter extends State<home> {
  int _tashbehCount = 0;

  void counter() {
    setState(() {
      _tashbehCount = _tashbehCount + 1;
    });
  }

  void refresh() {
    setState(() {
      _tashbehCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tashbeh Counter'),
        backgroundColor: Colors.green,
      ),
      body: new Container(
          child: new Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          new Center(
            child: new Text(
              "Count",
              style: new TextStyle(fontSize: 30.0, color: Colors.greenAccent),
            ),
          ),
          new Expanded(
              child: new Center(
            child: new Text(
              '$_tashbehCount',
              style: new TextStyle(
                  color: _tashbehCount < 50 ? Colors.greenAccent : Colors.red,
                  fontSize: 40.3,
                  fontWeight: FontWeight.w500),
            ),
          )),
          new Expanded(
              child: new Center(
            child: new FlatButton(
                color: Colors.lightGreen,
                textColor: Theme.of(context).buttonColor,
                onPressed: counter,
                child: new Text(
                  "Increase Count!",
                  style: new TextStyle(fontSize: 18.3, color: Colors.black),
                )),
          )),
          new Expanded(
              child: new Center(
            child: new FlatButton(
                color: Colors.lightGreen,
                textColor: Theme.of(context).buttonColor,
                onPressed: refresh,
                child: new Text(
                  "Tasbeeh Reset!",
                  style: new TextStyle(fontSize: 18.3, color: Colors.black),
                )),
          ))
        ],
      )),
    );
  }
}
