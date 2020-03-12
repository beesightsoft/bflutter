/*
 * Developed by Nhan Cao on 1/16/20 1:53 PM.
 * Last modified 1/16/20 1:53 PM.
 * Copyright (c) 2020 Beesight Soft. All rights reserved.
 */

import 'package:bflutter/libs/pair.dart';
import 'package:bflutter_poc/pages/search/search_screen.dart';
import 'package:bflutter_poc/utils/app_asset.dart';
import 'package:bflutter_poc/widgets/screen_widget.dart';
import 'package:bflutter_poc/widgets/sns_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      body: Column(children: <Widget>[
        SnSIconAppBar(
          left: Pair(AppImages.icSearch, () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => SearchScreen()));
          }),
          center: 'Home',
          right: Pair(AppImages.icNoti, () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => SearchScreen()));
          }),
        ),
        Expanded(
          child: _body(),
        ),
      ]),
    );
  }

  Widget _body() {
    return Container();
  }
}
