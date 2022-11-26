import 'package:flutter/material.dart';
import 'package:woldfood/screen/home.dart';
// import 'package:woldfood/screen-org/home.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.green),
      title: 'World Food',
      home: Home(),
    );
  }
}

