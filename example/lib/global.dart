/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/7/19 3:06 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Environment declare here
class Env {
  Env._({@required this.apiBaseUrl});

  final String apiBaseUrl;

  factory Env.dev() {
    return new Env._(apiBaseUrl: "https://api.github.com");
  }
}

/// Global env
class Global {
  Global._private();

  static final Global _instance = Global._private();

  factory Global() => _instance;

  Env env = Env.dev();
}
