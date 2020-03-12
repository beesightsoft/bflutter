/*
 * Developed by Nhan Cao on 1/15/20 3:08 PM.
 * Last modified 1/15/20 3:02 PM.
 * Copyright (c) 2020 Beesight Soft. All rights reserved.
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppHelper {

  static void showPopup(Widget child, BuildContext context,
      {Function onAction}) {
    showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: child,
          );
        });
  }

  static String emailValidate(String email) {
    String error = '';
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (email.isEmpty || email == '' || email == null) {
      error = 'Email is required.';
    } else if (!regex.hasMatch(email)) {
      error = 'Your email format is invalid. Please check again';
    }
    return error;
  }

  ///@TanNguyen 2020-03-10: check internet connection
  static Future<bool> internetConnectionChecking() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
