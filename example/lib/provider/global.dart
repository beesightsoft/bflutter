/*
 * Developed by Nhan Cao on 10/28/19 11:07 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Environment declare here
class Env {
  Env._({@required this.apiBaseUrl});

  final String apiBaseUrl;

  factory Env.dev() {
    return Env._(apiBaseUrl: "https://api.github.com");
  }
}

/// Global env
class Global {
  Global._private();

  static final Global _instance = Global._private();

  factory Global({Env environment}) {
    if (environment != null) {
      _instance.env = environment;
    }
    return _instance;
  }

  Env env;
}
