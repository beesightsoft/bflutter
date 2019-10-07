import 'dart:convert';

import 'package:bflutter_poc/detail/detail_bloc.dart';
import 'package:bflutter_poc/model/user_base.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final UserBase userBase;

  final bloc = DetailBloc();

  DetailScreen({Key key, @required this.userBase}) : super(key: key) {
    if (userBase?.login?.isNotEmpty ?? false) {
      bloc.getUserInfo.push(userBase.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
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
                            backgroundImage:
                                NetworkImage(snapshot.data.avatarUrl),
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
