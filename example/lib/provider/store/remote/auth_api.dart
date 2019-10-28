/*
 * Developed by Nhan Cao on 10/28/19 11:17 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter_poc/provider/store/remote/api.dart';
import 'package:http/http.dart' as http;

class AuthApi extends Api {
  /// @nhancv 10/24/2019: Login
  Future<http.Response> signIn() async {
    final header = await getHeader();
    return http.post("https://nhancv.free.beeceptor.com/login",
        headers: header,
        body: {
          "username": "username",
          "password": "password",
        });
  }

  /// @nhancv 10/24/2019: Login
  Future<http.Response> signInWithError() async {
    final header = await getHeader();
    return http.post("https://nhancv.free.beeceptor.com/login-err",
        headers: header,
        body: {
          "username": "username",
          "password": "password",
        });
  }
}
