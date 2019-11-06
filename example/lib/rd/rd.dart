/*
 * Developed by Nhan Cao on 11/6/19 4:50 PM.
 * Last modified 11/6/19 4:50 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:flutter/material.dart';

class RDApp extends StatefulWidget {
  @override
  _RDAppState createState() => _RDAppState();
}

/// WgFullState
///  + Wg1Statless
///  + Wg1FullState
/// WgStatless
class _RDAppState extends State<RDApp> {
  @override
  Widget build(BuildContext context) {
    print('app build');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: Column(
          children: <Widget>[
            WgFullState(),
            WgStateless(),
          ],
        ),
      ),
    );
  }
}

class WgFullState extends StatefulWidget {
  @override
  _WgFullState1State createState() => _WgFullState1State();
}

class _WgFullState1State extends State<WgFullState> {
  @override
  void initState() {
    print('initState WgFullState');
    super.initState();
  }

  @override
  void didUpdateWidget(WgFullState oldWidget) {
    print('didUpdateWidget WgFullState');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build WgFullState');
    return Container(
      child: RaisedButton(
        onPressed: () {
          setState(() {
            print('setState WgFullState');
          });
        },
      ),
    );
  }
}

class WgStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build wgstateless');
    return Container(
      child: RaisedButton(
        onPressed: () {},
      ),
    );
  }
}
