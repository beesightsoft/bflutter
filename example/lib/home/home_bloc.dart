import 'dart:convert';

import 'package:bflutter/bflutter.dart';
import 'package:bflutter_poc/api.dart';
import 'package:bflutter_poc/model/user_detail.dart';
import 'package:rxdart/rxdart.dart';

/// Implement logic for Home screen
class HomeBloc {
  final getUserInfo = Bloc<String, User>();

  HomeBloc() {
    _initGetUserInfoLogic();
  }

  void _initGetUserInfoLogic() {
    getUserInfo.logic =
        (Observable<String> input) => input.asyncMap(Api().getUserInfo).asyncMap(
              (data) {
                if (data.statusCode == 200) {
                  return User.fromJson(json.decode(data.body));
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
