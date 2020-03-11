/*
 * Developed by Nhan Cao on 10/28/19 11:17 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:convert';

import 'package:bflutter_poc/provider/store/remote/api.dart';
import 'package:dio/dio.dart';

class AuthApi extends Api {
  /// @nhancv 10/24/2019: Login
  Future<Response> signIn() async {
    final header = await getHeader();
    return wrapE(() => dio.post("https://nhancv.free.beeceptor.com/login",
        options: Options(headers: header),
        data: json.encode({
          "username": "username",
          "password": "password",
        })));
  }

  /// @nhancv 10/24/2019: Login
  Future<Response> signInWithError() async {
    final header = await getHeader();
    return wrapE(() => dio.post("https://nhancv.free.beeceptor.com/login-err",
        options: Options(headers: header),
        data: json.encode({
          "username": "username",
          "password": "password",
        })));
  }
}
