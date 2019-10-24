/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/8/19 3:59 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:convert';

import 'package:bflutter/bflutter.dart';
import 'package:bflutter_poc/api.dart';
import 'package:bflutter_poc/model/user_detail.dart';
import 'package:rxdart/rxdart.dart';

/// Implement logic for Detail screen
class DetailBloc {
  final loading = BlocDefault<bool>();
  final getUserInfo = Bloc<String, UserDetail>();

  DetailBloc() {
    _initLogic();
  }

  // @nhancv 10/7/2019: Init logic
  void _initLogic() {
    getUserInfo.logic = (Observable<String> input) => input
        .map((input) {
      loading.push(true);
      return input;
    })
        .asyncMap(Api().getUserInfo)
        .asyncMap(
          (data) {
        if (data.statusCode == 200) {
          return UserDetail.fromJson(json.decode(data.body));
        } else {
          throw Exception(data.body);
        }
      },
    )
        .handleError((error) {
      loading.push(false);
      throw error;
    })
        .doOnData((data) {
      loading.push(false);
    });
  }

  void dispose() {
    loading.dispose();
    getUserInfo.dispose();
  }
}
