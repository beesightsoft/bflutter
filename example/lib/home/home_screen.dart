/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/24/19 5:18 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:convert';

import 'package:bflutter_poc/home/home_bloc.dart';
import 'package:bflutter_poc/model/user_detail.dart';
import 'package:bflutter_poc/search/search_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Home screen
/// Auto get beesightsoft github user info
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: _HomeInfo(),
    );
  }
}

class _HomeInfo extends StatefulWidget {
  @override
  __HomeInfoState createState() => __HomeInfoState();
}

class __HomeInfoState extends State<_HomeInfo> {
  var bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _onResume();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: bloc.getUserInfo.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                UserDetail user = snapshot.data;
                return Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                      CachedNetworkImageProvider(user.avatarUrl),
                      radius: 50.0,
                    ),
                    Text(json.encode(snapshot.data))
                  ],
                );
              },
            ),
            RaisedButton(
              child: Text('Search Screen'),
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );

    // on Resume
    _onResume();
  }

  _onResume() {
    bloc.getHomeInfo();
  }
}
