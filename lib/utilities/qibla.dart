// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
// //import 'package:flutter_qiblah_example/loading_indicator.dart';



// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: FutureBuilder(
//           future: _deviceSupport,
//           // ignore: non_constant_identifier_names
//           builder: (_, AsyncSnapshot< bool? true > snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting)
//               return LoadingIndicator();
//             if (snapshot.hasError)
//               return Center(
//                 child: Text("Error: ${snapshot.error.toString()}"),
//               );

//             if (snapshot.data!)
//               return QiblahCompass();
//             else
//               return QiblahMaps();
//           },
//         ),
//       );
//     }
// }