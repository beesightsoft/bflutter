/*
 * Developed by Nhan Cao on 10/28/19 11:09 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter_poc/provider/store/remote/api.dart';
import 'package:http/http.dart' as http;

class DetailApi extends Api {
  /// @nhancv 10/7/2019: Get user info request
  Future<http.Response> getUserInfo(String username) async {
    final header = await getHeader();
    String url = '$apiBaseUrl/users/$username';
    return http.get(url, headers: header);
  }
}
