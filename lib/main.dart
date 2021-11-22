import 'package:flutter/material.dart';
import 'package:track/views/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track',
      theme: ThemeData(
        fontFamily: "Proxima",
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
