/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/24/19 5:18 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:convert';

import 'package:bflutter/bflutter.dart';
import 'package:bflutter_poc/api.dart';
import 'package:bflutter_poc/model/user_detail.dart';
import 'package:rxdart/rxdart.dart';

/// Implement logic for Home screen
class HomeBloc {
  final getUserInfo = Bloc<String, UserDetail>();

  HomeBloc() {
    _initLogic();
  }

  void _initLogic() {
    getUserInfo.logic = (Observable<String> input) =>
        input.asyncMap(Api().getUserInfo).asyncMap(
              (data) {
            if (data.statusCode == 200) {
              return UserDetail.fromJson(json.decode(data.body));
            } else {
              throw Exception(data.body);
            }
          },
        );
  }

  void getHomeInfo() {
    getUserInfo.push('beesightsoft');
  }

  void dispose() {
    getUserInfo.dispose();
  }
}
