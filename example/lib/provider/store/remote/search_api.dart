/*
 * Developed by Nhan Cao on 10/28/19 11:08 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter_poc/provider/store/remote/api.dart';
import 'package:dio/dio.dart';

class SearchApi extends Api {
  /// @nhancv 10/7/2019: Search user request
  Future<Response> searchUsers(String query) async {
    final header = await getHeader();
    String url = '$apiBaseUrl/search/users?q=$query';
    return wrapE(() => dio.get(url, options: Options(headers: header)));
  }
}
