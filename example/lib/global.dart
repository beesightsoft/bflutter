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
  static final Global _instance = Global._private();

  Global._private();

  factory Global() => _instance;

  Env env = Env.dev();
}
