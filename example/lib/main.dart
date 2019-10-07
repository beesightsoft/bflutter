import 'package:bflutter/bcache.dart';
import 'package:bflutter_poc/global.dart';
import 'package:bflutter_poc/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  // @nhancv 10/7/2019: Config env
  Global().env = Env.dev();
  // @nhancv 10/7/2019: Init bcaching
  await BCache().init();
  // @nhancv 10/7/2019: Run app
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
