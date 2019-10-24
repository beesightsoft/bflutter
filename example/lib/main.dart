/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/9/19 4:38 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter/bcache.dart';
import 'package:bflutter_poc/global.dart';
import 'package:bflutter_poc/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'search/search_screen.dart';

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
      home: SearchScreen(),
    );
  }
}
