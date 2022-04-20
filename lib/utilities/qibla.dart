// import 'package:flash_chat/Widgets/location.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
// //import 'package:flutter_qiblah_example/loading_indicator.dart';
// import 'package:adhan/adhan.dart';

// class Qiblaa extends StatefulWidget {
//   static const id = "qibla_screen";
//   @override
//   _QiblaaState createState() => _QiblaaState();
// }

// class _QiblaaState extends State<Qiblaa> {
//   final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

//   @override
//   Widget build(BuildContext context) {
//     Location location = new Location();
//     location.getLocation();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//       ),
//       body: ListView(
//         children: [
//           Text(
//             Qibla(
//               Coordinates(location.latitude, location.longitude),
//             ).toString(),
//           )
//         ],
//       ),
//     );
//   }
// }
