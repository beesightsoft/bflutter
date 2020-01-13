/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/9/19 4:38 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:ui' as ui;

import 'package:bflutter/bflutter.dart';
import 'package:bflutter/libs/bcache.dart';
import 'package:bflutter/provider/main_bloc.dart';
import 'package:bflutter/widgets/app_loading.dart';
import 'package:bflutter_poc/pages/login/login_screen.dart';
import 'package:bflutter_poc/provider/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> myMain() async {
  // @nhancv 2019-10-24: Start services later
  WidgetsFlutterBinding.ensureInitialized();
  // @nhancv 10/23/2019: Init bflutter caching
  await BCache.instance.init();
  // @nhancv 10/23/2019: Run Application
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final mainBloc = MainBloc.instance;

  @override
  Widget build(BuildContext context) {
    /**
     * App flow:
     * - First, login
     * - Second, navigate to Home with auto fetch beesightsoft github info
     * - Then, navigate Search screen
     * - Last, navigate to Detail screen
     */
    return StreamBuilder(
        stream: mainBloc.localeBloc.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            locale: (snapshot.hasData
                ? snapshot.data
                : Locale(ui.window.locale?.languageCode ?? ' en',
                    ui.window.locale.countryCode)),
            supportedLocales: [
              const Locale('en'),
              const Locale('vi'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: AppContent(),
          );
        });
  }
}

class AppContent extends StatelessWidget {
  final mainBloc = MainBloc.instance;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => onAfterBuild(context));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          LoginScreen(),
          StreamBuilder(
            stream: mainBloc.appLoading.stream,
            builder: (context, snapshot) =>
                snapshot.hasData && snapshot.data ? AppLoading() : SizedBox(),
          ),
        ],
      ),
    );
  }

  // @nhancv 10/25/2019: After widget initialized.
  void onAfterBuild(BuildContext context) {
    mainBloc.initContext(context);
  }
}
