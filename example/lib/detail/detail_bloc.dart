import 'dart:convert';

import 'package:bflutter/bflutter.dart';
import 'package:bflutter_poc/api.dart';
import 'package:bflutter_poc/model/user.dart';
import 'package:rxdart/rxdart.dart';

class DetailBloc {
  final loading = BlocDefault<bool>();
  final getUserInfo = Bloc<String, User>();

  DetailBloc() {
    _initGetUserInfoLogic();
  }

  void _initGetUserInfoLogic() {
    getUserInfo.logic = (Observable<String> input) => input
        .map((input) {
          loading.push(true);
          return input;
        })
        .asyncMap(Api().getUserInfo)
        .map(
          (data) {
            if (data.statusCode == 200) {
              return User.fromJson(json.decode(data.body));
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
