/*
 * Developed by Nhan Cao on 10/28/19 11:16 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */
import 'package:flutter/services.dart' show SystemChannels;
import 'package:bflutter/bflutter.dart';
import 'package:bflutter/provider/app_bloc.dart';
import 'package:bflutter/widgets/app_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBloc extends AppBloc {
  MainBloc._private() {
    initLogic();
  }

  static final MainBloc _instance = MainBloc._private();

  factory MainBloc() => _instance;

  final appLoading = BlocDefault<bool>();
  BuildContext _context;

  // @nhancv 10/25/2019: Init context, need call this function after root widget initialized.
  void initContext(BuildContext context) {
    _context = context;
  }

  @override
  void dispose() {
    appLoading.dispose();
  }

  @override
  void initLogic() {}

  /// @nhancv 2019-10-26: Cupertino Page Route push
  void navigatePush(Widget screen) {
    if (_context == null) return;
    Navigator.push(_context, CupertinoPageRoute(builder: (context) => screen));
  }

  /// @nhancv 2019-10-26: Cupertino Page Route push replacement
  void navigateReplace(Widget screen) {
    if (_context == null) return;
    Navigator.pushReplacement(
        _context, CupertinoPageRoute(builder: (context) => screen));
  }

  /// @nhancv 2019-10-26: Dismiss dialog
  void dismissDialog() {
    if (_context == null) return;
    Navigator.pop(_context);
  }

  /// @nhancv 10/25/2019: Show dialog
  void showAlertDialog(String message) {
    if (_context == null) return;
    showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (context) => AppAlertDialog(message: message),
    );
  }
}
