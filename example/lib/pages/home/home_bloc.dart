/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/24/19 5:18 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter/bflutter.dart';
import 'package:bflutter_poc/models/remote/user_detail.dart';
import 'package:bflutter_poc/provider/store/remote/detail_api.dart';
import 'package:rxdart/rxdart.dart';

/// Implement logic for Home screen
class HomeBloc {
  final getUserInfo = Bloc<String, UserDetail>();

  final detailApi = DetailApi();

  HomeBloc() {
    _initLogic();
  }

  void _initLogic() {
    getUserInfo.logic = (Observable<String> input) =>
        input.asyncMap(detailApi.getUserInfo).asyncMap(
          (data) {
            return UserDetail.fromJson(data.data);
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
