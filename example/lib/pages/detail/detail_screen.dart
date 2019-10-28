/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/24/19 5:18 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:convert';

import 'package:bflutter_poc/models/remote/user.dart';
import 'package:bflutter_poc/pages/detail/detail_bloc.dart';
import 'package:bflutter_poc/widgets/bapp_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Detail screen
/// Get user id from search screen
/// Get user info via github public api
class DetailScreen extends StatelessWidget {
  final User userBase;

  final bloc = DetailBloc();

  DetailScreen({Key key, @required this.userBase}) : super(key: key) {
    if (userBase?.login?.isNotEmpty ?? false) {
      bloc.getUserInfo.push(userBase.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(text: "Detail Screen"),
      body: userBase?.login?.isEmpty == null
          ? Container(child: Text('user empty'))
          : Column(
              children: <Widget>[
                Container(
                  child: StreamBuilder(
                    stream: bloc.loading.stream,
                    builder: (context, loading) {
                      if (loading.hasData && loading.data) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: bloc.getUserInfo.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      return Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                snapshot.data.avatarUrl),
                            radius: 50.0,
                          ),
                          Text(json.encode(snapshot.data))
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
