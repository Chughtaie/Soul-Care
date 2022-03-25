import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  MessageBox({
    @required this.text,
    @required this.time,
    this.own,
  });
  final text;
  final Timestamp time;
  final bool own;
  double radius = 40;
  double sides = 130;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
        child: Align(
          alignment: !own ? Alignment.bottomLeft : Alignment.bottomRight,
          child: Material(
            color: own ? Colors.blueAccent : Colors.lightBlueAccent,
            elevation: 5.0,
            borderRadius: own
                ? BorderRadius.only(
                    topLeft: Radius.elliptical(sides, sides),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  )
                : BorderRadius.only(
                    topRight: Radius.elliptical(sides, sides),
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  ),
            child: MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: own ? 20 : 30,
                  left: own ? 30 : 20),
              height: 42.0,
              child: Column(
                // crossAxisAlignment: own ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    text.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      time.toDate().hour.toString() +
                          ':' +
                          time.toDate().minute.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        // child: laterBox( own: own, sides: sides, radius: radius, text: text, time: time),
        /*child: Material(
        borderOnForeground: true,
        elevation: 10,
        borderRadius: own
            ? BorderRadius.only(
                topLeft: Radius.elliptical(sides, sides),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              )
            : BorderRadius.only(
                topRight: Radius.elliptical(sides, sides),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
        color: own ? Colors.blueAccent : Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment:
                own ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text.toString() + '        ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    overflow: TextOverflow.fade),
              ),
              Text(
                time.toDate().hour.toString() +
                    ':' +
                    time.toDate().minute.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
*/
        /*child: Container(
        alignment: own ? Alignment.topRight : Alignment.topLeft,
        //color: own ? Colors.blueAccent : Colors.lightBlueAccent,
        decoration: BoxDecoration(
          color: own ? Colors.blueAccent : Colors.lightBlueAccent,
          borderRadius: own
              ? BorderRadius.only(
                  topLeft: Radius.elliptical(sides, sides),
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                )
              : BorderRadius.only(
                  topRight: Radius.elliptical(sides, sides),
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(children: [
                Text(
                  text.toString(),
                  style: TextStyle(color: Colors.black),
                )
              ]),
            )
          ],
        ),
      ),*/
        );
  }
}
