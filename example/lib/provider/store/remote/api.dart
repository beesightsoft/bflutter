/*
 * Developed by Nhan Cao on 10/28/19 11:17 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter/libs/bcache.dart';
import 'package:bflutter_poc/provider/global.dart';
import 'package:bflutter_poc/utils/constants.dart';

class Api {
  // @nhancv 10/7/2019: Get base url by env
  final String apiBaseUrl = Global().env.apiBaseUrl;

  // @nhancv 10/24/2019: Get header
  Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      'content-type': 'application/json'
    };
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
}
