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

/// App
/// WgFullState
///   + Button
///   + Container
///     + Button
///   + SubWgStateless
///     + Container
///   + SubWgFullState
///     + Button
///     + SubWgStateless
/// WgStateless
///   + WgFullState
///     + Button
///     + Container
///       + Button
///     + SubWgStateless
///       + Container
///     + SubWgFullState
///       + Button
///       + SubWgStateless
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
        child: Column(
      children: <Widget>[
        RaisedButton(
          child: Text('WgFullState'),
          onPressed: () {
            setState(() {
              print('setState WgFullState');
            });
          },
        ),
        Container(
          child: RaisedButton(
            child: Text('WgFullState Btn2'),
            onPressed: () {
              setState(() {
                print('setState WgFullState Btn2');
              });
            },
          ),
        ),
        SubWgStateless(),
        SubWgFullState(),
      ],
    ));
  }
}

class SubWgFullState extends StatefulWidget {
  @override
  _SubWgFullStateState createState() => _SubWgFullStateState();
}

class _SubWgFullStateState extends State<SubWgFullState> {
  @override
  void initState() {
    print('initState SubWgFullState');
    super.initState();
  }

  @override
  void didUpdateWidget(SubWgFullState oldWidget) {
    print('didUpdateWidget SubWgFullState');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build SubWgFullState');
    return Container(
        child: Column(
      children: <Widget>[
        RaisedButton(
          child: Text('SubWgFullState'),
          onPressed: () {
            setState(() {
              print('setState SubWgFullState');
            });
          },
        ),
        SubWgStateless()
      ],
    ));
  }
}

class WgStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build WgStateless');
    return Container(
      child: WgFullState(),
    );
  }
}

class SubWgStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build SubWgStateless');
    return Container();
  }
}
