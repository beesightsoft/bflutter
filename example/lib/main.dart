import 'package:bflutter_poc/global.dart';
import 'package:bflutter_poc/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  Global().env = Env.dev();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}
