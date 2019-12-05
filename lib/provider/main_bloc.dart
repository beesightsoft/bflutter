/*
 * Developed by Nhan Cao on 10/28/19 11:16 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */
import 'package:bflutter/bflutter.dart';
import 'package:bflutter/provider/app_bloc.dart';
import 'package:bflutter/widgets/app_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBloc extends AppBloc {
  MainBloc._private() {
    initLogic();
  }
  static final instance = MainBloc._private();

  final appLoading = BlocDefault<bool>();
  final localeBloc = BlocDefault<Locale>();

  BuildContext _context;

  // @nhancv 10/25/2019: Init context, need call this function after root widget initialized.
  //class AppContent extends StatelessWidget {
  //  @override
  //  Widget build(BuildContext context) {
  //    WidgetsBinding.instance.addPostFrameCallback((_) => onAfterBuild(context));
  //
  //    return Scaffold(
  //      backgroundColor: Colors.transparent,
  //      body: Container(),
  //    );
  //  }
  //
  //  // @nhancv 10/25/2019: After widget initialized.
  //  void onAfterBuild(BuildContext context) {
  //    MainBloc().initContext(context);
  //  }
  //}
  void initContext(BuildContext context) {
    _context = context;
  }

  BuildContext getContext() {
    if (_context == null)
      throw Exception(
          'You need to init context after root widget initialized.');
    return _context;
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

  // @nhancv 11/14/2019: Show dialog with full customization
  void showAppDialog(WidgetBuilder builder, {bool barrierDismissible = false}) {
    if (_context == null) return;
    showDialog(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }
}
