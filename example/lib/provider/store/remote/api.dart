/*
 * Developed by Nhan Cao on 10/28/19 11:17 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:async';

import 'package:bflutter/libs/bcache.dart';
import 'package:bflutter_poc/provider/global.dart';
import 'package:bflutter_poc/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  // @nhancv 10/7/2019: Get base url by env
  final String apiBaseUrl = Global.instance.env.apiBaseUrl;
  final Dio dio = new Dio();

  Api() {
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(responseBody: false));
    }
  }

  // @nhancv 10/24/2019: Get header
  Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {'content-type': 'application/json'};
    return header;
  }

  // @nhancv 10/24/2019: Get header
  Future<Map<String, String>> getAuthHeader() async {
    Map<String, String> header = await getHeader();

    header.addAll({"CUSTOM-HEADER-KEY": "CUSTOM-HEADER-KEY"});

    final piece = await BCache.instance.queryId(Constants.bCacheAuthKey);
    if (piece != null && piece.body != null) {
      header.addAll({"Authorization": "Bearer " + piece.body});
    }
    return header;
  }

  Future<Response<dynamic>> wrapE(Function() dioApi) async {
    try {
      return await dioApi();
    } catch (error) {
      var errorMessage = error.toString();
      if (error is DioError && error.type == DioErrorType.RESPONSE) {
        final response = error.response;
        errorMessage =
        'Code ${response.statusCode} - ${response.statusMessage} ${response.data != null ? '\n' : ''} ${response.data}';
        throw new DioError(
            request: error.request,
            response: error.response,
            type: error.type,
            error: errorMessage);
      }
      throw error;
    }
  }
}
